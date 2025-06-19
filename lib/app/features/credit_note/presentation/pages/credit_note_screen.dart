import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class CreditNoteScreen extends ConsumerStatefulWidget {
  const CreditNoteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreditNoteScreenState();
}

class _CreditNoteScreenState extends ConsumerState<CreditNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Credit Note"),
      ),
    );
  }
}
