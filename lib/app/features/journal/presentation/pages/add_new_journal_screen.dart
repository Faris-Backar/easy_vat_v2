import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AddNewJournalScreen extends ConsumerStatefulWidget {
  final String? title;
  const AddNewJournalScreen({super.key, this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewJournalScreenState();
}

class _AddNewJournalScreenState extends ConsumerState<AddNewJournalScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buidAppBar(),
    );
  }

  AppBar _buidAppBar() {
    return AppBar(
      leading: Consumer(builder: (context, ref, child) {
        return IconButton(
          onPressed: () => context.router.popForced(),
          icon: Icon(Icons.adaptive.arrow_back),
        );
      }),
      title: Text(context.translate(AppStrings.addNewJournal)),
    );
  }
}
