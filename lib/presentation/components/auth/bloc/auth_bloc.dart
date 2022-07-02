import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
    on<StartedEvent>(_onStarted);
  }

  Future<void> _onStarted(StartedEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isAuthenticated: true));
  }
}
