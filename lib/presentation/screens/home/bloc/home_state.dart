part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.isProcessing,
    required this.argument,
  });
  final HomeArgument argument;
  final bool isProcessing;

  factory HomeState.initial({required HomeArgument argument}) {
    return HomeState(
      isProcessing: false,
      argument: argument,
    );
  }

  HomeState copyWith({
    HomeArgument? argument,
    bool? isProcessing,
  }) {
    return HomeState(
      argument: argument ?? this.argument,
      isProcessing: isProcessing ?? this.isProcessing,
    );
  }

  @override
  String toString() => 'HomeState(isProcessing: $isProcessing, argument: $argument)';

  @override
  List<Object> get props => [isProcessing, argument];
}
