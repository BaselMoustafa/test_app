import 'package:assignment_app/core/constants/constants.dart';
import 'package:assignment_app/core/error/exceptions.dart';
import 'package:assignment_app/core/network/api/api_constants.dart';
import 'package:assignment_app/core/network/api/api_helper.dart';
import 'package:assignment_app/core/network/api/api_request_model.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/categories_and_sliders.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/hotel.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/restaurant.dart';
import 'package:equatable/equatable.dart';


abstract class RemoteDataSource extends Equatable{
  const RemoteDataSource();
  Future<List<Hotel>>getHotels();
  Future<List<Restaurant>> getRestaurants();
  Future<CategoriesAndSliders> getCategoriesAndSliders();
}

class RemoteDataSourceImpl extends RemoteDataSource{

  final ApiHelper apiHelper;
  const RemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<List<Hotel>> getHotels() async{
    return await _tryAndCatchBlock(
      message: "Failed To Get Hotels, Please Try Again",
      functionToExcute: () async{
        List<Hotel>toReturn=[];
        Map<String,dynamic> response= await apiHelper.get(const ApiRequestModel(endPoint: ApiConstants.hotelsEndPoint));
        for (var i = 0; i < response[KConst.data].length; i++) {
          toReturn.add(Hotel.fromMap(response[KConst.data][i]));
        }
        return toReturn;
      }, 
    );
  }

  @override
  Future<List<Restaurant>> getRestaurants() async{
    return await _tryAndCatchBlock(
      message: "Failed To Get Restaurants, Please Try Again",
      functionToExcute: () async{
        List<Restaurant>toReturn=[];
        Map<String,dynamic> response= await apiHelper.get(const ApiRequestModel(endPoint: ApiConstants.restaurantsEndPoint));
        for (var i = 0; i < response[KConst.data].length; i++) {
          toReturn.add(Restaurant.fromMap(response[KConst.data][i]));
        }
        return toReturn;
      }, 
    );
  }

  @override
  Future<CategoriesAndSliders> getCategoriesAndSliders() async{
    return await _tryAndCatchBlock(
      message: "Failed To Get Categories And Sliders, Please Try Again",
      functionToExcute: () async{
        Map<String,dynamic> response= await apiHelper.get(const ApiRequestModel(endPoint: ApiConstants.categoriesAndSlidersEndPoint));
        return CategoriesAndSliders.fromMap(response);
      }, 
    );
  }

  Future<T>_tryAndCatchBlock<T>({
    required Future<T> Function()functionToExcute,
    required String message,
  })async{
    try {
      return await functionToExcute();
    } catch (ex) {
      throw RemoteDataBaseException(message: message);
    }
  }

  @override
  List<Object?> get props =>[apiHelper];
  
}