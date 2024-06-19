import 'package:beamer/beamer.dart';
import 'package:dupla/presentation/screens/chat_screen.dart';
import 'package:dupla/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ChatLocation extends BeamLocation<BeamState> {
  ChatLocation(RouteInformation super.routeInformation);

  @override
  List<String> get pathPatterns => [
    ChatScreen.route,
  ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
        key: ValueKey('chats'),
        title: 'Chats',
        child: HomeScreen(),
      ),
    ];
    return pages;
  }
}