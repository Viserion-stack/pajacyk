import 'package:fpdart/fpdart.dart';

abstract class UseCase<T, E> {
  TaskEither<T, E> execute();
}
