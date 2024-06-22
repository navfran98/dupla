import 'package:dupla/presentation/design_system/molecules/buttons/welcome_button.dart';
import 'package:dupla/presentation/design_system/tokens/colors.dart';
import 'package:dupla/presentation/design_system/tokens/fonts.dart';
import 'package:dupla/presentation/screens/signup_screen.dart';
import 'package:dupla/router.dart';
import 'package:flutter/gestures.dart';
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
        backgroundColor: CustomColors.primary4.withOpacity(0.6),
        body: Stack(children: [
          Positioned(
            top: -400,
            right: -350,
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
            bottom: -350,
            left: -400,
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/logo.png', width: 80, height: 80),
                    const Text(
                      "Dupla",
                      style: CustomFont.welcomeTitle(CustomColors.neutral10),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const WelcomeButton(),
                const SizedBox(
                  height: 100,
                ),
                RichText(
                  text: TextSpan(
                      text: "New user? ",
                      style: CustomFont.subtitle01(
                          CustomColors.neutral10.withOpacity(0.75)),
                      children: [
                        TextSpan(
                          text: "Create an account!",
                          style: const CustomFont.subtitle01(
                              CustomColors.neutral10),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              ref
                                  .read(mainBeamerDelegateProvider)
                                  .beamToNamed(SignupScreen.route);
                            },
                        )
                      ]),
                )
              ],
            ),
          )
        ]));
  }
}
