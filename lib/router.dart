import 'package:beamer/beamer.dart';
import 'package:dupla/presentation/screens/chat_screen.dart';
import 'package:dupla/presentation/screens/dupla_screen.dart';
import 'package:dupla/presentation/screens/feed_screen.dart';
import 'package:dupla/presentation/screens/like_screen.dart';
import 'package:dupla/presentation/screens/login_screen.dart';
import 'package:dupla/presentation/screens/profile_screen.dart';
import 'package:dupla/presentation/screens/signup_screen.dart';
import 'package:dupla/presentation/screens/welcome_screen.dart';
import 'package:dupla/router_locations/chat_location.dart';
import 'package:dupla/router_locations/dupla_location.dart';
import 'package:dupla/router_locations/feed_location.dart';
import 'package:dupla/router_locations/home_location.dart';
import 'package:dupla/router_locations/like_location.dart';
import 'package:dupla/router_locations/login_location.dart';
import 'package:dupla/router_locations/profile_location.dart';
import 'package:dupla/router_locations/signup_location.dart';
import 'package:dupla/router_locations/welcome_location.dart';
import 'package:dupla/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
Raw<BeamerDelegate> mainBeamerDelegate(MainBeamerDelegateRef ref) =>
    BeamerDelegate(
        initialPath: _getInitialPath(),
        locationBuilder: _locationBuilder,
        guards: [getLoggerGuard()]);

BeamGuard getLoggerGuard() {
  return BeamGuard(
    pathPatterns: ['*'],
    check: (context, location) {
      logger.d('Navigating to ${location.state.routeInformation.location}');
      return true;
    },
  );
}

String _getInitialPath() {
  //TODO: check if user is logged in. If logged in, return '/home'. Else, return '/login'
  return '/welcome';
}

BeamLocation<RouteInformationSerializable<dynamic>> _locationBuilder(
  RouteInformation routeInformation,
  BeamParameters? beamParameters,
) {
  if (routeInformation.location.contains(WelcomeScreen.routeName)) {
    return WelcomeLocation(routeInformation);
  }
  if (routeInformation.location.contains(LoginScreen.routeName)) {
    return LoginLocation(routeInformation);
  }
  if (routeInformation.location.contains(SignupScreen.routeName)) {
    return SignupLocation(routeInformation);
  }
  if (routeInformation.location.contains(ProfileScreen.routeName)) {
    return ProfileLocation(routeInformation);
  }
  if (routeInformation.location.contains(DuplaScreen.routeName)) {
    return DuplaLocation(routeInformation);
  }
  if (routeInformation.location.contains(FeedScreen.routeName)) {
    return FeedLocation(routeInformation);
  }
  if (routeInformation.location.contains(LikeScreen.routeName)) {
    return LikeLocation(routeInformation);
  }
  if (routeInformation.location.contains(ChatScreen.routeName)) {
    return ChatLocation(routeInformation);
  }
  return HomeLocation(routeInformation);
}
