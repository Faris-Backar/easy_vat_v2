import 'package:easy_vat_v2/app/features/contra/data/repository/contra_repository_impl.dart';
import 'package:easy_vat_v2/app/features/contra/domain/entity/contra_entity.dart';
import 'package:easy_vat_v2/app/features/contra/domain/repositories/contra_repository.dart';
import 'package:easy_vat_v2/app/features/contra/domain/usecase/params/contra_params.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/contra/contra_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contraRepositoryProvider = Provider<ContraRepository>((ref) {
  return ContraRepositoryImpl();
});

final contraNotifierProvider =
    StateNotifierProvider<ContraNotifiers, ContraState>((ref) {
  return ContraNotifiers(contraRepository: ref.read(contraRepositoryProvider));
});

class ContraNotifiers extends StateNotifier<ContraState> {
  final ContraRepository contraRepository;
  List<ContraEntryEntity>? contraEntry;
  DateTime? fromDate;
  DateTime? toDate;

  ContraNotifiers({required this.contraRepository})
      : super(ContraState.initial());

  fetchContra({required ContraParams params}) async {
    state = const ContraState.initial();
    final result =
        await contraRepository.getContra(contraRequestParams: params);
    result.fold((failure) => state = ContraState.failure(failure.message),
        (contra) {
      contraEntry = contra.contraEntry;
      double totalAmount = 0.0;
      for (var i = 0; i < (contraEntry?.length ?? 0.0); i++) {
        totalAmount += contra.contraEntry?[i].totalAmount ?? 0.0;
      }
      return state = ContraState.success(
          contra: contra.contraEntry ?? [], totalAmount: totalAmount);
    });
  }

  searchContra(String query) {
    double totalAmount = 0.0;
    if (query.isEmpty) {
      for (var i = 0; i < (contraEntry?.length ?? 0.0); i++) {
        totalAmount += contraEntry?[i].totalAmount ?? 0.0;
      }
      state = ContraState.success(
          contra: contraEntry ?? [], totalAmount: totalAmount);
    } else {
      final filteredData = contraEntry?.where((contra) {
            return (contra.referenceNo?.contains(query) ?? false) ||
                (contra.entryMode
                        ?.toLowerCase()
                        .contains(query.toLowerCase()) ??
                    false);
          }).toList() ??
          [];
      for (var i = 0; i < (filteredData.length); i++) {
        totalAmount += filteredData[i].totalAmount ?? 0.0;
      }
      state =
          ContraState.success(contra: filteredData, totalAmount: totalAmount);
    }
  }

  clearDates() {
    fromDate = null;
    toDate = null;
  }
}
