class LocalDataBaseException implements Exception{
  final String message;
  const LocalDataBaseException({required this.message});
}

class RemoteDataBaseException implements Exception{
  final String message;
  const RemoteDataBaseException({required this.message});
}