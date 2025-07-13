import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/stock_transfer/stock_transfer_notifier.dart';
import 'package:easy_vat_v2/app/features/store/domain/entities/store_entity.dart';
import 'package:easy_vat_v2/app/features/store/presentation/providers/store_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/date_picker_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewStockTransferForm extends ConsumerStatefulWidget {
  final TextEditingController stockTransferNoController;
  final TextEditingController refNoController;
  final TextEditingController noteController;
  final ValueNotifier<String?> fromStoreNotifier;
  final ValueNotifier<String?> toStoreNotifier;
  const AddNewStockTransferForm(
      {super.key,
      required this.stockTransferNoController,
      required this.refNoController,
      required this.fromStoreNotifier,
      required this.noteController,
      required this.toStoreNotifier});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewStockTransferFormState();
}

class _AddNewStockTransferFormState
    extends ConsumerState<AddNewStockTransferForm> {
  List<StoreEntity> _storeList = [];
  @override
  void initState() {
    super.initState();

    final cart = ref.read(stockTransferProvider);
    widget.stockTransferNoController.text = cart.stockTransferNo ?? "";
    widget.refNoController.text = cart.refNo ?? "";
    widget.noteController.text = cart.notes ?? "";
    widget.fromStoreNotifier.value = cart.fromStore?.storeName;
    widget.toStoreNotifier.value = cart.toStore?.storeName;
  }

  @override
  Widget build(BuildContext context) {
    final storeState = ref.watch(storeProvider);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  CustomTextField(
                    label: context.translate(AppStrings.stockTransferNo),
                    controller: widget.stockTransferNoController,
                    height: 38.h,
                    labelAndTextfieldGap: 2,
                    hint: context.translate(AppStrings.stockTransferNo),
                    fillColor: context.surfaceColor,
                    enabled: false,
                  ),
                  SizedBox(height: 5),
                  CustomTextField(
                    label: context.translate(AppStrings.refNo),
                    controller: widget.refNoController,
                    height: 38.h,
                    hint: context.translate(AppStrings.enterRefNumber),
                    labelAndTextfieldGap: 2,
                  ),
                  SizedBox(height: 5),
                  Consumer(
                    builder: (context, WidgetRef ref, child) {
                      return DatePickerTextField(
                        label: context.translate(AppStrings.date),
                        onDateSelected: (date) {},
                        labelAndTextfieldGap: 2,
                        backgroundColor: AppUtils.isDarkMode(context)
                            ? context.colorScheme.tertiaryContainer
                            : null,
                      );
                    },
                  ),
                  SizedBox(height: 5),
                  storeState.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const Center(
                        child: CircularProgressIndicator.adaptive()),
                    error: (msg) => Text("Error: $msg"),
                    loaded: (stores, selectedStore) {
                      _storeList = stores;

                      final storeNames =
                          stores.map((store) => store.storeName ?? "").toList();

                      return DropdownField(
                        label: context.translate(AppStrings.fromStore),
                        valueNotifier: widget.fromStoreNotifier,
                        items: storeNames,
                        hint: context.translate(AppStrings.selectFromStore),
                        backgroundColor: AppUtils.isDarkMode(context)
                            ? context.colorScheme.tertiaryContainer
                            : context.surfaceColor,
                        onChanged: (selectedName) {
                          widget.fromStoreNotifier.value = selectedName;

                          final selectedStore = _storeList.firstWhere(
                            (store) => store.storeName == selectedName,
                            orElse: () => StoreEntity(),
                          );

                          ref
                              .read(stockTransferProvider.notifier)
                              .setFromStore(selectedStore);
                        },
                      );
                    },
                  ),
                  SizedBox(height: 5),
                  storeState.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const CircularProgressIndicator.adaptive(),
                    error: (msg) => Text("Error: $msg"),
                    loaded: (stores, _) {
                      _storeList = stores;

                      final storeNames =
                          stores.map((store) => store.storeName ?? "").toList();

                      return DropdownField(
                        label: context.translate(AppStrings.toStore),
                        valueNotifier: widget.toStoreNotifier,
                        items: storeNames,
                        hint: context.translate(AppStrings.selectToStore),
                        backgroundColor: AppUtils.isDarkMode(context)
                            ? context.colorScheme.tertiaryContainer
                            : context.surfaceColor,
                        onChanged: (selectedName) {
                          widget.toStoreNotifier.value = selectedName;

                          final selectedStore = _storeList.firstWhere(
                            (store) => store.storeName == selectedName,
                            orElse: () => StoreEntity(),
                          );

                          ref
                              .watch(stockTransferProvider.notifier)
                              .setToStore(selectedStore);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  StoreEntity? getSelectedFromStore() {
    try {
      return _storeList.firstWhere(
        (store) => store.storeName == widget.fromStoreNotifier.value,
      );
    } catch (e) {
      return null;
    }
  }

  StoreEntity? getSelectedToStore() {
    try {
      return _storeList.firstWhere(
        (store) => store.storeName == widget.toStoreNotifier.value,
      );
    } catch (e) {
      return null;
    }
  }
}
