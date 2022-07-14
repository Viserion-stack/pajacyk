import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/router/app_route.dart';
import 'package:pajacyk/presentation/screens/home/home_route.dart';
import 'package:pajacyk/presentation/screens/home/home_screen.dart';
import 'package:pajacyk/presentation/screens/nabor/nabor_route.dart';
import 'package:pajacyk/presentation/screens/nabor/nabor_screen.dart';
import 'package:pajacyk/presentation/screens/splash/splash_screen.dart';

class NaborRouteFactory implements AppRoute {
  const NaborRouteFactory();

  @override
  Route route(RouteSettings settings) {
    switch (settings.name) {
      case Navigator.defaultRouteName:
      case NaborScree.routeName:
        return naborRoute(settings);
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (context) => const SplashScreen(),
    );
  }
}
