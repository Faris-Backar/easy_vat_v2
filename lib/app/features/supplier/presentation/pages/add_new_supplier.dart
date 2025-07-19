import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/supplier/presentation/widgets/supplier_additional_info_form.dart';
import 'package:easy_vat_v2/app/features/supplier/presentation/widgets/supplier_address_contact_form.dart';
import 'package:easy_vat_v2/app/features/supplier/presentation/widgets/supplier_basic_info_form.dart';
import 'package:easy_vat_v2/app/features/supplier/presentation/widgets/supplier_vat_reg_details_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddNewSupplier extends ConsumerStatefulWidget {
  const AddNewSupplier({super.key});

  @override
  ConsumerState<AddNewSupplier> createState() => _AddNewSupplierState();
}

class _AddNewSupplierState extends ConsumerState<AddNewSupplier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: context.surfaceColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SupplierBasicInfoForm(),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                height: 5,
                thickness: 3,
              ),
              SizedBox(
                height: 10.h,
              ),
              SupplierAddressContactForm(),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                height: 5,
                thickness: 3,
              ),
              SizedBox(
                height: 10.h,
              ),
              SupplierVatRegDetailsForm(),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                height: 5,
                thickness: 3,
              ),
              SizedBox(
                height: 10.h,
              ),
              SupplierAdditionalInfoForm()
            ],
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
            onPressed: () => context.router.popForced(),
            icon: Icon(Icons.adaptive.arrow_back),
          );
        },
      ),
      title: Text(context.translate(AppStrings.addNewSupplier)),
    );
  }
}
