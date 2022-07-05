import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pajacyk/domain/notification_assistant/notification_assistant.dart';
import 'package:pajacyk/presentation/screens/home/home_argument.dart';

import '../../../../domain/widgets/dialog.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.argument,
    required this.notificationApi,
  }) : super(HomeState.initial(argument: argument)) {
    on<RunScheduleNotificationEvent>(_pressNameButton);
  }
  final NotificationApi notificationApi;
  final HomeArgument argument;

  Future<void> _pressNameButton(
      RunScheduleNotificationEvent event, Emitter<HomeState> emit) async {
    late int count;
    try {
      var response = await Dio().post('https://www.pajacyk.pl/api/clicks');
      print(response.data['count']);
      count = int.tryParse(response.data['count'])!;
    } catch (e) {
      print(e);
    } finally {
      notificationApi
          .showScheduledNotofication(
            title: 'Cześć!',
            body: 'Kliknij w brzuszek, aby pomóc dzieciom.',
            payload: 'PAYLOAD TEXT!!!',
            seconds: 3,
          )
          .then(
            (value) => print('NOTIFI'),
          );
      myPopUp(event.context, 'Dziś kliknęlo juz $count osób');
    }
  }
}
