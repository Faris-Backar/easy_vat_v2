import 'package:easy_vat_v2/app/features/stock_transfer/data/model/stock_transfer_request_model.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/usecase/stock_transfer/create_stock_transfer_usecase.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/create_stock_transfer/create_stock_transfer_state.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/fetch_stock_transfer/fetch_stock_transfer_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createStockTransferUsecaseProvider =
    Provider<CreateStockTransferUsecase>((ref) {
  return CreateStockTransferUsecase(
      stockTransferRepository: ref.read(stockTransferRepositoryProvider));
});

final createStockTransferNotifierProvider = StateNotifierProvider<
    CreateStockTransferNotifier, CreateStockTransferState>((ref) {
  return CreateStockTransferNotifier(
      createStockTransferUsecase: ref.read(createStockTransferUsecaseProvider));
});

class CreateStockTransferNotifier
    extends StateNotifier<CreateStockTransferState> {
  final CreateStockTransferUsecase createStockTransferUsecase;
  CreateStockTransferNotifier({required this.createStockTransferUsecase})
      : super(CreateStockTransferState.initial());

  createStockTransfer({required StockTransferRequestModel request}) async {
    state = CreateStockTransferState.initial();
    state = CreateStockTransferState.loading();
    try {
      final result = await createStockTransferUsecase.call(params: request);
      result.fold(
          (l) => state = CreateStockTransferState.failure(l.message),
          (r) => state = CreateStockTransferState.success(
              r.stockTransfer?.first.stockTransferIDPK ?? ""));
    } catch (e) {
      state = CreateStockTransferState.failure(e.toString());
    }
  }
}
