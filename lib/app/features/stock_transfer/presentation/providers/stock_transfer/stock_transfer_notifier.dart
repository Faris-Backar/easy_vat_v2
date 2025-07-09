import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/stock_transfer/stock_transfer_state.dart';
import 'package:easy_vat_v2/app/features/store/domain/entities/store_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final stockTransferProvider =
    StateNotifierProvider<StockTransferNotifier, StockTransferState>((ref) {
  return StockTransferNotifier();
});

class StockTransferNotifier extends StateNotifier<StockTransferState> {
  StockTransferNotifier() : super(StockTransferState.initial()) {
    _loadTaxPreference();
  }

  String stockTransferNo = "";
  DateTime stockTransferDate = DateTime.now();
  String refNo = "";
  StoreEntity? fromStore;
  StoreEntity? toStore;
  String notes = "";
  bool isForEdit = false;
  bool isTaxEnabled = true;

  Future<void> _loadTaxPreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      isTaxEnabled = prefs.getBool("isTaxEnabled") ?? true;
      state = state.copyWith(isTaxEnabled: isTaxEnabled);
    } catch (e) {
      isTaxEnabled = true;
    }
  }
}
