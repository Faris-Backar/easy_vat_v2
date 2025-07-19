import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AddNewBankScreen extends ConsumerStatefulWidget {
  const AddNewBankScreen({super.key});

  @override
  ConsumerState<AddNewBankScreen> createState() => _AddNewBankScreenState();
}

class _AddNewBankScreenState extends ConsumerState<AddNewBankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Bank"),
      ),
    );
  }
}
