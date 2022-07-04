import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pajacyk/presentation/screens/dashboard/dashboard_argument.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({required this.argument})
      : super(DashboardState.initial(argument: argument)) {
    on<DashboardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  final DashboardArgument argument;
}
