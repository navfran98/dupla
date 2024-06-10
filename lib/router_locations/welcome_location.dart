import 'package:beamer/beamer.dart';
import 'package:dupla/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class WelcomeLocation extends BeamLocation<BeamState> {
  WelcomeLocation(RouteInformation super.routeInformation);

  @override
  List<String> get pathPatterns => [
    WelcomeScreen.route,
  ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
        key: ValueKey('welcome'),
        title: 'Welcome',
        child: WelcomeScreen(),
      ),
    ];
    return pages;
  }
}