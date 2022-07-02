part of 'pajacyk_bloc.dart';

class PajacykState extends Equatable {
  const PajacykState({
    required this.isProcessing,
    required this.argument,
  });

  final bool isProcessing;
  final PajacykArgument argument;

  factory PajacykState.initial({required PajacykArgument argument}) {
    return PajacykState(
      isProcessing: false,
      argument: argument,
    );
  }

  @override
  List<Object> get props => [];

  PajacykState copyWith({
    bool? isProcessing,
    PajacykArgument? argument,
  }) {
    return PajacykState(
      isProcessing: isProcessing ?? this.isProcessing,
      argument: argument ?? this.argument,
    );
  }

  @override
  String toString() => 'PajacykState(isProcessing: $isProcessing)';
}
