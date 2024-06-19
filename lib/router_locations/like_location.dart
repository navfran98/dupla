import 'package:beamer/beamer.dart';
import 'package:dupla/presentation/screens/feed_screen.dart';
import 'package:dupla/presentation/screens/home_screen.dart';
import 'package:dupla/presentation/screens/like_screen.dart';
import 'package:flutter/material.dart';

class LikeLocation extends BeamLocation<BeamState> {
  LikeLocation(RouteInformation super.routeInformation);

  @override
  List<String> get pathPatterns => [
    LikeScreen.route,
  ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
        key: ValueKey('likes'),
        title: 'Likes',
        child: HomeScreen(),
      ),
    ];
    return pages;
  }
}