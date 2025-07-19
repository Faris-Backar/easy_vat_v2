import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AddNewStoreScreen extends ConsumerStatefulWidget {
  const AddNewStoreScreen({super.key});

  @override
  ConsumerState<AddNewStoreScreen> createState() => _AddNewStoreScreenState();
}

class _AddNewStoreScreenState extends ConsumerState<AddNewStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Store"),
      ),
    );
  }
}
