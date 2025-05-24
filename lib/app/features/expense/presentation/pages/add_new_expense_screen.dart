import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';

class AddNewExpenseScreen extends ConsumerStatefulWidget {
  final String? tittle;
  const AddNewExpenseScreen({super.key, this.tittle});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewExpenseScreenState();
}

class _AddNewExpenseScreenState extends ConsumerState<AddNewExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: context.surfaceColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Consumer(
        builder: (context, ref, child) {
          return IconButton(
              onPressed: () {}, icon: Icon(Icons.adaptive.arrow_back));
        },
      ),
      title: Text(context.translate(AppStrings.addNewExpense)),
      actions: [
        Consumer(
          builder: (context, ref, child) {
            return IconButton(
                onPressed: () {},
                icon: Badge.count(
                  backgroundColor: CustomColors.inActiveRedColor(context),
                  textColor: Colors.white,
                  count: 1,
                  child: SvgIcon(
                    icon: Assets.icons.cart,
                    color: context.defaultTextColor,
                  ),
                ));
          },
        )
      ],
    );
  }
}
