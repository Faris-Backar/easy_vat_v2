import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';

class HomeCategoryData {
  HomeCategoryData._();

  static List<HomeDataModel> quickItemsData = [
    HomeDataModel(
        category: AppStrings.quickItems,
        label: AppStrings.pos,
        icon: Assets.icons.pos,
        darkIcon: Assets.icons.dark.posDark,
        pagePath: AppRouter.pos),
    HomeDataModel(
        category: AppStrings.quickItems,
        label: AppStrings.salesInvoice,
        icon: Assets.icons.sales,
        darkIcon: Assets.icons.dark.salesInoviceDark,
        pagePath: AppRouter.salesInvoice),
    HomeDataModel(
        category: AppStrings.purchaseInvoice,
        label: AppStrings.purchaseInvoice,
        icon: Assets.icons.purchaseInvoice,
        darkIcon: Assets.icons.dark.purchaseInvoiceDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.quickItems,
        label: AppStrings.ledger,
        icon: Assets.icons.ledger,
        darkIcon: Assets.icons.dark.ledgerDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.quickItems,
        label: AppStrings.customer,
        icon: Assets.icons.customer,
        darkIcon: Assets.icons.dark.customerDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.quickItems,
        label: AppStrings.supplier,
        icon: Assets.icons.supplier,
        darkIcon: Assets.icons.dark.supplierDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.quickItems,
        label: AppStrings.journal,
        icon: Assets.icons.journal,
        darkIcon: Assets.icons.dark.journalDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.quickItems,
        label: AppStrings.salesReturn,
        icon: Assets.icons.salesReturn,
        darkIcon: Assets.icons.dark.salesReturnDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.quickItems,
        label: AppStrings.purchaseReturn,
        icon: Assets.icons.purchaseReturn,
        darkIcon: Assets.icons.dark.purchaseReturnDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.quickItems,
        label: AppStrings.items,
        icon: Assets.icons.items,
        darkIcon: Assets.icons.dark.itemsDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.quickItems,
        label: AppStrings.reciept,
        icon: Assets.icons.pos,
        darkIcon: Assets.icons.dark.posDark,
        pagePath: AppRouter.pos),
    HomeDataModel(
        category: AppStrings.quickItems,
        label: AppStrings.payment,
        icon: Assets.icons.payment,
        darkIcon: Assets.icons.dark.paymentDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.quickItems,
        label: AppStrings.contra,
        icon: Assets.icons.contra,
        darkIcon: Assets.icons.dark.contraDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.quickItems,
        label: AppStrings.expenses,
        icon: Assets.icons.expenses,
        darkIcon: Assets.icons.dark.expansesDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.quickItems,
        label: AppStrings.income,
        icon: Assets.icons.income,
        darkIcon: Assets.icons.dark.incomeDark,
        pagePath: ""),
  ];

  static List<HomeDataModel> masterData = [
    HomeDataModel(
        category: AppStrings.masterData,
        label: AppStrings.ledgerGroup,
        icon: Assets.icons.ledgerGroup,
        darkIcon: Assets.icons.dark.ledgerGroupDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.masterData,
        label: AppStrings.ledger,
        icon: Assets.icons.ledger,
        darkIcon: Assets.icons.dark.ledgerDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.masterData,
        label: AppStrings.customer,
        icon: Assets.icons.customer,
        darkIcon: Assets.icons.dark.customerDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.masterData,
        label: AppStrings.supplier,
        icon: Assets.icons.supplier,
        darkIcon: Assets.icons.dark.supplierDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.masterData,
        label: AppStrings.bank,
        icon: Assets.icons.bank,
        darkIcon: Assets.icons.dark.bankDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.masterData,
        label: AppStrings.items,
        icon: Assets.icons.items,
        darkIcon: Assets.icons.dark.itemsDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.masterData,
        label: AppStrings.store,
        icon: Assets.icons.store,
        darkIcon: Assets.icons.dark.storeDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.masterData,
        label: AppStrings.serviceJob,
        icon: Assets.icons.serviceJob,
        darkIcon: Assets.icons.dark.serviceJobDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.masterData,
        label: AppStrings.vehicleRegistration,
        icon: Assets.icons.vehicleRegistration,
        darkIcon: Assets.icons.dark.vehicleRegistrationDark,
        pagePath: ""),
  ];

  static List<HomeDataModel> inventoryVoucher = [
    HomeDataModel(
        category: AppStrings.inventoryVoucher,
        label: AppStrings.salesQuatation,
        icon: Assets.icons.sales,
        darkIcon: Assets.icons.dark.salesOrdersDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.inventoryVoucher,
        label: AppStrings.salesOrder,
        icon: Assets.icons.salesOrders,
        darkIcon: Assets.icons.dark.salesOrdersDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.inventoryVoucher,
        label: AppStrings.purchaseOrder,
        icon: Assets.icons.purchaseOrder,
        darkIcon: Assets.icons.dark.purchaseOrderDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.inventoryVoucher,
        label: AppStrings.goodsReciept,
        icon: Assets.icons.reciept,
        darkIcon: Assets.icons.dark.recieptDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.inventoryVoucher,
        label: AppStrings.production,
        icon: Assets.icons.production,
        darkIcon: Assets.icons.dark.productionDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.inventoryVoucher,
        label: AppStrings.replaceStockItems,
        icon: Assets.icons.replaceStockItems,
        darkIcon: Assets.icons.dark.itemsDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.inventoryVoucher,
        label: AppStrings.replaceStockItems,
        icon: Assets.icons.replaceStockItems,
        darkIcon: Assets.icons.dark.replaceStockItemsDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.inventoryVoucher,
        label: AppStrings.repacking,
        icon: Assets.icons.repacking,
        darkIcon: Assets.icons.dark.repackingDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.inventoryVoucher,
        label: AppStrings.stockTransfer,
        icon: Assets.icons.stockTransfer,
        darkIcon: Assets.icons.dark.stockTransferDark,
        pagePath: ""),
  ];

  static List<HomeDataModel> accountVoucher = [
    HomeDataModel(
        category: AppStrings.accountVoucher,
        label: AppStrings.salesInvoice,
        icon: Assets.icons.sales,
        darkIcon: Assets.icons.dark.salesInoviceDark,
        pagePath: AppRouter.salesInvoice),
    HomeDataModel(
        category: AppStrings.accountVoucher,
        label: AppStrings.salesReturn,
        icon: Assets.icons.salesReturn,
        darkIcon: Assets.icons.dark.salesReturnDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.accountVoucher,
        label: AppStrings.creditNote,
        icon: Assets.icons.creditNote,
        darkIcon: Assets.icons.dark.creditNoteDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.accountVoucher,
        label: AppStrings.purchaseInvoice,
        icon: Assets.icons.purchaseInvoice,
        darkIcon: Assets.icons.dark.purchaseInvoiceDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.accountVoucher,
        label: AppStrings.expenseInvoice,
        icon: Assets.icons.expenses,
        darkIcon: Assets.icons.dark.expansesDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.accountVoucher,
        label: AppStrings.purchaseReturn,
        icon: Assets.icons.purchaseReturn,
        darkIcon: Assets.icons.dark.purchaseReturnDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.accountVoucher,
        label: AppStrings.debitNote,
        icon: Assets.icons.debitNote,
        darkIcon: Assets.icons.dark.debitNoteDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.accountVoucher,
        label: AppStrings.reciept,
        icon: Assets.icons.reciept,
        darkIcon: Assets.icons.dark.recieptDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.accountVoucher,
        label: AppStrings.payment,
        icon: Assets.icons.payment,
        darkIcon: Assets.icons.dark.paymentDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.accountVoucher,
        label: AppStrings.journal,
        icon: Assets.icons.journal,
        darkIcon: Assets.icons.dark.journalDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.accountVoucher,
        label: AppStrings.contra,
        icon: Assets.icons.contra,
        darkIcon: Assets.icons.dark.contraDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.accountVoucher,
        label: AppStrings.dividend,
        icon: Assets.icons.dividend,
        darkIcon: Assets.icons.dark.dividendDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.accountVoucher,
        label: AppStrings.contra,
        icon: Assets.icons.contra,
        darkIcon: Assets.icons.dark.contraDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.accountVoucher,
        label: AppStrings.income,
        icon: Assets.icons.income,
        darkIcon: Assets.icons.dark.incomeDark,
        pagePath: ""),
  ];

  static List<HomeDataModel> hrmData = [
    HomeDataModel(
        category: AppStrings.accountVoucher,
        label: AppStrings.employeeRegistration,
        icon: Assets.icons.employee,
        darkIcon: Assets.icons.dark.employeeDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.accountVoucher,
        label: AppStrings.salaryProcessing,
        icon: Assets.icons.salaryProcessing,
        darkIcon: Assets.icons.dark.salaryProcessingDark,
        pagePath: ""),
    HomeDataModel(
        category: AppStrings.accountVoucher,
        label: AppStrings.salaryPayment,
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
