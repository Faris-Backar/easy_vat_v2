part of 'sales_notifier.dart';

@freezed
class SalesState with _$SalesState {
  const factory SalesState(
      {String? salesNo,
      String? refNo,
      DateTime? saleDate,
      CustomerEntity? selectedCustomer,
      String? salesMode,
      SalesManEntity? soldBy,
      LedgerAccountEntity? cashAccount,
      LedgerAccountEntity? salesAccount,
      String? expenseNo,
      String? paymentMode,
      LedgerAccountEntity? drledger,
      LedgerAccountEntity? crledger,
      DateTime? expenseDate,
      bool? isForUpdate}) = _SalesState;

  factory SalesState.initial() => SalesState(
      salesNo: null,
      cashAccount: null,
      refNo: null,
      salesAccount: null,
      salesMode: null,
      soldBy: null,
      saleDate: DateTime.now(),
      expenseNo: null,
      paymentMode: null,
      expenseDate: DateTime.now(),
      drledger: null,
      crledger: null,
      isForUpdate: false,
      selectedCustomer: null);
}
