import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/items/data/repository/item_repository_impl.dart';
import 'package:easy_vat_v2/app/features/items/domain/respository/item_repository.dart';
import 'package:easy_vat_v2/app/features/items/domain/usecase/search_items_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:easy_vat_v2/app/features/items/domain/usecase/get_items_usecase.dart';
import 'package:easy_vat_v2/app/features/items/presentation/providers/item_state.dart';

final itemRepositoryProvider = Provider<ItemRepository>((ref) {
  return ItemRepositoryImpl(client: ref.read(dioProvider));
});

final getItemUsecaseProvider = Provider<GetItemsUsecase>((ref) {
  return GetItemsUsecase(itemRepository: ref.read(itemRepositoryProvider));
});

final searchItemUsecaseProvider = Provider<SearchItemsUsecase>((ref) {
  return SearchItemsUsecase(itemRepository: ref.read(itemRepositoryProvider));
});

final itemProvider = StateNotifierProvider<ItemNotifier, ItemState>((ref) {
  return ItemNotifier(
      getItemsUsecase: ref.read(getItemUsecaseProvider),
      searchItemsUsecase: ref.read(searchItemUsecaseProvider));
});

class ItemNotifier extends StateNotifier<ItemState> {
  final GetItemsUsecase getItemsUsecase;
  final SearchItemsUsecase searchItemsUsecase;
  ItemNotifier(
      {required this.getItemsUsecase, required this.searchItemsUsecase})
      : super(ItemState.initial());

  fetchItems() async {
    state = ItemState.loading();
    final result = await getItemsUsecase.call(params: NoParams());
    result.fold(
      (l) => state = ItemState.failure(error: l.message),
      (r) => state = ItemState.loaded(itemsList: r),
    );
  }

  searchItems({required String query}) async {
    state = ItemState.loading();
    final result = await searchItemsUsecase.call(params: query);
    result.fold(
      (l) => state = ItemState.failure(error: l.message),
      (r) => state = ItemState.loaded(itemsList: r),
    );
  }
}
