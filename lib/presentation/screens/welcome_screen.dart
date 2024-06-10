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
        _circleRadius = 200;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(214, 255, 246, 100),
        body: Stack(children: [
          Positioned(
            top: -200,
            right: -200,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: _circleRadius * 2,
              height: _circleRadius * 2,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 175, 157, 100),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -200,
            left: -200,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: _circleRadius * 2,
              height: _circleRadius * 2,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 175, 157, 100),
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
                Text("DUPLA")
              ],
            ),
          )
        ]));
  }
}
