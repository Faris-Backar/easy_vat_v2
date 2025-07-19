import 'package:easy_vat_v2/app/features/country/domain/entity/country_entity.dart';
import 'package:easy_vat_v2/app/features/country/domain/entity/country_state_entity.dart';
import 'package:easy_vat_v2/app/features/group/domain/entity/group_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ledger_state.freezed.dart';

@freezed
class LedgerState with _$LedgerState {
  const factory LedgerState(
      {String? ledgerCode,
      String? ledgerName,
      GroupEntity? selectedUnderGroup,
      CountryEntity? selectedCountry,
      CountryStateEntity? selectedCountryState,
      double? openingBalance,
      String? balanceType,
      bool? isActive,
      bool? isForUpdate,
      double? currentBalance,
      String? mailingName,
      String? address,
      double? taxRate,
      String? taxebility,
      String? description}) = _LedgerState;

  factory LedgerState.initial() => LedgerState(
      ledgerCode: "",
      ledgerName: "",
      selectedUnderGroup: null,
      selectedCountry: null,
      selectedCountryState: null,
      isForUpdate: false,
      openingBalance: 0.0,
      currentBalance: 0.0,
      balanceType: "",
      mailingName: "",
      address: "",
      isActive: false,
      taxRate: 0.0,
      taxebility: "",
      description: "");
}
