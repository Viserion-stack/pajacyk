import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pajacyk/domain/usecase/notification.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.notificationApi,
  }) : super(HomeState.initial()) {
    on<RunScheduleNotificationEvent>(_pressNameButton);
  }
  final NotificationApi notificationApi;

  Future<void> _pressNameButton(RunScheduleNotificationEvent event, Emitter<HomeState> emit) async {
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
  }
}
