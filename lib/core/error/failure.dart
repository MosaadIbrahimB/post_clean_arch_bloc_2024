import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  @override
  List<Object?> get props => [];
}


 class ServerFailure extends Failure{
}
class EmptyCacheFailure extends Failure{
}

class OfflineFailure extends Failure{
}


