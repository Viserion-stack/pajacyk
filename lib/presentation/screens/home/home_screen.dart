import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pajacyk/presentation/screens/home/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(
                  Icons.circle_notifications,
                  size: 75,
                  color: Colors.green,
                ),
                onPressed: () {
                  context.read<HomeBloc>().add(RunScheduleNotificationEvent());
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
