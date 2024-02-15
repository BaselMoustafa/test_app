import 'package:assignment_app/core/error/failures.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/hotel.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/usecases/get_hotels_usecase.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/controller/get_hotels_cubit/get_hotels_cubit_states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetHotelsCubit extends Cubit<GetHotelsCubitStates>{
  final GetHotelsUsecase getHotelsUsecase;
  GetHotelsCubit({
    required this.getHotelsUsecase,
  }):super(GetHotelsInitialState()); 

  static GetHotelsCubit get(BuildContext context)=>BlocProvider.of(context);

  List<Hotel>?_hotels;

  Future<void>getHotels({bool requestAgain=false})async{
    if (_hotels==null) {
      await _sendRequest();
    }else{
      requestAgain?
        await _sendRequest()
        :emit(GetHotelsSuccessState(hotels: _hotels!));
    }
    
  }

  Future<void>_sendRequest()async{
    emit(GetHotelsLoadingState());
    Either<Failure,List<Hotel>>failureOrHotels= await getHotelsUsecase.excute();
    failureOrHotels.fold(
      (Failure failure){
        emit(GetHotelsFailedState(message: failure.message));
      }, 
      (List<Hotel>hotels){
        _hotels=hotels;
        emit(GetHotelsSuccessState(hotels: hotels));
      }
    );
  }
}