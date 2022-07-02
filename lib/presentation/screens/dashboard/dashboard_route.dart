import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pajacyk/presentation/main_injector.dart';
import 'package:pajacyk/presentation/screens/contact/bloc/contact_bloc.dart';
import 'package:pajacyk/presentation/screens/contact/contact_argument.dart';
import 'package:pajacyk/presentation/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:pajacyk/presentation/screens/dashboard/dashboard_argument.dart';
import 'package:pajacyk/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:pajacyk/presentation/screens/home/bloc/home_bloc.dart';
import 'package:pajacyk/presentation/screens/home/home_argument.dart';
import 'package:pajacyk/presentation/screens/pajacyk/bloc/pajacyk_bloc.dart';
import 'package:pajacyk/presentation/screens/pajacyk/pajacyk_argument.dart';

Route<dynamic> dashboardRoute(RouteSettings settings) {
  final nestedNavigatorKeys = DashboardTab.values.asMap().map(
        (key, value) => MapEntry(
          value,
          GlobalKey<NavigatorState>(),
        ),
      );
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider<DashboardBloc>(
          create: (context) => injector<DashboardBloc>(
            param1: settings.arguments ?? const DashboardArgument(),
          ),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => injector<HomeBloc>(
            param1: settings.arguments ?? const HomeArgument(),
          ),
        ),
        BlocProvider<ContactBloc>(
          create: (context) => injector<ContactBloc>(
            param1: settings.arguments ?? const ContactArgument(),
          ),
        ),
        BlocProvider<PajacykBloc>(
          create: (context) => injector<PajacykBloc>(
            param1: settings.arguments ?? const PajacykArgument(),
          ),
        ),
      ],
      child: DashboardScreen(
        navigatorKeys: nestedNavigatorKeys,
      ),
    ),
  );
}
