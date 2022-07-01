part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.isProcessing,
  });
  final bool isProcessing;

  factory HomeState.initial() {
    return const HomeState(isProcessing: false);
  }

  HomeState copyWith({
    bool? isProcessing,
  }) {
    return HomeState(
      isProcessing: isProcessing ?? this.isProcessing,
    );
  }

  @override
  String toString() => 'HomeState(isProcessing: $isProcessing)';

  @override
  List<Object> get props => [isProcessing];
}
