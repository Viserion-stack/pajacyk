import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/screens/dashboard/dashboard_screen.dart';

Route<dynamic> dashboardRoute(RouteSettings settings) {
  return MaterialPageRoute(builder: (context) => const DashboardScreen());
}
