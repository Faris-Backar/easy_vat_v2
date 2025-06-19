import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class DebitNoteScreen extends ConsumerStatefulWidget {
  const DebitNoteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DebitNoteScreenState();
}

class _DebitNoteScreenState extends ConsumerState<DebitNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Debit Note"),
      ),
    );
  }
}
