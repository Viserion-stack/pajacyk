import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/router/app_route.dart';
import 'package:pajacyk/presentation/screens/pajacyk/pajacyk_route.dart';
import 'package:pajacyk/presentation/screens/pajacyk/pajacyk_screen.dart';
import 'package:pajacyk/presentation/screens/splash/splash_screen.dart';

class PajacykRouteFactory implements AppRoute {
  const PajacykRouteFactory();

  @override
  Route route(RouteSettings settings) {
    switch (settings.name) {
      case Navigator.defaultRouteName:
      case PajacykScreen.routeName:
        return pajacykRoute(settings);
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (context) => const SplashScreen(),
    );
  }
}
