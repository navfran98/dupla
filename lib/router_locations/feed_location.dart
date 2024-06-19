import 'package:beamer/beamer.dart';
import 'package:dupla/presentation/screens/feed_screen.dart';
import 'package:dupla/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class FeedLocation extends BeamLocation<BeamState> {
  FeedLocation(RouteInformation super.routeInformation);

  @override
  List<String> get pathPatterns => [
    FeedScreen.route,
  ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
        key: ValueKey('feed'),
        title: 'Feed',
        child: HomeScreen(),
      ),
    ];
    return pages;
  }
}