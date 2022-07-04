import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

class PajacykModel extends Equatable {
  const PajacykModel({
    required this.count,
    required this.done,
  });
  final String count;
  final bool done;

  @override
  List<Object> get props => [count, done];
}
