import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/pages/cart_screen.dart';
import 'package:easy_vat_v2/app/features/items/presentation/providers/item_notifier.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/stock_transfer/stock_transfer_notifier.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/widgets/add_new_stock_transfer_form.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/widgets/add_stock_transfer_widgert.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/widgets/stock_transfer_amount.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_confirmation_dialog.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddNewStockTransferScreen extends ConsumerStatefulWidget {
  final String? title;
  const AddNewStockTransferScreen({super.key, this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewStockTransferScreenState();
}

class _AddNewStockTransferScreenState
    extends ConsumerState<AddNewStockTransferScreen> {
  final stockTransferNoController = TextEditingController();
  final refNoController = TextEditingController();
  final noteController = TextEditingController();
  final ValueNotifier<String?> fromStoreNotifier = ValueNotifier(null);
  final ValueNotifier<String?> toStoreNotifier = ValueNotifier(null);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(itemProvider.notifier).fetchItems();
    });
  }

  void _handleSwipeToNext() {
    context.router.pushNamed(AppRouter.cart);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (!didPop) {
          bool shouldExit = await _onWillPop(context);
          if (shouldExit) {
            context.router.popForced();
          }
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: context.surfaceColor,
        body: GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) {
            if (details.primaryVelocity! < -100) {
              _handleSwipeToNext();
            }
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AddNewStockTransferForm(
                      stockTransferNoController: stockTransferNoController,
                      refNoController: refNoController,
                      noteController: noteController,
                      fromStoreNotifier: fromStoreNotifier,
                      toStoreNotifier: toStoreNotifier),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 5,
                    thickness: 3,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 0.5.sw,
                      child: StockTransferAmount(),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Divider(
                    height: 5,
                    thickness: 3,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    label: context.translate(AppStrings.note),
                    controller: noteController,
                    maxLines: 5,
                    onChanged: (value) => ref
                        .read(stockTransferProvider.notifier)
                        .setNotes(value),
                    hint: context.translate(AppStrings.writeNote),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: AddStockTransferWidgert(
            stockTransferNoController: stockTransferNoController,
            refNoController: refNoController,
            fromStoreNotifier: fromStoreNotifier,
            toStoreNotifier: toStoreNotifier),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Consumer(
        builder: (context, ref, child) {
          return IconButton(
              onPressed: () async {
                final itemList = ref.read(stockTransferProvider).itemList;
                if (itemList != null && itemList.isNotEmpty) {
                  final shouldExit = await showDialog(
                      context: context,
                      builder: (context) => CustomConfirmationDialog(
                            title: context.translate(AppStrings.discardChanges),
                            message: context
                                .translate(AppStrings.discardChangesMessage),
                            primaryButtonLabel:
                                context.translate(AppStrings.discard),
                            secondaryButtonLabel:
                                context.translate(AppStrings.cancel),
                            onPrimaryTap: () {
                              Navigator.of(context).pop(true);
                            },
                            onSecondaryTap: () {
                              Navigator.of(context).pop(false);
                            },
                          ));
                  if (shouldExit == true) {
                    ref.read(stockTransferProvider.notifier).clearCart();
                    if (mounted) {
                      context.router.popForced();
                    }
                  }
                } else {
                  context.router.popForced();
                }
              },
              icon: Icon(Icons.adaptive.arrow_back));
        },
      ),
      title: Text(context.translate(AppStrings.addNewStockTransfer)),
      actions: [
        Consumer(builder: (context, ref, child) {
          return IconButton(
              onPressed: () => context.router
                  .push(CartRoute(screenType: CartScreenType.stockTransfer)),
              icon: Badge.count(
                backgroundColor: CustomColors.inActiveRedColor(context),
                textColor: Colors.white,
                count: ref.watch(stockTransferProvider).itemList?.length ?? 0,
                child: SvgIcon(
                  icon: Assets.icons.cart,
                  color: context.defaultTextColor,
                ),
              ));
        })
      ],
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    final itemList = ref.read(stockTransferProvider.notifier).itemsList;
    if (itemList.isNotEmpty) {
      final shouldExit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                  context.translate(AppStrings.discardChanges),
                ),
                content:
                    Text(context.translate(AppStrings.discardChangesMessage)),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(context.translate(AppStrings.cancel)),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(context.translate(AppStrings.discard)),
                  )
                ],
              ));
      if (shouldExit == true) {
        ref.read(stockTransferProvider.notifier).clearCart();
        return true;
      } else {
        return false;
      }
    }
    return true;
  }
}
