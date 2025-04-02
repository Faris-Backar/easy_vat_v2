import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/features/salesman/data/repository/salesman_repository_impl.dart';
import 'package:easy_vat_v2/app/features/salesman/domain/entity/sales_man_entity.dart';
import 'package:easy_vat_v2/app/features/salesman/domain/repository/sales_man_repository.dart';
import 'package:easy_vat_v2/app/features/salesman/domain/usecase/get_sales_man_usecase.dart';
import 'package:easy_vat_v2/app/features/salesman/presentation/providers/salesman_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final salesManRepositoryProvider = Provider<SalesManRepository>((ref) {
  return SalesmanRepositoryImpl();
});

final getSalesManUsecaseProvider = Provider<GetSalesManUsecase>((ref) {
  return GetSalesManUsecase(
      salesManRepository: ref.read(salesManRepositoryProvider));
});

final salesManProvider =
    StateNotifierProvider<SalesManNotifier, SalesManState>((ref) {
  return SalesManNotifier(
      getSalesMansUsecase: ref.read(getSalesManUsecaseProvider));
});

class SalesManNotifier extends StateNotifier<SalesManState> {
  final GetSalesManUsecase getSalesMansUsecase;

  List<SalesManEntity> salesManList = [];
  SalesManNotifier({required this.getSalesMansUsecase})
      : super(SalesManState.initial());

  getSalesMans({bool isRequired = false}) async {
    if (salesManList.isNotEmpty && !isRequired) {
      state = SalesManState.loaded(salesManList: salesManList);
    } else {
      state = SalesManState.loading();
      try {
        final result = await getSalesMansUsecase.call(params: NoParams());
        result.fold((l) => state = SalesManState.error(l.message), (r) {
          salesManList = r;
          state = SalesManState.loaded(salesManList: r);
        });
      } on Failure catch (e) {
        state = SalesManState.error(e.message.toString());
      } catch (e) {
        state = SalesManState.error(e.toString());
      }
    }
  }
}
