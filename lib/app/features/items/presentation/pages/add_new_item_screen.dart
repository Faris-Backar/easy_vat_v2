import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AddNewItemScreen extends ConsumerStatefulWidget {
  const AddNewItemScreen({super.key});

  @override
  ConsumerState<AddNewItemScreen> createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends ConsumerState<AddNewItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Item"),
      ),
    );
  }
}
