import 'package:easy_vat_v2/app/features/stock_transfer/data/repository/stock_transfer_repository_impl.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/entities/stock_transfer_entity.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/repositories/stock_transfer_repository.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/usecase/params/stock_transfer_params.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/fetch_stock_transfer/fetch_stock_transfer_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stockTransferRepositoryProvider =
    Provider<StockTransferRepository>((ref) {
  return StockTransferRepositoryImpl();
});

final fetchStockTransferNotifierProvider =
    StateNotifierProvider<FetchStockTransferNotifiers, FetchStockTransferState>(
        (ref) {
  return FetchStockTransferNotifiers(
      fetchStockTransferRepository: ref.read(stockTransferRepositoryProvider));
});

class FetchStockTransferNotifiers
    extends StateNotifier<FetchStockTransferState> {
  final StockTransferRepository fetchStockTransferRepository;
  List<StockTransferListEntity>? stockTransfer;
  DateTime? fromDate;
  DateTime? toDate;

  FetchStockTransferNotifiers({required this.fetchStockTransferRepository})
      : super(FetchStockTransferState.initial());

  fetchStockTransfer({required StockTransferParams params}) async {
    state = const FetchStockTransferState.loading();
    final result = await fetchStockTransferRepository.getStockTransfer(
        stockTransferParams: params);
    result.fold(
        (failure) => state =
            FetchStockTransferState.error(message: failure.message), (result) {
      stockTransfer = result.stockTransfer;
      double totalAmount = 0.0;
      for (var i = 0; i < (result.stockTransfer?.length ?? 0); i++) {
        totalAmount += result.stockTransfer?[i].totalNetCost ?? 0.0;
      }
      return state = FetchStockTransferState.success(
          stockTransfer: result.stockTransfer ?? [], totalAmount: totalAmount);
    });
  }

  searchStockTransfer(String query) {
    double totalAmount = 0.0;
    if (query.isEmpty) {
      for (var i = 0; i < (stockTransfer?.length ?? 0.0); i++) {
        totalAmount += stockTransfer?[i].totalNetCost ?? 0.0;
      }
      state = FetchStockTransferState.success(
          stockTransfer: stockTransfer ?? [], totalAmount: totalAmount);
    } else {
      final filteredData = stockTransfer?.where((stockTransfer) {
            return (stockTransfer.referenceNo?.contains(query) ?? false) ||
                (stockTransfer.toStoreName
                        ?.toLowerCase()
                        .contains(query.toLowerCase()) ??
                    false);
          }).toList() ??
          [];
      for (var i = 0; i < (filteredData.length); i++) {
        totalAmount += filteredData[i].totalNetCost ?? 0.0;
      }
      state = FetchStockTransferState.success(
          stockTransfer: filteredData, totalAmount: totalAmount);
    }
  }

  clearDates() {
    fromDate = null;
    toDate = null;
  }
}
