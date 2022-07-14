import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pajacyk/presentation/main_injector.dart';
import 'package:pajacyk/presentation/screens/home/bloc/home_bloc.dart';
import 'package:pajacyk/presentation/screens/home/home_argument.dart';
import 'package:pajacyk/presentation/screens/home/home_screen.dart';
import 'package:pajacyk/presentation/screens/nabor/nabor_screen.dart';
import 'package:pajacyk/presentation/screens/partnerzy/partnerzy_screen.dart';

Route<dynamic> partnerzyRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => injector<HomeBloc>(
            param1: settings.arguments ?? const HomeArgument(),
          ),
        ),
      ],
      child: const PartnerzyScreen(),
    ),
  );
}
