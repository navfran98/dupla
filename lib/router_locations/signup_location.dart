import 'package:beamer/beamer.dart';
import 'package:dupla/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class SignupLocation extends BeamLocation<BeamState> {
  SignupLocation(RouteInformation super.routeInformation);

  @override
  List<String> get pathPatterns => [
        SignupScreen.route,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
        key: ValueKey('login'),
        title: 'Login',
        child: SignupScreen(),
      ),
    ];
    return pages;
  }
}
