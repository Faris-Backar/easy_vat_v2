import 'package:easy_vat_v2/app/features/dahsboard/presentation/providers/dashboard/dashboard_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final dashboardProvider =
    StateNotifierProvider<DashboardNotifiers, DashboardState>((ref) {
  return DashboardNotifiers();
});

class DashboardNotifiers extends StateNotifier<DashboardState> {
  DashboardNotifiers()
      : super(DashboardState(
            isLoading: false,
            expenseChartData: [],
            incomeChartData: [],
            xAxisLabels: [],
            fromDate: DateTime.now(),
            toDate: DateTime.now().add(Duration(days: 31))));

  List<FlSpot> incomeChartData = [];
  List<FlSpot> expenseChartData = [];
  List<String> xAxisLabels = [];
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now().add(Duration(days: 31));

  updateFromDate(DateTime fromDate) async {
    fromDate = fromDate;
    await generateChartData();
    state = state.copyWith(fromDate: fromDate);
  }

  updateToDate(DateTime toDate) async {
    toDate = toDate;
    await generateChartData();
    state = state.copyWith(toDate: toDate);
  }

  generateChartData() async {
    state = state.copyWith(
        incomeChartData: [],
        expenseChartData: [],
        xAxisLabels: [],
        isLoading: true);
    incomeChartData = [];
    expenseChartData = [];
    xAxisLabels = [];

    final daysDifference = toDate.difference(fromDate).inDays;

    // Determine if we should display weekly or daily data
    final isWeeklyView = daysDifference > 14;
    final interval = isWeeklyView ? 7 : 1;

    // Generate data points
    int i = 0;
    DateTime currentDate =
        DateTime(fromDate.year, fromDate.month, fromDate.day);

    while (currentDate.isBefore(toDate.add(Duration(days: 1)))) {
      final incomeValue = 2.0 + (i * 1.2) % 8;
      final expenseValue = 1.0 + (i * 1.5) % 6;

      incomeChartData.add(FlSpot(i.toDouble(), incomeValue));
      expenseChartData.add(FlSpot(i.toDouble(), expenseValue));

      xAxisLabels.add(isWeeklyView
          ? DateFormat('dd MMM').format(currentDate)
          : DateFormat('dd').format(currentDate));

      currentDate = currentDate.add(Duration(days: interval));
      i++;
    }
    await Future.delayed(Duration(seconds: 2));
    state = state.copyWith(
        incomeChartData: incomeChartData,
        expenseChartData: expenseChartData,
        xAxisLabels: xAxisLabels,
        isLoading: false);
  }
}
