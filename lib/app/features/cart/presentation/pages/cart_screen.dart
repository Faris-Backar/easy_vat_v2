import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/features/cart/data/model/item_model.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/item_details_card.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

@RoutePage()
class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  final _searchController = TextEditingController();
  final itemCountController = TextEditingController();
  final ValueNotifier<int?> itemDetailsExpansionNotifier = ValueNotifier(null);
  List<ItemModel> itemsList = [];

  @override
  void initState() {
    super.initState();
    List<ItemModel> dummyItems = List.generate(25, (index) {
      return ItemModel(
        name: "Item ${index + 1}",
        status: index.isEven ? "In Stock" : "Out of Stock",
        barcode: "10000${index + 1}",
        itemCode: "IC${index + 100}",
        price: (50 + index * 2).toStringAsFixed(2),
        cost: (40 + index * 1.5).toStringAsFixed(2),
        unit: ["Piece", "Box", "Carton", "Pack", "Dozen"][index % 5],
      );
    });
    itemsList = dummyItems;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cartProvider);
    return Scaffold(
      backgroundColor: context.colorScheme.surfaceContainerLowest,
      appBar: _buildappbar(),
      bottomNavigationBar: _buildFooter(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: state.itemList?.isEmpty == true
            ? Center(
                child: Text(
                  AppStrings.addNewItems,
                  style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.colorScheme.outline),
                ),
              )
            : ListView.builder(
                itemCount: state.itemList?.length ?? 0,
                itemBuilder: (context, index) => Slidable(
                  endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      extentRatio: 0.15,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor:
                                    context.colorScheme.surfaceContainerLowest,
                                title: Text(AppStrings.delete),
                                titleTextStyle:
                                    context.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                                content:
                                    Text(AppStrings.deleteConfirmationInCart),
                                contentTextStyle: context.textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w400),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 8.0),
                                actions: [
                                  SizedBox(
                                    width: 110.w,
                                    child: SecondaryButton(
                                      onPressed: () {
                                        context.router.popForced();
                                      },
                                      label: AppStrings.cancel,
                                      labelColor: Colors.black,
                                      backgroundColor: context
                                          .colorScheme.surfaceContainerLowest,
                                      border: BorderSide(
                                        color: context.colorScheme.primary
                                            .withValues(alpha: 0.2),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  SizedBox(
                                    width: 110.w,
                                    child: PrimaryButton(
                                      label: AppStrings.delete,
                                      bgColor: CustomColors
                                          .getTransactionCardRedColor(context),
                                      onPressed: () {
                                        ref
                                            .read(cartProvider.notifier)
                                            .removeItemFromCart(index: index);
                                        context.router.popForced();
                                      },
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          child: Container(
                            height: 88.h,
                            width: 43.w,
                            color:
                                CustomColors.getTransactionCardRedColor(context)
                                    .withValues(alpha: 0.15),
                            padding: const EdgeInsets.all(12.0),
                            child: SvgIcon(icon: Assets.icons.delete),
                          ),
                        ),
                      ]),
                  child: ItemDetailsCard(
                    isExpanded: false,
                    itemController: TextEditingController(),
                  ),
                ),
              ),
      ),
    );
  }

  Container _buildFooter(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withValues(alpha: 0.5),
            blurRadius: 1,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: PrimaryButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          backgroundColor: context.colorScheme.surfaceContainerLowest,
          builder: (context) => ValueListenableBuilder(
              valueListenable: itemDetailsExpansionNotifier,
              builder: (BuildContext context, int? value, Widget? child) {
                return Container(
                  height: 1.sh,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Column(
                    children: [
                      TextInputFormField(
                        controller: _searchController,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgIcon(icon: Assets.icons.search),
                        ),
                        suffixIcon: SizedBox(
                          width: 20.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              VerticalDivider(
                                width: 0,
                                endIndent: 5,
                                indent: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgIcon(icon: Assets.icons.barcode),
                              ),
                            ],
                          ),
                        ),
                        hint: AppStrings.search,
                        height: 36.h,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: InkWell(
                              onTap: () {
                                itemDetailsExpansionNotifier.value = index;
                              },
                              child: ItemDetailsCard(
                                isExpanded: value == index,
                                itemController: itemCountController,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50.h,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: PrimaryButton(
                          label: AppStrings.submit,
                          onPressed: () {
                            ref
                                .read(cartProvider.notifier)
                                .addItemsIntoCart(item: itemsList[value!]);
                            context.router.popForced();
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ).whenComplete(
          () => itemDetailsExpansionNotifier.value = null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle_outline_rounded,
              color: context.colorScheme.surfaceContainerLowest,
              size: 18.sp,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              AppStrings.addItem,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colorScheme.surfaceContainerLowest,
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildappbar() {
    return AppBar(
      title: Text(AppStrings.cart),
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'print') {
            } else if (value == 'clear') {}
          },
          color: context.colorScheme.surfaceContainerLowest,
          offset: Offset(-5, 5),
          borderRadius: BorderRadius.circular(16.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'print',
              child: Text('Print'),
            ),
            PopupMenuItem(
              value: 'clear',
              child: Text('Clear Cart'),
            ),
          ],
        ),
      ],
    );
  }
}
