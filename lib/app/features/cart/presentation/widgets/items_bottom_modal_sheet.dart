import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/cart_item_add_dialog.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/item_details_card.dart';
import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';
import 'package:easy_vat_v2/app/features/items/presentation/providers/item_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/refresh_button.dart';
import 'package:easy_vat_v2/app/features/widgets/search_debouncer.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsBottomModalSheet extends ConsumerStatefulWidget {
  const ItemsBottomModalSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ItemsBottomModalSheetState();
}

class _ItemsBottomModalSheetState extends ConsumerState<ItemsBottomModalSheet> {
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<int?> itemDetailsExpansionNotifier = ValueNotifier(null);
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(itemProvider);
    return Container(
      height: 1.sh,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        children: [
          _buildSearchField(context, ref),
          const SizedBox(height: 16.0),
          Expanded(
            child: state.map(
              loaded: (itemsList) => itemsList.itemsList.isEmpty
                  ? Center(
                      child: Text(context.translate(AppStrings.noDataIsFound)))
                  : _buildItemList(itemsList.itemsList),
              loading: (_) =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              failure: (value) => Center(child: Text(value.error)),
              initial: (_) => const SizedBox.shrink(),
            ),
          ),
          _buildSubmitButton(context, ref),
        ],
      ),
    );
  }

  Widget _buildSearchField(BuildContext context, WidgetRef ref) {
    final searchDebouncer = SearchDebouncer();

    return Row(
      children: [
        IconButton(
            onPressed: () => context.router.popForced(),
            icon: Icon(Icons.adaptive.arrow_back)),
        Expanded(
          child: TextInputFormField(
            controller: searchController,
            maxLines: 1,
            textInputAction: TextInputAction.done,
            fillColor:
                AppUtils.isDarkMode(context) ? context.surfaceColor : null,
            onChanged: (value) {
              searchDebouncer.run(() {
                if (value.isEmpty) {
                  ref.read(itemProvider.notifier).fetchItems();
                } else {
                  ref.read(itemProvider.notifier).searchItems(query: value);
                }
              });
            },
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgIcon(icon: Assets.icons.search),
            ),
            suffixIcon: SizedBox(
              width: 20.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const VerticalDivider(width: 0, endIndent: 5, indent: 5),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: searchController.text.isNotEmpty
                        ? InkWell(
                            onTap: () => searchController.clear(),
                            child: Icon(Icons.close_rounded))
                        : SvgIcon(
                            icon: Assets.icons.barcode,
                            color: AppUtils.isDarkMode(context)
                                ? context.defaultTextColor
                                : null,
                          ),
                  ),
                ],
              ),
            ),
            hint: AppStrings.search,
            height: 36.h,
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        RefreshButton(
          onTap: () {
            searchController.text = "";
            ref.read(itemProvider.notifier).fetchItems();
          },
        )
      ],
    );
  }

  Widget _buildItemList(List<ItemEntity> itemsList) {
    return ListView.builder(
      itemCount: itemsList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          onTap: () {
            // if ((itemsList[index].currentStock ?? 0.0) > 0) {
            itemDetailsExpansionNotifier.value = index;
            showDialog(
              context: context,
              builder: (context) => CartItemAddDialog(
                item: itemsList[index],
              ),
            );
            // } else {
            //   AppUtils.showToast(context, AppStrings.itemCurrentlyOutOfStock);
            // }
          },
          child: ValueListenableBuilder<int?>(
            valueListenable: itemDetailsExpansionNotifier,
            builder: (context, value, child) {
              return ItemDetailsCard(
                items: itemsList[index],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            height: 50.h,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: PrimaryButton(
              label: AppStrings.submit,
              onPressed: () {
                final selectedIndex = itemDetailsExpansionNotifier.value;
                if (selectedIndex != null) {
                  context.router.popForced();
                }
              },
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () => context.router.popForced(),
              icon: Badge.count(
                backgroundColor: CustomColors.inActiveRedColor(context),
                textColor: Colors.white,
                count: ref.watch(cartProvider).itemList?.length ?? 0,
                child: SvgIcon(
                  icon: Assets.icons.cart,
                  color: context.defaultTextColor,
                ),
              ),
            )),
      ],
    );
  }
}

Future<void> showItemsBottomSheet(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: AppUtils.isDarkMode(context)
        ? context.colorScheme.tertiaryContainer
        : context.colorScheme.surfaceContainerLowest,
    builder: (context) {
      return ItemsBottomModalSheet();
    },
  );
}
