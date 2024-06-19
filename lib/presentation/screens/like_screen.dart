import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LikeScreen extends ConsumerWidget {
  static const route = "/home/likes";
  static const routeName = "likes";

  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text('Like Screen'),
    );
  }
}
