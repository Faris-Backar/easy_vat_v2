import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AddNewServiceJobScreen extends ConsumerStatefulWidget {
  const AddNewServiceJobScreen({super.key});

  @override
  ConsumerState<AddNewServiceJobScreen> createState() =>
      _AddNewServiceJobScreenState();
}

class _AddNewServiceJobScreenState
    extends ConsumerState<AddNewServiceJobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Service"),
      ),
    );
  }
}
