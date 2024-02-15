
abstract class Failure {
  final String message;
  const Failure({required this.message});
}

class OfflineFailure extends Failure{
  const OfflineFailure({super.message="Please Check Your Network Connection"});
}

class AuthanticationFailure extends Failure{
  const AuthanticationFailure({required super.message});
}

class LocalDataBaseFailure extends Failure{
  const LocalDataBaseFailure({required super.message});
}

class RemoteDataBaseFailure extends Failure{
  const RemoteDataBaseFailure({required super.message});
}
