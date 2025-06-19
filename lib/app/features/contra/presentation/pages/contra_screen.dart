import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ContraScreen extends ConsumerStatefulWidget {
  const ContraScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContraScreenState();
}

class _ContraScreenState extends ConsumerState<ContraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contra"),
      ),
    );
  }
}
