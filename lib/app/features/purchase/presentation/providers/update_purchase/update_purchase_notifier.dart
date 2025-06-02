import 'dart:developer';

import 'package:easy_vat_v2/app/features/cart/domain/entities/cart_entity.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/sales_ledger_notifier/sales_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_invoice_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/purchase_invoice/update_purchase_usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/fetch_purchase_invoice/fetch_purchase_invoice_notifier.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/update_purchase/update_purchase_state.dart';
import 'package:easy_vat_v2/app/features/salesman/presentation/providers/salesman_provider.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/entities/supplier_entity.dart';
import 'package:easy_vat_v2/app/features/supplier/presentation/providers/supplier_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updatePurchaseUsecaseProvider =
    Provider<UpdatePurchaseInvoiceUsecase>((ref) {
  return UpdatePurchaseInvoiceUsecase(
      purchaseRepository: ref.read(purchaseRepositoryProvider));
});

// final updatePurchaseReturnUsecaseProvider =
//     Provider<UpdatePurchaseReturnUsecase>((ref) {
//   return UpdatePurchaseReturnUsecase(
//       purchaseRepository: ref.read(purchaseRepositoryProvider));
// });

// final updatePurchaseOrderUsecaseProvider =
//     Provider<UpdatePurchaseOrderUsecase>((ref) {
//   return UpdatePurchaseOrderUsecase(
//       purchaseRepository: ref.read(purchaseRepositoryProvider));
// });

final updatePurchaseProvider =
    StateNotifierProvider<UpdatePurchaseNotifier, UpdatePurchaseState>((ref) {
  return UpdatePurchaseNotifier(
    updatePurchaseUsecase: ref.read(updatePurchaseUsecaseProvider),
  );
});

class UpdatePurchaseNotifier extends StateNotifier<UpdatePurchaseState> {
  final UpdatePurchaseInvoiceUsecase updatePurchaseUsecase;
  UpdatePurchaseNotifier({
    required this.updatePurchaseUsecase,
  }) : super(UpdatePurchaseState.initial());

  updatePurchaseInvoice({required PurchaseInvoiceModel params}) async {
    try {
      state = UpdatePurchaseState.loading();
      final result = await updatePurchaseUsecase.call(params: params);
      result.fold(
        (l) => state = UpdatePurchaseState.error(message: l.message),
        (r) => state = UpdatePurchaseState.loaded(purchaseInvoiceModel: r),
      );
    } catch (e) {
      state = UpdatePurchaseState.error(message: e.toString());
    }
  }

  reinsertSalesForm(
      PurchaseInvoiceEntity purchaseInvoice, WidgetRef ref) async {
    try {
      final cartPrvd = ref.read(cartProvider.notifier);
      cartPrvd.clearCart();
      cartPrvd.setEditMode(true);
      List<CartEntity> updatedItemsList = [];
      ref.read(supplierNotfierProvider.notifier).getSupplier();
      final supplierList = ref.read(supplierNotfierProvider).supplierList;
      final selectedSupplier = supplierList != null
          ? supplierList.firstWhere((supplier) =>
              supplier.ledgerIDPK?.toLowerCase() ==
              purchaseInvoice.supplierIdfk?.toLowerCase())
          : SupplierEntity(
              ledgerName: purchaseInvoice.supplierName,
              ledgerIDPK: purchaseInvoice.supplierIdfk);
      if (purchaseInvoice.supplierName?.toLowerCase() != "cash") {
        final cashLedger = ref
            .read(cashLedgerNotifierProvider.notifier)
            .getLedgerById(purchaseInvoice.drLedgerIdfk ?? '');

        if (cashLedger != null) {
          cartPrvd.setCashAccount(cashLedger);
        }
      }

      final salesLedger = ref
          .read(salesLedgerNotifierProvider.notifier)
          .getLedgerById(purchaseInvoice.crLedgerIdfk!);
      if (salesLedger != null) {
        cartPrvd.setSalesAccount(salesLedger);
      }

      final soldBy = ref
          .read(salesManProvider.notifier)
          .getSalesManByName(purchaseInvoice.purchasedBy ?? "");
      if (soldBy != null) {
        cartPrvd.setSoldBy(soldBy);
      }
      // final updatedCustomerWithAddress = selectedSupplier.copyWith();
      cartPrvd.setSalesIdpk(purchaseInvoice.supplierIdfk ?? "");
      cartPrvd.setSupplier(selectedSupplier);
      cartPrvd.setSalesNo(purchaseInvoice.purchaseNo?.toString() ?? "");
      cartPrvd.setRefNo(purchaseInvoice.referenceNo ?? "");
      cartPrvd.setSalesDate(purchaseInvoice.purchaseDate ?? DateTime.now());
      cartPrvd.setSalesMode(purchaseInvoice.purchaseMode ?? "Cash");

      // adding items to cart.
      if (purchaseInvoice.purchasedItems?.isNotEmpty == true) {
        for (var index = 0;
            index < purchaseInvoice.purchasedItems!.length;
            index++) {
          final soldItem = purchaseInvoice.purchasedItems![index];
          final itemEntity = cartPrvd.convertPurchasedToItem(soldItem);
          final priceBeforeTax = cartPrvd.calculateBeforeTax(
              retailRate: itemEntity.retailRate ?? 0.0,
              qty: soldItem.actualQty?.toDouble() ?? 0.0);

          // Calculate tax based on tax setting
          final totalTax = cartPrvd.isTaxEnabled
              ? cartPrvd.calculateTotalTax(
                  retailRate: itemEntity.retailRate ?? 0.0,
                  qty: soldItem.actualQty?.toDouble() ?? 0.0,
                  taxPercentage: itemEntity.taxPercentage ?? 0.0)
              : 0.0;

          final grossTotal = cartPrvd.calculateGross(
              retailRate: itemEntity.retailRate ?? 0.0,
              qty: soldItem.actualQty?.toDouble() ?? 0.0,
              discount: soldItem.discount?.toDouble() ?? 0.0);

          final netTotal =
              cartPrvd.calculateNetTotal(grossTotal: grossTotal, tax: totalTax);

          final cartItem = CartEntity(
            cartItemId: (index + 1),
            item: itemEntity,
            qty: soldItem.actualQty?.toDouble() ?? 0.0,
            rate: itemEntity.retailRate ?? 0.0,
            cost: itemEntity.cost ?? 0.0,
            unit: itemEntity.unit ?? "",
            description: soldItem.description ?? "",
            discount: soldItem.discount?.toDouble() ?? 0.0,
            gross: grossTotal,
            tax: totalTax,
            priceBeforeTax: priceBeforeTax,
            netTotal: netTotal,
          );

          updatedItemsList.add(cartItem);
          cartPrvd.getRateSplitUp(item: cartItem);
          cartPrvd.itemsList = updatedItemsList;
        }
      }
    } catch (e) {
      log("purchase reinsert form => $e");
    }
  }
}
