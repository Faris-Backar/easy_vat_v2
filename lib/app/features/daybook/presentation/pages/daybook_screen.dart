import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/daybook/presentation/widgets/daybook_appbar.dart';
import 'package:easy_vat_v2/app/features/daybook/presentation/widgets/daybook_shimmer_widget.dart';
import 'package:easy_vat_v2/app/features/daybook/presentation/widgets/daybook_transaction_card.dart';
import 'package:easy_vat_v2/app/features/daybook/presentation/widgets/daybook_transaction_filter_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:easy_vat_v2/app/core/extensions/extensions.dart';

@RoutePage()
class DayBookScreen extends StatefulWidget {
  const DayBookScreen({super.key});

  @override
  State<DayBookScreen> createState() => _DayBookScreenState();
}

class _DayBookScreenState extends State<DayBookScreen> {
  ValueNotifier<DateTime> selectedDateNotifier = ValueNotifier(DateTime.now());
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  bool _isAppBarCollapsed = false;
  String _searchQuery = '';
  final ValueNotifier<TransactionCategory> selectedCategoryNotifier =
      ValueNotifier(TransactionCategory.all);
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    const double threshold = 200.0;
    final bool isCollapsed =
        _scrollController.hasClients && _scrollController.offset > threshold;

    if (isCollapsed != _isAppBarCollapsed) {
      setState(() {
        _isAppBarCollapsed = isCollapsed;
      });
    }
  }

  final List<Transaction> transactions = [
    Transaction(
      id: "TXN001",
      description: "Cash Sale - Customer Payment",
      amount: 15000,
      type: TransactionType.cash,
      time: "09:30 AM",
      category: "Sales",
    ),
    Transaction(
      id: "TXN002",
      description: "Bank Transfer - Salary Payment",
      amount: 25000,
      type: TransactionType.bank,
      time: "11:15 AM",
      category: "Salary",
    ),
    Transaction(
      id: "TXN003",
      description: "Outstanding Payment Due",
      amount: 8000,
      type: TransactionType.receivable,
      time: "02:45 PM",
      category: "Services",
    ),
    Transaction(
      id: "TXN004",
      description: "Utility Bills Payable",
      amount: 1200,
      type: TransactionType.payable,
      time: "04:20 PM",
      category: "Utilities",
    ),
    Transaction(
      id: "TXN005",
      description: "Cash Receipt - Consulting",
      amount: 12000,
      type: TransactionType.cash,
      time: "05:30 PM",
      category: "Consulting",
    ),
    Transaction(
      id: "TXN006",
      description: "Bank Deposit - Client Payment",
      amount: 35000,
      type: TransactionType.bank,
      time: "06:00 PM",
      category: "Client Payment",
    ),
  ];

  List<Transaction> get filteredTransactions {
    return transactions.where((transaction) {
      final matchesSearch = transaction.description
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
          transaction.category
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
          transaction.id.toLowerCase().contains(_searchQuery.toLowerCase());

      final matchesCategory = selectedCategoryNotifier.value ==
              TransactionCategory.all ||
          transaction.type ==
              _getTransactionTypeFromCategory(selectedCategoryNotifier.value);

      return matchesSearch && matchesCategory;
    }).toList();
  }

  TransactionType? _getTransactionTypeFromCategory(
      TransactionCategory category) {
    switch (category) {
      case TransactionCategory.cash:
        return TransactionType.cash;
      case TransactionCategory.bank:
        return TransactionType.bank;
      case TransactionCategory.payable:
        return TransactionType.payable;
      case TransactionCategory.receivable:
        return TransactionType.receivable;
      case TransactionCategory.all:
        return null;
    }
  }

  // Calculate summary data
  Map<String, double> get summaryData {
    double sales = 0;
    double income = 0;
    double expenses = 0;
    double purchases = 0;

    for (var transaction in transactions) {
      switch (transaction.type) {
        case TransactionType.cash:
        case TransactionType.bank:
          if (transaction.category.toLowerCase().contains('sale') ||
              transaction.category.toLowerCase().contains('client')) {
            sales += transaction.amount;
          } else {
            income += transaction.amount;
          }
          break;
        case TransactionType.receivable:
          income += transaction.amount;
          break;
        case TransactionType.payable:
          if (transaction.category.toLowerCase().contains('purchase') ||
              transaction.category.toLowerCase().contains('inventory')) {
            purchases += transaction.amount;
          } else {
            expenses += transaction.amount;
          }
          break;
      }
    }

    return {
      'sales': sales,
      'income': income,
      'expenses': expenses,
      'purchases': purchases,
    };
  }

  Widget _buildSummaryCard({
    required String title,
    required double amount,
    required IconData icon,
    required Color color,
    required Color backgroundColor,
  }) {
    return Container(
      padding: EdgeInsets.all(13.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 16.sp,
                ),
              ),
              Spacer(),
              Icon(
                Icons.trending_up,
                color: color,
                size: 14.sp,
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Text(
            title,
            style: context.textTheme.bodySmall?.copyWith(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '₹${amount.toStringAsFixed(0)}',
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final summary = summaryData;
    return Scaffold(
      backgroundColor: context.colorScheme.tertiaryContainer,
      body: isLoading
          ? DayBookShimmer()
          : CustomScrollView(
              controller: _scrollController,
              slivers: [
                DayBookAppBar(
                  isAppBarCollapsed: _isAppBarCollapsed,
                  selectedDateNotifier: selectedDateNotifier,
                  transactions: transactions,
                  selectedCategoryNotifier: selectedCategoryNotifier,
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Color(0xFF1A1D29),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w, vertical: 16.0.h),
                      decoration: BoxDecoration(
                        color: context.colorScheme.tertiaryContainer,
                        borderRadius: _isAppBarCollapsed
                            ? null
                            : BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Today\'s Summary',
                            style: context.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 10.w,
                            childAspectRatio: 1.9,
                            children: [
                              _buildSummaryCard(
                                title: 'Sales',
                                amount: summary['sales']!,
                                icon: Icons.point_of_sale,
                                color: Colors.green.shade600,
                                backgroundColor: Colors.green.shade50,
                              ),
                              _buildSummaryCard(
                                title: 'Income',
                                amount: summary['income']!,
                                icon: Icons.trending_up,
                                color: Colors.blue.shade600,
                                backgroundColor: Colors.blue.shade50,
                              ),
                              _buildSummaryCard(
                                title: 'Expenses',
                                amount: summary['expenses']!,
                                icon: Icons.trending_down,
                                color: Colors.red.shade600,
                                backgroundColor: Colors.red.shade50,
                              ),
                              _buildSummaryCard(
                                title: 'Purchases',
                                amount: summary['purchases']!,
                                icon: Icons.shopping_cart,
                                color: Colors.orange.shade600,
                                backgroundColor: Colors.orange.shade50,
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                        ],
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 12.h),
                    child: ValueListenableBuilder<TransactionCategory>(
                        valueListenable: selectedCategoryNotifier,
                        builder: (context, selectedCategory, _) {
                          final filtered = filteredTransactions;
                          return Row(
                            children: [
                              Text(
                                context.translate(AppStrings.transactions),
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: context.primaryColor.withValues(
                                      alpha: AppUtils.isDarkMode(context)
                                          ? 0.5
                                          : 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  "${filtered.length}",
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: AppUtils.isDarkMode(context)
                                        ? context.onPrimaryColor
                                            .withValues(alpha: 0.8)
                                        : context.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Spacer(),
                              if (_searchQuery.isNotEmpty ||
                                  selectedCategoryNotifier.value !=
                                      TransactionCategory.all)
                                TextButton(
                                  onPressed: () {
                                    _searchController.clear();
                                    selectedCategoryNotifier.value =
                                        TransactionCategory.all;
                                  },
                                  child: Text("Clear Filter"),
                                ),
                            ],
                          );
                        }),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ValueListenableBuilder<TransactionCategory>(
                      valueListenable: selectedCategoryNotifier,
                      builder: (_, selectedCategory, __) {
                        return DayBookTransactionFilterBar(
                          searchController: _searchController,
                          searchQuery: _searchQuery,
                          selectedCategory: selectedCategoryNotifier.value,
                          onCategorySelected: (category) =>
                              selectedCategoryNotifier.value = category,
                          onClearSearch: () {
                            _searchController.clear();
                          },
                        );
                      }),
                ),

                ValueListenableBuilder<TransactionCategory>(
                    valueListenable: selectedCategoryNotifier,
                    builder: (context, selectedCategory, _) {
                      final filtered = filteredTransactions;
                      return filtered.isEmpty
                          ? SliverFillRemaining(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.search_off,
                                      size: 64,
                                      color: Colors.grey.shade400,
                                    ),
                                    SizedBox(height: 16.h),
                                    Text(
                                      _searchQuery.isNotEmpty
                                          ? "No transactions found"
                                          : "No transactions today",
                                      style: context.textTheme.titleMedium
                                          ?.copyWith(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    if (_searchQuery.isNotEmpty)
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.h),
                                        child: Text(
                                          "Try adjusting your search or filters",
                                          style: context.textTheme.bodyMedium
                                              ?.copyWith(
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            )
                          : SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  final transaction = filtered[index];
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 6.h,
                                    ),
                                    child: DaybookTransactionCard(
                                        transaction: transaction),
                                  );
                                },
                                childCount: filtered.length,
                              ),
                            );
                    }),

                // Bottom padding
                SliverToBoxAdapter(
                  child: SizedBox(height: 100.h),
                ),
              ],
            ),
    );
  }
}

enum TransactionType { cash, bank, payable, receivable }

enum TransactionCategory { all, cash, bank, payable, receivable }

class Transaction {
  final String id;
  final String description;
  final double amount;
  final TransactionType type;
  final String time;
  final String category;

  Transaction({
    required this.id,
    required this.description,
    required this.amount,
    required this.type,
    required this.time,
    required this.category,
  });
}
