part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState({
    required this.isProcessing,
    required this.currentTab,
    required this.argument,
  });

  final bool isProcessing;
  final DashboardArgument argument;
  final DashboardTab currentTab;

  factory DashboardState.initial({required DashboardArgument argument}) {
    return DashboardState(
      isProcessing: false,
      currentTab: DashboardTab.home,
      argument: argument,
    );
  }

  @override
  List<Object> get props => [];

  DashboardState copyWith({
    bool? isProcessing,
    DashboardArgument? argument,
    DashboardTab? currentTab,
  }) {
    return DashboardState(
      isProcessing: isProcessing ?? this.isProcessing,
      argument: argument ?? this.argument,
      currentTab: currentTab ?? this.currentTab,
    );
  }

  @override
  String toString() => 'DashboardState(isProcessing: $isProcessing, argument: $argument, currentTab: $currentTab)';
}

enum DashboardTab { home, pajacyk, contact }
