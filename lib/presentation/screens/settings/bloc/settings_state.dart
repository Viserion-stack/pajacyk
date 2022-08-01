part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  SettingsState({required this.isNotifOn});

  final bool isNotifOn;

  factory SettingsState.initial() {
    return SettingsState(isNotifOn: true);
  }

  @override
  List<Object> get props => [isNotifOn];

  SettingsState copyWith({
    bool? isNotifOn,
  }) {
    return SettingsState(
      isNotifOn: isNotifOn ?? this.isNotifOn,
    );
  }
}
