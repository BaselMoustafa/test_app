import 'package:assignment_app/core/error/failures.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/restaurant.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/usecases/get_restaurants_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_restaurants_cubit_states.dart';

class GetRestaurantsCubit extends Cubit<GetRestaurantsCubitStates>{
  final GetRestaurantsUsecase getRestaurantsUsecase;
  GetRestaurantsCubit({
    required this.getRestaurantsUsecase,
  }):super(GetRestaurantsInitialState()); 

  static GetRestaurantsCubit get(BuildContext context)=>BlocProvider.of(context);

  List<Restaurant>?_restaurants;

  Future<void>getRestaurants({bool requestAgain=false})async{
    if (_restaurants==null) {
      await _sendRequest();
    }else{
      requestAgain?
        await _sendRequest()
        :emit(GetRestaurantsSuccessState(restaurants: _restaurants!));
    }
    
  }

  Future<void>_sendRequest()async{
    emit(GetRestaurantsLoadingState());
    Either<Failure,List<Restaurant>>failureOrRestaurants= await getRestaurantsUsecase.excute();
    failureOrRestaurants.fold(
      (Failure failure){
        emit(GetRestaurantsFailedState(message: failure.message));
      }, 
      (List<Restaurant>restaurants){
        _restaurants=restaurants;
        emit(GetRestaurantsSuccessState(restaurants: restaurants));
      }
    );
  }
}