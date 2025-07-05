import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_dividend_state.freezed.dart';

@freezed
class UpdateDividendState with _$UpdateDividendState {
  const factory UpdateDividendState.initial() = _Initial;
  const factory UpdateDividendState.loading() = _Loading;
  const factory UpdateDividendState.success() = _Success;
  const factory UpdateDividendState.failure(String error) = _Failure;
}
