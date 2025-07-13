import 'package:easy_vat_v2/app/features/stock_transfer/domain/usecase/params/stock_transfer_params.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/usecase/stock_transfer/delete_stock_transfer_usecase.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/delete_stock_transfer/delete_stock_transfer_state.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/fetch_stock_transfer/fetch_stock_transfer_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteStockTransferUsecase = Provider<DeleteStockTransferUsecase>((ref) {
  return DeleteStockTransferUsecase(
      stockTransferRepository: ref.read(stockTransferRepositoryProvider));
});

final deleteStockTransferNotifierProvider = StateNotifierProvider<
    DeleteStockTransferNotifier, DeleteStockTransferState>((ref) {
  return DeleteStockTransferNotifier(
      deleteStockTransferUsecase: ref.read(deleteStockTransferUsecase));
});

class DeleteStockTransferNotifier
    extends StateNotifier<DeleteStockTransferState> {
  final DeleteStockTransferUsecase deleteStockTransferUsecase;
  DeleteStockTransferNotifier({required this.deleteStockTransferUsecase})
      : super(DeleteStockTransferState.initial());

  deleteStockTransfer({required StockTransferParams request}) async {
    state = DeleteStockTransferState.initial();
    state = DeleteStockTransferState.loading();
    try {
      final result = await deleteStockTransferUsecase.call(params: request);

      result.fold((l) => state = DeleteStockTransferState.failure(l.message),
          (r) => state = DeleteStockTransferState.success());
    } catch (e) {
      state = DeleteStockTransferState.failure(e.toString());
    }
  }
}
