import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateRangeProvider =
    StateNotifierProvider<DateRangeNotifier, DateRangeState>((ref) {
  return DateRangeNotifier();
});

class DateRangeNotifier extends StateNotifier<DateRangeState> {
  DateRangeNotifier() : super(DateRangeState());

  void updateFromDate(DateTime fromDate) {
    state = state.copyWith(fromDate: fromDate);
  }

  void updateToDate(DateTime toDate) {
    state = state.copyWith(toDate: toDate);
  }

  void updateDateRange(DateTime fromDate, DateTime toDate) {
    state = DateRangeState(fromDate: fromDate, toDate: toDate);
  }
}

class DateRangeState {
  final DateTime fromDate;
  final DateTime toDate;

  DateRangeState({
    DateTime? fromDate,
    DateTime? toDate,
  })  : fromDate = fromDate ?? DateTime.now(),
        toDate = toDate ?? DateTime.now();

  DateRangeState copyWith({
    DateTime? fromDate,
    DateTime? toDate,
  }) {
    return DateRangeState(
        fromDate: fromDate ?? this.fromDate, toDate: toDate ?? this.toDate);
  }
}
