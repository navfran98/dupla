import 'package:dupla/presentation/design_system/molecules/buttons/welcome_button.dart';
import 'package:dupla/presentation/design_system/tokens/colors.dart';
import 'package:dupla/presentation/design_system/tokens/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  static const route = "/welcome";
  static const routeName = "welcome";

  const WelcomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  double _circleRadius = 0;

  @override
  void initState() {
    super.initState();
    // Iniciar la animación después de construir el widget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _circleRadius = 300;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.primary4,
        body: Stack(children: [
          Positioned(
            top: -300,
            right: -300,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: _circleRadius * 2,
              height: _circleRadius * 2,
              decoration: const BoxDecoration(
                color: CustomColors.secondary1,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -250,
            left: -250,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: _circleRadius * 2,
              height: _circleRadius * 2,
              decoration: const BoxDecoration(
                color: CustomColors.secondary0,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Image.asset(
                //   '/images/chirpr-transparent-logo.png',
                //   fit: BoxFit.fill,
                //   width: 600,
                //   height: 600,
                // ),
                Text(
                  "DUPLA",
                  style: CustomFont.welcomeTitle(CustomColors.neutral10),
                ),
                SizedBox(
                  height: 20,
                ),
                WelcomeButton()
              ],
            ),
          )
        ]));
  }
}
