import 'package:easy_vat_v2/app/features/stock_transfer/data/model/stock_transfer_request_model.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/usecase/stock_transfer/update_stock_transfer_usecase.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/fetch_stock_transfer/fetch_stock_transfer_notifier.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/update_stock_transfer/update_stock_transfer_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateStockTransferUsecaseProvider =
    Provider<UpdateStockTransferUsecase>((ref) {
  return UpdateStockTransferUsecase(
      stockTransferRepository: ref.read(stockTransferRepositoryProvider));
});

final updateStockTransferNotifierProvider = StateNotifierProvider<
    UpdateStockTransferNotifier, UpdateStockTransferState>((ref) {
  return UpdateStockTransferNotifier(
      updateStockTransferUsecase: ref.read(updateStockTransferUsecaseProvider));
});

class UpdateStockTransferNotifier
    extends StateNotifier<UpdateStockTransferState> {
  final UpdateStockTransferUsecase updateStockTransferUsecase;

  UpdateStockTransferNotifier({required this.updateStockTransferUsecase})
      : super(UpdateStockTransferState.initial());

  updateStockTransfer({required StockTransferRequestModel request}) async {
    state = UpdateStockTransferState.initial();
    state = UpdateStockTransferState.loading();
    try {
      final result = await updateStockTransferUsecase.call(params: request);
      result.fold((l) => state = UpdateStockTransferState.failure(l.message),
          (r) => state = UpdateStockTransferState.success());
    } catch (e) {
      state = UpdateStockTransferState.failure(e.toString());
    }
  }
}
