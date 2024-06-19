import 'package:beamer/beamer.dart';
import 'package:dupla/presentation/screens/home_screen.dart';
import 'package:dupla/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileLocation extends BeamLocation<BeamState> {
  ProfileLocation(RouteInformation super.routeInformation);

  @override
  List<String> get pathPatterns => [
    ProfileScreen.route,
  ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
        key: ValueKey('profile'),
        title: 'Profile',
        child: HomeScreen(),
      ),
    ];
    return pages;
  }
}