import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DuplaScreen extends ConsumerWidget{
  static const route = "/home/duplas";
  static const routeName = "duplas";

  const DuplaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text('Dupla Screen'),
    );
  }
}
