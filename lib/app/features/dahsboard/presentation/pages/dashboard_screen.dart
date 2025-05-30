import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/dahsboard/presentation/providers/dashboard/dashboard_notifiers.dart';
import 'package:easy_vat_v2/app/features/dahsboard/presentation/widgets/dashboard_shimmer_widget.dart';
import 'package:easy_vat_v2/app/features/dahsboard/presentation/widgets/dashboard_summary_card.dart';
import 'package:easy_vat_v2/app/features/dahsboard/presentation/widgets/finanacial_summary_section.dart';
import 'package:easy_vat_v2/app/features/dahsboard/presentation/widgets/finance_card_widget.dart';
import 'package:easy_vat_v2/app/features/dahsboard/presentation/widgets/finance_report_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class DashBoardScreen extends ConsumerStatefulWidget {
  const DashBoardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dashboardProvider.notifier).generateChartData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(AppStrings.dashboard),
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: SvgIcon(
            height: 25,
            width: 25,
            color: AppUtils.isDarkMode(context) ? Colors.white : Colors.black,
            icon: Assets.icons.menus,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
          IconButton(
            onPressed: () {},
            icon: Badge.count(
              backgroundColor: context.primaryColor,
              count: 0,
              child: Icon(Icons.notifications_rounded),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.defaultScreenPadding,
          child: state.isLoading
              ? DashboardShimmerWidget()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    FinanceReportWidget(),
                    SizedBox(height: 20.h),
                    DashboardSummaryCard(),
                    SizedBox(height: 16.h),
                    FinanacialSummaryCardGrid(),
                    SizedBox(height: 16.h),
                    FinanceCardWidget(
                        title: context.translate(AppStrings.totalIncome),
                        subtitle: 'Income Summary',
                        amount: 'AED 12,000',
                        chartData: state.incomeChartData,
                        color: Color(0xFF4CAF50),
                        xAxisLabels: state.xAxisLabels),
                    SizedBox(height: 16.h),
                    FinanceCardWidget(
                        title: 'Total Expense',
                        subtitle: 'Expense Summary',
                        amount: 'AED 8,500',
                        chartData: state.expenseChartData,
                        color: Color(0xFFF44336),
                        xAxisLabels: state.xAxisLabels),
                  ],
                ),
        ),
      ),
    );
  }
}
