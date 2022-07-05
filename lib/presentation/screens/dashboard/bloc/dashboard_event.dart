part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class UpdateDashboardTab extends DashboardEvent {
  final DashboardTab tabIndex;

  const UpdateDashboardTab({
    required this.tabIndex,
  });

  @override
  String toString() => 'UpdateDashboardTab(tabIndex: $tabIndex)';
  @override
  List<Object> get props => [tabIndex];
}

class Onstarted extends DashboardEvent {}
