import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pajacyk/domain/notification_assistant/notification_assistant.dart';
import 'package:pajacyk/domain/usecase/click_pajacyk_usecase.dart';
import 'package:pajacyk/presentation/screens/home/home_argument.dart';

import '../../../../domain/widgets/dialog.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.argument,
    required this.notificationApi,
    required this.clickPajacykUsecase,
  }) : super(HomeState.initial(argument: argument)) {
    on<RunScheduleNotificationEvent>(_pressNameButton);
  }
  final ClickPajacykUsecase clickPajacykUsecase;
  final NotificationApi notificationApi;
  final HomeArgument argument;

  Future<void> _pressNameButton(RunScheduleNotificationEvent event, Emitter<HomeState> emit) async {
    emit(state);
    int count;
    final newState = await clickPajacykUsecase.execute().match(
      (_) => state.copyWith(isProcessing: false),
      (pajacyk) {
        print('PAJACYK response' + pajacyk.count);
        count = int.tryParse(pajacyk.count)!;
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
        state.copyWith(isProcessing: false);
      },
    ).run();
  }
}
