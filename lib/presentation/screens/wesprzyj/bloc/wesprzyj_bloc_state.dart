part of 'wesprzyj_bloc.dart';

class WesprzyjState extends Equatable {
  const WesprzyjState({
    required this.isProcessing,
    required this.argument,
  });

  final bool isProcessing;
  final WesprzyjArgument argument;

  factory WesprzyjState.initial({required WesprzyjArgument argument}) {
    return WesprzyjState(
      isProcessing: false,
      argument: argument,
    );
  }

  @override
  List<Object> get props => [];

  WesprzyjState copyWith({
    bool? isProcessing,
    WesprzyjArgument? argument,
  }) {
    return WesprzyjState(
      isProcessing: isProcessing ?? this.isProcessing,
      argument: argument ?? this.argument,
    );
  }

  @override
  String toString() => 'WesprzyjState(isProcessing: $isProcessing)';
}
