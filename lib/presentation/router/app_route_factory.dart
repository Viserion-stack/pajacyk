import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/screens/dashboard/dashboard_route.dart';
import 'package:pajacyk/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:pajacyk/presentation/screens/splash/splash_route.dart';

class AppRouteFactory {
  Route<dynamic> route(RouteSettings settings) {
    switch (settings.name) {
      case DashboardScreen.routeName:
        return dashboardRoute(settings);
      default:
        return splashRoute(settings);
    }
  }
}
