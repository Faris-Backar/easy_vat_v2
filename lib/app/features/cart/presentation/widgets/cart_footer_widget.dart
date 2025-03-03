import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/domain/entities/cart_entity.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/item_details_card.dart';
import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';
import 'package:easy_vat_v2/app/features/items/presentation/providers/item_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartFooterWidget extends ConsumerStatefulWidget {
  const CartFooterWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CartFooterWidgetState();
}

class _CartFooterWidgetState extends ConsumerState<CartFooterWidget> {
  final _searchController = TextEditingController();
  final itemCountController = TextEditingController(text: "1.0");
  final ValueNotifier<int?> itemDetailsExpansionNotifier = ValueNotifier(null);
  final ValueNotifier<double> itemTotalNotifer = ValueNotifier(0.0);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Consumer(
        builder: (context, ref, child) => PrimaryButton(
          onPressed: () {
            ref.read(itemProvider.notifier).fetchItems();
            _buildItemsBottomModalSheet(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_outline_rounded,
                color: context.onPrimaryColor,
                size: 18.sp,
              ),
              SizedBox(width: 3.w),
              Text(
                AppStrings.addItem,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.onPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _buildItemsBottomModalSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppUtils.isDarkMode(context)
          ? context.colorScheme.tertiaryContainer
          : context.colorScheme.surfaceContainerLowest,
      builder: (context) => Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(itemProvider);
          return Container(
            height: 1.sh,
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              children: [
                _buildSearchField(),
                const SizedBox(height: 16.0),
                Expanded(
                  child: state.map(
                    loaded: (itemsList) => itemsList.itemsList.isEmpty
                        ? Center(child: Text(AppStrings.noDataIsFound))
                        : _buildItemList(itemsList.itemsList),
                    loading: (_) => const Center(
                        child: CircularProgressIndicator.adaptive()),
                    failure: (value) => Center(child: Text(value.error)),
                    initial: (_) => const SizedBox.shrink(),
                  ),
                ),
                _buildSubmitButton(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchField() {
    return TextInputFormField(
      controller: _searchController,
      fillColor: AppUtils.isDarkMode(context) ? context.surfaceColor : null,
      onChanged: (value) {
        if (value.isEmpty) {
          ref.read(itemProvider.notifier).fetchItems();
        } else if (value.length > 3) {
          ref.read(itemProvider.notifier).searchItems(query: value);
        }
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
              child: SvgIcon(
                icon: Assets.icons.barcode,
                color: context.defaultTextColor,
              ),
            ),
          ],
        ),
      ),
      hint: AppStrings.search,
      height: 36.h,
    );
  }

  Widget _buildItemList(List<ItemEntity> itemsList) {
    return ListView.builder(
      itemCount: itemsList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          onTap: () {
            itemDetailsExpansionNotifier.value = index;
            itemTotalNotifer.value = itemsList[index].retailRate ?? 0.0;
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: context.colorScheme.surfaceContainerLowest,
                title: Text(AppStrings.addToCart),
                titleTextStyle: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${AppStrings.itemName} : ",
                          style: context.textTheme.bodySmall?.copyWith(
                              color: context.defaultTextColor
                                  .withValues(alpha: .5)),
                        ),
                        Text(
                          itemsList[index].itemName ?? "",
                          style: context.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${AppStrings.price} : ",
                          style: context.textTheme.bodySmall?.copyWith(
                              color: context.defaultTextColor
                                  .withValues(alpha: .5)),
                        ),
                        Text(
                          itemsList[index].retailRate?.toStringAsFixed(2) ??
                              "0.00",
                          style: context.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${AppStrings.qty} : ",
                          style: context.textTheme.bodySmall?.copyWith(
                              color: context.defaultTextColor
                                  .withValues(alpha: .5)),
                        ),
                        TextInputFormField(
                          controller: TextEditingController(),
                          maxLines: 1,
                          height: 30.h,
                          width: 100.w,
                          onChanged: (qty) => itemTotalNotifer.value =
                              ((itemsList[index].retailRate ?? 0.0) *
                                  (int.tryParse(qty) ?? 0.0)),
                          style: context.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${AppStrings.total} : ",
                          style: context.textTheme.bodySmall?.copyWith(
                              color: context.defaultTextColor
                                  .withValues(alpha: .5)),
                        ),
                        ValueListenableBuilder(
                          valueListenable: itemTotalNotifer,
                          builder: (context, double total, child) {
                            return Text(
                              total.toStringAsFixed(2),
                              style: context.textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                contentTextStyle: context.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w400),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                actions: [
                  SecondaryButton(
                    onPressed: () => context.router.popForced(),
                    label: AppStrings.cancel,
                    labelColor: Colors.black,
                    backgroundColor: context.colorScheme.surfaceContainerLowest,
                    border: BorderSide(
                      color: context.colorScheme.primary.withValues(alpha: 0.2),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  PrimaryButton(
                    label: AppStrings.addToCart,
                    onPressed: () {
                      final CartEntity cartEntity = CartEntity(
                          item: itemsList[index],
                          qty: double.tryParse(itemCountController.text) ?? 0.0,
                          total: itemTotalNotifer.value);
                      ref
                          .read(cartProvider.notifier)
                          .addItemsIntoCart(item: cartEntity);
                      context.router.popForced();
                    },
                  ),
                ],
              ),
            );
          },
          child: ValueListenableBuilder<int?>(
            valueListenable: itemDetailsExpansionNotifier,
            builder: (context, value, child) {
              return ItemDetailsCard(
                isExpanded: value == index,
                items: itemsList[index],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      height: 50.h,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: PrimaryButton(
        label: AppStrings.submit,
        onPressed: () {
          final selectedIndex = itemDetailsExpansionNotifier.value;
          if (selectedIndex != null) {
            // ref
            //     .read(cartProvider.notifier)
            //     .addItemsIntoCart(item: itemsList[selectedIndex]);
            context.router.popForced();
          }
        },
      ),
    );
  }
}
