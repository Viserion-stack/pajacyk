import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/screens/settings/settings_screen.dart';

Route<dynamic> settingsRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => const SettingsScreen(),
  );
}
