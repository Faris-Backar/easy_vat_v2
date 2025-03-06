import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/salesman/data/repository/salesman_repository_impl.dart';
import 'package:easy_vat_v2/app/features/salesman/domain/repository/sales_man_repository.dart';
import 'package:easy_vat_v2/app/features/salesman/domain/usecase/get_sales_man_usecase.dart';
import 'package:easy_vat_v2/app/features/salesman/presentation/providers/salesman_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final salesManRepositoryProvider = Provider<SalesManRepository>((ref) {
  return SalesmanRepositoryImpl(client: ref.read(dioProvider));
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
  SalesManNotifier({required this.getSalesMansUsecase})
      : super(SalesManState.initial());

  getSalesMans() async {
    state = SalesManState.loading();
    try {
      final result = await getSalesMansUsecase.call(params: NoParams());
      result.fold(
        (l) => state = SalesManState.error(l.message),
        (r) => state = SalesManState.loaded(salesManList: r),
      );
    } on Failure catch (e) {
      state = SalesManState.error(e.message.toString());
    } catch (e) {
      state = SalesManState.error(e.toString());
    }
  }
}
