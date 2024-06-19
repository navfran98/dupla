import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlanScreen extends ConsumerWidget{
  static const route = "/home/plans";
  static const routeName = "plans";

  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text('Plan Screen'),
    );
  }
}
