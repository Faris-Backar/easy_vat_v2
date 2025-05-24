import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: context.colorScheme.,
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
                                  color: context.primaryColor
                                      .withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  "${filtered.length}",
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: context.primaryColor,
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
