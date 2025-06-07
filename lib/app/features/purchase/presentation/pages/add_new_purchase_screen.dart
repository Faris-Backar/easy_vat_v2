// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/purchase/purchase_notifier.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/widget/add_new_purchase_form.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/widget/add_purchase_footer.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/items/presentation/providers/item_notifier.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/rate_splitup_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';

@RoutePage()
class AddNewPurchaseScreen extends ConsumerStatefulWidget {
  final String? title;
  const AddNewPurchaseScreen({super.key, this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewPurchaseScreenState();
}

class _AddNewPurchaseScreenState extends ConsumerState<AddNewPurchaseScreen> {
  final purchaseNoController = TextEditingController();
  final supInvNoController = TextEditingController();
  final _noteController = TextEditingController();
  final ValueNotifier<String?> purchaseReturnModeNotifier = ValueNotifier(null);
  final ValueNotifier<String?> returnedByNotifier = ValueNotifier(null);
  final ValueNotifier<String?> cashAccountNotifier = ValueNotifier(null);
  final ValueNotifier<String?> purchaseAccountNotifier = ValueNotifier(null);

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
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: context.surfaceColor,
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity! < -100) {
            _handleSwipeToNext();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AddNewPurchaseForm(
                  purchaseNoController: purchaseNoController,
                  supInvNoController: supInvNoController,
                  purchaseModeNotifier: purchaseReturnModeNotifier,
                  purchasedByNotifier: returnedByNotifier,
                  cashAccountNotifier: cashAccountNotifier,
                  purchaseAccountNotifier: purchaseAccountNotifier,
                ),
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
                    child: RateSplitupWidget(),
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
                  controller: _noteController,
                  maxLines: 5,
                  onChanged: (value) =>
                      ref.read(purchaseProvider.notifier).setNotes(value),
                  hint: context.translate(AppStrings.writeNote),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AddPurchaseFooterWidget(
          purchaseNoController: purchaseNoController,
          supInvNoController: supInvNoController,
          purchaseModeNotifier: purchaseReturnModeNotifier,
          purchasedByNotifier: returnedByNotifier,
          purchaseType: widget.title),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Consumer(builder: (context, ref, child) {
        return IconButton(
          onPressed: () async {
            final itemList = ref.read(cartProvider).itemList;
            if (itemList != null && itemList.isNotEmpty) {
              final shouldExit = await showDialog<bool>(
                context: context,
                builder: (context) => CustomConfirmationDialog(
                  title: context.translate(AppStrings.discardChanges),
                  message: context.translate(AppStrings.discardChangesMessage),
                  primaryButtonLabel: context.translate(AppStrings.discard),
                  secondaryButtonLabel: context.translate(AppStrings.cancel),
                  onPrimaryTap: () {
                    Navigator.of(context).pop(true); // return true
                  },
                  onSecondaryTap: () {
                    Navigator.of(context).pop(false); // return false
                  },
                ),
              );

              if (shouldExit == true) {
                ref.read(purchaseProvider.notifier).clearPurchase(ref);
                if (mounted) {
                  context.router.popForced();
                }
              }
            } else {
              context.router.popForced();
            }
          },
          icon: Icon(Icons.adaptive.arrow_back),
        );
      }),
      title: Text(widget.title ?? context.translate(AppStrings.addNewPurchase)),
      actions: [
        Consumer(builder: (context, ref, child) {
          return IconButton(
            onPressed: () => context.router.pushNamed(AppRouter.cart),
            icon: Badge.count(
              backgroundColor: CustomColors.inActiveRedColor(context),
              textColor: Colors.white,
              count: ref.watch(cartProvider).itemList?.length ?? 0,
              child: SvgIcon(
                icon: Assets.icons.cart,
                color: context.defaultTextColor,
              ),
            ),
          );
        }),
      ],
    );
  }
}
