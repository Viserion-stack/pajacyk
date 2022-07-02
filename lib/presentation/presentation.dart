import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pajacyk/domain/usecase/notification.dart';
import 'package:pajacyk/presentation/main_injector.dart' as di;
import 'package:pajacyk/presentation/application/application.dart';
import 'package:pajacyk/presentation/application/theme.dart';
import 'package:pajacyk/presentation/router/app_route_factory.dart';

Future<void> runApplication() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runZonedGuarded(
    () {
      runApp(
        Application(
          appTheme: AppTheme(),
          appRouteFactory: AppRouteFactory(),
        ),
      );
    },
    (error, stackTrace) {
      print('runZonedGuarded');
    },
  );
}
