import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pajacyk/presentation/main_injector.dart';
import 'package:pajacyk/presentation/screens/contact/bloc/contact_bloc.dart';
import 'package:pajacyk/presentation/screens/contact/contact_argument.dart';
import 'package:pajacyk/presentation/screens/contact/contact_screen.dart';

Route<dynamic> contactRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider<ContactBloc>(
          create: (context) => injector<ContactBloc>(
            param1: settings.arguments ?? const ContactArgument(),
          ),
        ),
      ],
      child: const ContactScreen(),
    ),
  );
}
