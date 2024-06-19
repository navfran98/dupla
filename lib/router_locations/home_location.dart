import 'package:beamer/beamer.dart';
import 'package:dupla/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(RouteInformation super.routeInformation);

  @override
  List<String> get pathPatterns => [
        HomeScreen.route,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
        key: ValueKey('home'),
        title: 'Home',
        child: HomeScreen(),
      )
    ];
    return pages;
  }
}
