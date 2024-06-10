import 'package:beamer/beamer.dart';
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
  return '/';
}

BeamLocation<RouteInformationSerializable<dynamic>> _locationBuilder(
  RouteInformation routeInformation,
  BeamParameters? beamParameters,
) {
  // if (routeInformation.location!.contains(WelcomeScreen.routeName)) {
  //   return WelcomeLocation(routeInformation);
  // }
  // if (routeInformation.location!.contains(LoginScreen.routeName)) {
  //   return LoginLocation(routeInformation);
  // }
  // if (routeInformation.location!.contains(SignupScreen.routeName)) {
  //   return SignupLocation(routeInformation);
  // }
  return WelcomeLocation(routeInformation);
}
