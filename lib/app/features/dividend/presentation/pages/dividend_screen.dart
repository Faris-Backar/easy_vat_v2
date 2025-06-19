import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class DividendScreen extends ConsumerStatefulWidget {
  const DividendScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DividendScreenState();
}

class _DividendScreenState extends ConsumerState<DividendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dividend"),
      ),
    );
  }
}
