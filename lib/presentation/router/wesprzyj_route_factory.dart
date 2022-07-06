import 'package:flutter/material.dart';

import '../screens/splash/splash_screen.dart';
import '../screens/wesprzyj/wesprzyj_route.dart';
import '../screens/wesprzyj/wesprzyj_screen.dart';
import 'app_route.dart';

class WesprzyjRouteFactory implements AppRoute {
  const WesprzyjRouteFactory();

  @override
  Route route(RouteSettings settings) {
    switch (settings.name) {
      case Navigator.defaultRouteName:
      case WesprzyjScreen.routeName:
        return wesprzyjRoute(settings);
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (context) => const SplashScreen(),
    );
  }
}
