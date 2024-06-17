import 'package:dupla/presentation/design_system/tokens/colors.dart';
import 'package:dupla/presentation/design_system/tokens/fonts.dart';
import 'package:dupla/presentation/screens/login_screen.dart';
import 'package:dupla/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomeButton extends ConsumerWidget {
  const WelcomeButton({super.key});

  void _goToLogin(BuildContext context, WidgetRef ref) {
    ref.read(mainBeamerDelegateProvider).beamToNamed(LoginScreen.route);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
        onPressed: () {
          _goToLogin(context, ref);
        },
        style: ButtonStyle(
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: CustomColors.neutral10, width: 2),
            ),
          ),
          backgroundColor:
              const WidgetStatePropertyAll<Color>(CustomColors.transparent),
          foregroundColor:
              const WidgetStatePropertyAll<Color>(CustomColors.neutral10),
          padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return CustomColors.neutral10.withOpacity(0.1);
              }
              if (states.contains(WidgetState.pressed)) {
                return CustomColors.neutral10.withOpacity(0.2);
              }
              return null;
            },
          ),
        ),
        child: const Text("Log In",
            style: CustomFont.button(CustomColors.neutral10)));
  }
}
