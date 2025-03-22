import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DayBookScreen extends StatelessWidget {
  const DayBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(AppStrings.daybook),
      ),
    );
  }
}
