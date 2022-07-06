import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/application/theme.dart';
import 'package:provider/provider.dart';
import '../controllers/navigation.dart';
import '../screens/dashboard/dashboard_screen.dart';

class Application extends StatelessWidget {
  Application({
    required this.appTheme,
    Key? key,
  }) : super(key: key);

  final AppTheme appTheme;

  // final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: appTheme.theme(LightPalette()),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) {
        return MultiProvider(
          providers: [
            ListenableProvider<NavigationController>(
              create: (_) => NavigationController(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: true,
            // onGenerateRoute: (settings) => appRouteFactory.route(settings),
            theme: theme,
            darkTheme: darkTheme,
            //navigatorKey: navigatorKey,
            home: const DashboardScreen(),
          ),
        );
      },
    );
  }
}
