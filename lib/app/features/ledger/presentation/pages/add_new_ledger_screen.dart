import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/widgets/ledger_additional_info_form.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/widgets/ledger_address_contact_form.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/widgets/ledger_basic_info_form.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/widgets/ledger_footer_widget.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/widgets/ledger_statutory_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddNewLedgerScreen extends ConsumerStatefulWidget {
  const AddNewLedgerScreen({super.key});

  @override
  ConsumerState<AddNewLedgerScreen> createState() => _AddNewLedgerScreenState();
}

class _AddNewLedgerScreenState extends ConsumerState<AddNewLedgerScreen> {
  final ValueNotifier<String?> countryNotifier = ValueNotifier(null);
  final ValueNotifier<String?> stateNotifier = ValueNotifier(null);
  final ValueNotifier<String?> underGroupNotifier = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
  }

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
              LedgerBasicInfoForm(
                underGroupNotifier: underGroupNotifier,
              ),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Divider(
              //   height: 5,
              //   thickness: 3,
              // ),
              SizedBox(
                height: 5.h,
              ),
              LedgerAddressContactForm(
                countryNotifier: countryNotifier,
                stateNotifier: stateNotifier,
              ),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Divider(
              //   height: 5,
              //   thickness: 3,
              // ),
              SizedBox(
                height: 5.h,
              ),
              LedgerStatutoryForm(),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Divider(
              //   height: 5,
              //   thickness: 3,
              // ),
              SizedBox(
                height: 5.h,
              ),
              LedgerAdditionalInfoForm()
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(child: LedgerFooterWidget()),
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
      title: Text(context.translate(AppStrings.addNewLedger)),
    );
  }
}
