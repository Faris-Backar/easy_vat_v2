import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_dividend_state.freezed.dart';

@freezed
class CreateDividendState with _$CreateDividendState {
  const factory CreateDividendState.initial() = _Initial;
  const factory CreateDividendState.loading() = _Loading;
  const factory CreateDividendState.success(String dividendIDPK) = _Success;
  const factory CreateDividendState.failure(String error) = _Failure;
}
