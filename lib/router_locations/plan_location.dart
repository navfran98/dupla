import 'package:beamer/beamer.dart';
import 'package:dupla/presentation/screens/home_screen.dart';
import 'package:dupla/presentation/screens/plan_screen.dart';
import 'package:flutter/material.dart';

class PlanLocation extends BeamLocation<BeamState> {
  PlanLocation(RouteInformation super.routeInformation);

  @override
  List<String> get pathPatterns => [
    PlanScreen.route,
  ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
        key: ValueKey('plans'),
        title: 'Plans',
        child: HomeScreen(),
      ),
    ];
    return pages;
  }
}