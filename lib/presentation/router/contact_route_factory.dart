import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/router/app_route.dart';
import 'package:pajacyk/presentation/screens/contact/contact_route.dart';
import 'package:pajacyk/presentation/screens/contact/contact_screen.dart';
import 'package:pajacyk/presentation/screens/splash/splash_screen.dart';

class ContactRouteFactory implements AppRoute {
  const ContactRouteFactory();

  @override
  Route route(RouteSettings settings) {
    switch (settings.name) {
      case Navigator.defaultRouteName:
      case ContactScreen.routeName:
        return contactRoute(settings);
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (context) => const SplashScreen(),
    );
  }
}
