import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCasheFailure extends Failure {
  @override
  List<Object?> get props => [];
}
class WrongFailure extends Failure{
  final String message;

  WrongFailure({required this.message});
  @override
  List<Object?> get props => [];

}