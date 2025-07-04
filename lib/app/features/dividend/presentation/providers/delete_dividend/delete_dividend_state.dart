import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_dividend_state.freezed.dart';

@freezed
class DeleteDividendState with _$DeleteDividendState {
  const factory DeleteDividendState.initial() = _Initial;
  const factory DeleteDividendState.loading() = _Loading;
  const factory DeleteDividendState.success() = _Success;
  const factory DeleteDividendState.failure(String error) = _Failure;
}
