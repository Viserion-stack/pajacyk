part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
  @override
  List<Object> get props => [];
}

class OnInitiatedEvent extends SettingsEvent {}

class ChangeStatusNotification extends SettingsEvent {
  final bool statusNotification;

  const ChangeStatusNotification({
    required this.statusNotification,
  });

  @override
  String toString() => 'ChangeStatusNotification(statusNotification: $statusNotification)';
}
