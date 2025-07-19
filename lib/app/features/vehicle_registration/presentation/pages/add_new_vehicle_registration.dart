import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AddNewVehicleRegistration extends ConsumerStatefulWidget {
  const AddNewVehicleRegistration({super.key});

  @override
  ConsumerState<AddNewVehicleRegistration> createState() =>
      _AddNewVehicleRegistrationState();
}

class _AddNewVehicleRegistrationState
    extends ConsumerState<AddNewVehicleRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Vehicle Registration"),
      ),
    );
  }
}
