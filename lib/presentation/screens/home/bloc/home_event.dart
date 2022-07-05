part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class RunScheduleNotificationEvent extends HomeEvent {
  final BuildContext context;
  final int clicks;
  const RunScheduleNotificationEvent({
    required this.context,
    required this.clicks,
  });

  @override
  String toString() =>
      'RunScheduleNotificationEvent(context: $context, clicks: $clicks)';
}
