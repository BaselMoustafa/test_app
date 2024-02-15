import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'api_constants.dart';
import 'api_request_model.dart';

abstract class ApiHelper{

  Future<Map<String,dynamic>> get(ApiRequestModel apiRequestModel);

  Future<Uint8List> getAsBytes(ApiRequestModel apiRequestModel);

  Future<void> post(ApiRequestModel apiRequestModel);

  Future<void> delete(ApiRequestModel apiRequestModel);

  Future<void> update(ApiRequestModel apiRequestModel);
} 


class ApiHelperImpl implements ApiHelper{
  late Dio dio;

  static bool _dioIsInitialized=false;

  void _init(){
    _dioIsInitialized=true;
    dio=Dio();
    dio.options.receiveDataWhenStatusError=true;
    dio.options.baseUrl=ApiConstants.baseUrl;
    dio.options.headers=ApiConstants.defaultHeaders;
  }

  @override
  Future<Map<String,dynamic>> get(ApiRequestModel apiRequestModel)async{
    return _excuteAfterInitialization(
      functionToExcute: () async{
        final Response response =await dio.get(apiRequestModel.endPoint,queryParameters: apiRequestModel.queries,data:apiRequestModel.body,options: Options(headers: apiRequestModel.headers,));
        
        if(response.statusCode!=200){
          throw Exception("Failed to get data");
        }
        return response.data;
      },
    ); 
  }

  @override
  Future<Uint8List> getAsBytes(ApiRequestModel apiRequestModel)async{
    return _excuteAfterInitialization(
      functionToExcute: () async {
        final Response response =await dio.get(apiRequestModel.endPoint,queryParameters: apiRequestModel.queries,data:apiRequestModel.body,options: Options(headers: apiRequestModel.headers,responseType: ResponseType.bytes));
        if(response.statusCode!=200){
          throw Exception("Failed to get data");
        }
        return Uint8List.fromList(response.data);  
      },
    );
  }

  @override
  Future<void> post(ApiRequestModel apiRequestModel)async{
    return _excuteAfterInitialization(
      functionToExcute: ()async {
        final Response response =await dio.post(apiRequestModel.endPoint,queryParameters: apiRequestModel.queries,data:apiRequestModel.body,options: Options(headers: apiRequestModel.headers,));
        if(response.statusCode!=201){
          throw Exception("Failed to post data");
        }
      },
    );
  }

  @override
  Future<void> delete(ApiRequestModel apiRequestModel)async{
    return _excuteAfterInitialization(
      functionToExcute: () async{
        final Response response =await dio.delete(apiRequestModel.endPoint,queryParameters: apiRequestModel.queries,data:apiRequestModel.body,options: Options(headers: apiRequestModel.headers,));
        if(response.statusCode!=200){
          throw Exception("Failed to delete data");
        } 
      },
    );
  }

  @override
  Future<void> update(ApiRequestModel apiRequestModel)async{
    return _excuteAfterInitialization(
      functionToExcute: () async{
        final Response response =await dio.put(apiRequestModel.endPoint,queryParameters: apiRequestModel.queries,data:apiRequestModel.body,options: Options(headers: apiRequestModel.headers,));
        if(response.statusCode!=200){
          throw Exception("Failed to update data");
        }
      },
    );
  }

  Future<T>_excuteAfterInitialization<T>({
    required Future<T> Function() functionToExcute,
  })async{
    if( ! _dioIsInitialized){
      _init();
    }
    return await functionToExcute();
  }
}