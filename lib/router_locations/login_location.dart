import 'package:beamer/beamer.dart';
import 'package:dupla/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class LoginLocation extends BeamLocation<BeamState> {
  LoginLocation(RouteInformation super.routeInformation);

  @override
  List<String> get pathPatterns => [
    LoginScreen.route,
  ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
        key: ValueKey('login'),
        title: 'Login',
        child: LoginScreen(),
      ),
    ];
    return pages;
  }
}