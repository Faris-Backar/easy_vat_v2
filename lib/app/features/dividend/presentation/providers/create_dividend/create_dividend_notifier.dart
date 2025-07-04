import 'package:easy_vat_v2/app/features/dividend/data/model/dividend_request_model.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/usecase/dividend/create_dividend_usecase.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/providers/create_dividend/create_dividend_state.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/providers/dividend/dividend_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createDividendUsecaseProvider = Provider<CreateDividendUsecase>((ref) {
  return CreateDividendUsecase(
      dividendRepository: ref.read(dividendRepositoryProvider));
});

final createDividendNotifierProvider =
    StateNotifierProvider<CreateDividendNotifier, CreateDividendState>((ref) {
  return CreateDividendNotifier(
      createDividendUsecase: ref.read(createDividendUsecaseProvider));
});

class CreateDividendNotifier extends StateNotifier<CreateDividendState> {
  final CreateDividendUsecase createDividendUsecase;
  CreateDividendNotifier({required this.createDividendUsecase})
      : super(CreateDividendState.initial());

  createDividend({required DividendRequestModel request}) async {
    state = CreateDividendState.initial();
    state = CreateDividendState.loading();
    try {
      final result = await createDividendUsecase.call(params: request);
      result.fold(
        (l) => state = CreateDividendState.failure(l.message),
        (r) => state =
            CreateDividendState.success(r.dividend?.first.dividendIDPK ?? ""),
      );
    } catch (e) {
      state = CreateDividendState.failure(e.toString());
    }
  }
}
