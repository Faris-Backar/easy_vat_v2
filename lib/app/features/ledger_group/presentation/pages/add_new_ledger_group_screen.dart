import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AddNewLedgerGroupScreen extends ConsumerStatefulWidget {
  const AddNewLedgerGroupScreen({super.key});

  @override
  ConsumerState<AddNewLedgerGroupScreen> createState() =>
      _AddNewLedgerGroupScreenState();
}

class _AddNewLedgerGroupScreenState
    extends ConsumerState<AddNewLedgerGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Ledger Group"),
      ),
    );
  }
}
