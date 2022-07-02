part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    required this.isAuthenticated,
  });

  final bool isAuthenticated;

  factory AuthState.initial() {
    return const AuthState(isAuthenticated: true);
  }

  AuthState copyWith({
    bool? isAuthenticated,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  @override
  String toString() => 'AuthState(isAuthenticated: $isAuthenticated)';

  @override
  List<Object> get props => [isAuthenticated];
}
