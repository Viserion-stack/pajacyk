import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pajacyk/presentation/application/theme.dart';
import 'package:pajacyk/presentation/components/auth/auth_navigation_hub.dart';
import 'package:pajacyk/presentation/components/auth/bloc/auth_bloc.dart';
import 'package:pajacyk/presentation/main_injector.dart';
import 'package:pajacyk/presentation/router/app_route_factory.dart';
import 'package:pajacyk/presentation/screens/splash/splash_screen.dart';

class Application extends StatelessWidget {
  Application({
    required this.appTheme,
    required this.appRouteFactory,
    Key? key,
  }) : super(key: key);

  final AppTheme appTheme;
  final AppRouteFactory appRouteFactory;

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => injector<AuthBloc>()..add(StartedEvent()),
        ),
      ],
      child: AdaptiveTheme(
        light: appTheme.theme(LightPalette()),
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (settings) => appRouteFactory.route(settings),
            theme: theme,
            darkTheme: darkTheme,
            navigatorKey: navigatorKey,
            home: const SplashScreen(),
            builder: (context, child) {
              return AuthNavigationHub(
                navigatorKey: navigatorKey,
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
