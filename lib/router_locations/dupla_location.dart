import 'package:beamer/beamer.dart';
import 'package:dupla/presentation/screens/home_screen.dart';
import 'package:dupla/presentation/screens/dupla_screen.dart';
import 'package:flutter/material.dart';

class DuplaLocation extends BeamLocation<BeamState> {
  DuplaLocation(RouteInformation super.routeInformation);

  @override
  List<String> get pathPatterns => [
    DuplaScreen.route,
  ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
        key: ValueKey('duplas'),
        title: 'Duplas',
        child: HomeScreen(),
      ),
    ];
    return pages;
  }
}