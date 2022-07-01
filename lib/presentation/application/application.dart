import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pajacyk/domain/usecase/notification.dart';
import 'package:pajacyk/presentation/application/theme.dart';
import 'package:pajacyk/presentation/router/app_route_factory.dart';
import 'package:pajacyk/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:pajacyk/presentation/screens/home/bloc/home_bloc.dart';

class Application extends StatelessWidget {
  const Application({
    required this.appTheme,
    required this.appRouteFactory,
    Key? key,
  }) : super(key: key);

  final AppTheme appTheme;
  final AppRouteFactory appRouteFactory;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(notificationApi: NotificationApi()),
      child: AdaptiveTheme(
        light: appTheme.theme(LightPalette()),
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouteFactory.route,
            theme: theme,
            darkTheme: darkTheme,
            home: const DashboardScreen(),
          );
        },
      ),
    );
  }
}
