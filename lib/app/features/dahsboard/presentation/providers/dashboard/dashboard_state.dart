import 'package:fl_chart/fl_chart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    required DateTime fromDate,
    required DateTime toDate,
    required List<FlSpot> incomeChartData,
    required List<FlSpot> expenseChartData,
    required List<String> xAxisLabels,
    required bool isLoading,
  }) = _DashboardState;
}
