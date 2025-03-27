import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeCategoryData {
  HomeCategoryData._();

  static List<HomeDataModel> quickItemsData(BuildContext context) => [
        HomeDataModel(
            category: AppStrings.quickItems,
            label: context.translate(AppStrings.pos),
            icon: Assets.icons.pos,
            darkIcon: Assets.icons.dark.posDark,
            pagePath: AppRouter.pos),
        HomeDataModel(
            category: AppStrings.quickItems,
            label: context.translate(AppStrings.salesInvoice),
            icon: Assets.icons.sales,
            darkIcon: Assets.icons.dark.salesInoviceDark,
            pagePath: AppRouter.salesInvoice),
        HomeDataModel(
            category: AppStrings.purchaseInvoice,
            label: context.translate(AppStrings.purchaseInvoice),
            icon: Assets.icons.purchaseInvoice,
            darkIcon: Assets.icons.dark.purchaseInvoiceDark,
            pagePath: AppRouter.purchaseInvoice),
        HomeDataModel(
            category: AppStrings.quickItems,
            label: context.translate(AppStrings.ledger),
            icon: Assets.icons.ledger,
            darkIcon: Assets.icons.dark.ledgerDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.quickItems,
            label: context.translate(AppStrings.customer),
            icon: Assets.icons.customer,
            darkIcon: Assets.icons.dark.customerDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.quickItems,
            label: context.translate(AppStrings.supplier),
            icon: Assets.icons.supplier,
            darkIcon: Assets.icons.dark.supplierDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.quickItems,
            label: context.translate(AppStrings.journal),
            icon: Assets.icons.journal,
            darkIcon: Assets.icons.dark.journalDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.quickItems,
            label: context.translate(AppStrings.salesReturn),
            icon: Assets.icons.salesReturn,
            darkIcon: Assets.icons.dark.salesReturnDark,
            pagePath: AppRouter.salesReturn),
        HomeDataModel(
            category: AppStrings.quickItems,
            label: context.translate(AppStrings.purchaseReturn),
            icon: Assets.icons.purchaseReturn,
            darkIcon: Assets.icons.dark.purchaseReturnDark,
            pagePath: AppRouter.purchaseReturn),
        HomeDataModel(
            category: AppStrings.quickItems,
            label: context.translate(AppStrings.items),
            icon: Assets.icons.items,
            darkIcon: Assets.icons.dark.itemsDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.quickItems,
            label: context.translate(AppStrings.reciept),
            icon: Assets.icons.pos,
            darkIcon: Assets.icons.dark.posDark,
            pagePath: AppRouter.pos),
        HomeDataModel(
            category: AppStrings.quickItems,
            label: context.translate(AppStrings.payment),
            icon: Assets.icons.payment,
            darkIcon: Assets.icons.dark.paymentDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.quickItems,
            label: context.translate(AppStrings.contra),
            icon: Assets.icons.contra,
            darkIcon: Assets.icons.dark.contraDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.quickItems,
            label: context.translate(AppStrings.expenses),
            icon: Assets.icons.expenses,
            darkIcon: Assets.icons.dark.expansesDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.quickItems,
            label: context.translate(AppStrings.income),
            icon: Assets.icons.income,
            darkIcon: Assets.icons.dark.incomeDark,
            pagePath: ""),
      ];

  static List<HomeDataModel> masterData(BuildContext context) => [
        HomeDataModel(
            category: AppStrings.masterData,
            label: context.translate(AppStrings.ledgerGroup),
            icon: Assets.icons.ledgerGroup,
            darkIcon: Assets.icons.dark.ledgerGroupDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.masterData,
            label: context.translate(AppStrings.ledger),
            icon: Assets.icons.ledger,
            darkIcon: Assets.icons.dark.ledgerDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.masterData,
            label: context.translate(AppStrings.customer),
            icon: Assets.icons.customer,
            darkIcon: Assets.icons.dark.customerDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.masterData,
            label: context.translate(AppStrings.supplier),
            icon: Assets.icons.supplier,
            darkIcon: Assets.icons.dark.supplierDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.masterData,
            label: context.translate(AppStrings.bank),
            icon: Assets.icons.bank,
            darkIcon: Assets.icons.dark.bankDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.masterData,
            label: context.translate(AppStrings.items),
            icon: Assets.icons.items,
            darkIcon: Assets.icons.dark.itemsDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.masterData,
            label: context.translate(AppStrings.store),
            icon: Assets.icons.store,
            darkIcon: Assets.icons.dark.storeDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.masterData,
            label: context.translate(AppStrings.serviceJob),
            icon: Assets.icons.serviceJob,
            darkIcon: Assets.icons.dark.serviceJobDark,
            pagePath: ""),
        HomeDataModel(
            category: context.translate(AppStrings.masterData),
            label: context.translate(AppStrings.vehicleRegistration),
            icon: Assets.icons.vehicleRegistration,
            darkIcon: Assets.icons.dark.vehicleRegistrationDark,
            pagePath: ""),
      ];

  static List<HomeDataModel> inventoryVoucher(BuildContext context) => [
        HomeDataModel(
            category: AppStrings.inventoryVoucher,
            label: context.translate(AppStrings.salesQuatation),
            icon: Assets.icons.sales,
            darkIcon: Assets.icons.dark.salesOrdersDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.inventoryVoucher,
            label: context.translate(AppStrings.salesOrder),
            icon: Assets.icons.salesOrders,
            darkIcon: Assets.icons.dark.salesOrdersDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.inventoryVoucher,
            label: context.translate(AppStrings.purchaseOrder),
            icon: Assets.icons.purchaseOrder,
            darkIcon: Assets.icons.dark.purchaseOrderDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.inventoryVoucher,
            label: context.translate(AppStrings.goodsReciept),
            icon: Assets.icons.reciept,
            darkIcon: Assets.icons.dark.recieptDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.inventoryVoucher,
            label: context.translate(AppStrings.production),
            icon: Assets.icons.production,
            darkIcon: Assets.icons.dark.productionDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.inventoryVoucher,
            label: context.translate(AppStrings.replaceStockItems),
            icon: Assets.icons.replaceStockItems,
            darkIcon: Assets.icons.dark.itemsDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.inventoryVoucher,
            label: context.translate(AppStrings.replaceStockItems),
            icon: Assets.icons.replaceStockItems,
            darkIcon: Assets.icons.dark.replaceStockItemsDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.inventoryVoucher,
            label: context.translate(AppStrings.repacking),
            icon: Assets.icons.repacking,
            darkIcon: Assets.icons.dark.repackingDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.inventoryVoucher,
            label: context.translate(AppStrings.stockTransfer),
            icon: Assets.icons.stockTransfer,
            darkIcon: Assets.icons.dark.stockTransferDark,
            pagePath: ""),
      ];

  static List<HomeDataModel> accountVoucher(BuildContext context) => [
        HomeDataModel(
            category: AppStrings.accountVoucher,
            label: context.translate(AppStrings.salesInvoice),
            icon: Assets.icons.sales,
            darkIcon: Assets.icons.dark.salesInoviceDark,
            pagePath: AppRouter.salesInvoice),
        HomeDataModel(
            category: AppStrings.accountVoucher,
            label: context.translate(AppStrings.salesReturn),
            icon: Assets.icons.salesReturn,
            darkIcon: Assets.icons.dark.salesReturnDark,
            pagePath: AppRouter.salesReturn),
        HomeDataModel(
            category: AppStrings.accountVoucher,
            label: context.translate(AppStrings.creditNote),
            icon: Assets.icons.creditNote,
            darkIcon: Assets.icons.dark.creditNoteDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.accountVoucher,
            label: context.translate(AppStrings.purchaseInvoice),
            icon: Assets.icons.purchaseInvoice,
            darkIcon: Assets.icons.dark.purchaseInvoiceDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.accountVoucher,
            label: context.translate(AppStrings.expenseInvoice),
            icon: Assets.icons.expenses,
            darkIcon: Assets.icons.dark.expansesDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.accountVoucher,
            label: context.translate(AppStrings.purchaseReturn),
            icon: Assets.icons.purchaseReturn,
            darkIcon: Assets.icons.dark.purchaseReturnDark,
            pagePath: AppRouter.purchaseReturn),
        HomeDataModel(
            category: AppStrings.accountVoucher,
            label: context.translate(AppStrings.debitNote),
            icon: Assets.icons.debitNote,
            darkIcon: Assets.icons.dark.debitNoteDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.accountVoucher,
            label: context.translate(AppStrings.reciept),
            icon: Assets.icons.reciept,
            darkIcon: Assets.icons.dark.recieptDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.accountVoucher,
            label: context.translate(AppStrings.payment),
            icon: Assets.icons.payment,
            darkIcon: Assets.icons.dark.paymentDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.accountVoucher,
            label: context.translate(AppStrings.journal),
            icon: Assets.icons.journal,
            darkIcon: Assets.icons.dark.journalDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.accountVoucher,
            label: context.translate(AppStrings.contra),
            icon: Assets.icons.contra,
            darkIcon: Assets.icons.dark.contraDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.accountVoucher,
            label: context.translate(AppStrings.dividend),
            icon: Assets.icons.dividend,
            darkIcon: Assets.icons.dark.dividendDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.accountVoucher,
            label: context.translate(AppStrings.contra),
            icon: Assets.icons.contra,
            darkIcon: Assets.icons.dark.contraDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.accountVoucher,
            label: context.translate(AppStrings.income),
            icon: Assets.icons.income,
            darkIcon: Assets.icons.dark.incomeDark,
            pagePath: ""),
      ];

  static List<HomeDataModel> hrmData(BuildContext context) => [
        HomeDataModel(
            category: AppStrings.accountVoucher,
            label: context.translate(AppStrings.employeeRegistration),
            icon: Assets.icons.employee,
            darkIcon: Assets.icons.dark.employeeDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.accountVoucher,
            label: context.translate(AppStrings.salaryProcessing),
            icon: Assets.icons.salaryProcessing,
            darkIcon: Assets.icons.dark.salaryProcessingDark,
            pagePath: ""),
        HomeDataModel(
            category: AppStrings.accountVoucher,
            label: context.translate(AppStrings.salaryPayment),
            icon: Assets.icons.salaryPayment,
            darkIcon: Assets.icons.dark.salaryPaymentDark,
            pagePath: ""),
      ];
}

class HomeDataModel {
  final String category;
  final String label;
  final String icon;
  final String darkIcon;
  final String pagePath;

  HomeDataModel(
      {required this.category,
      required this.label,
      required this.icon,
      required this.pagePath,
      required this.darkIcon});
}
