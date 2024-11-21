import 'package:equatable/equatable.dart';

abstract class AddDeleteUpdateState extends Equatable{
  @override
  List<Object?> get props => [];
}
class InitialAddUpdateDeleteState extends AddDeleteUpdateState{}

class LoadingAddUpdateDeleteState extends AddDeleteUpdateState{}

class SuccessAddUpdateDeleteState extends AddDeleteUpdateState{
 final String msg;
  SuccessAddUpdateDeleteState({required this.msg});
  @override
  List<Object?> get props => [msg];
}

class ErrorAddUpdateDeleteState extends AddDeleteUpdateState{
  final String msg;
  ErrorAddUpdateDeleteState({required this.msg});
  @override
  List<Object?> get props => [msg];
}