
import 'package:equatable/equatable.dart';

class ApiRequestModel extends Equatable{

  final String endPoint;
  final Map<String,dynamic>? headers;
  final Map<String,dynamic>? body;
  final Map<String,dynamic>? queries;

  const ApiRequestModel({
    required this.endPoint,
    this.headers,
    this.body,
    this.queries,
  });

  @override
  List<Object?> get props => [endPoint,headers,body,queries];
}