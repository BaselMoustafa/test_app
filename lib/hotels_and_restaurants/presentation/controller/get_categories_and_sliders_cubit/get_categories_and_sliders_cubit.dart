import 'package:assignment_app/core/error/failures.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/categories_and_sliders.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/usecases/get_categories_and_sliders_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_categories_and_sliders_cubit_states.dart';

class GetCategoriesAndSlidersCubit extends Cubit<GetCategoriesAndSlidersCubitStates>{
  final GetCategoriesAndSlidersUsecase getCategoriesAndSlidersUsecase;
  GetCategoriesAndSlidersCubit({
    required this.getCategoriesAndSlidersUsecase,
  }):super(GetCategoriesAndSlidersInitialState()); 

  static GetCategoriesAndSlidersCubit get(BuildContext context)=>BlocProvider.of(context);

  CategoriesAndSliders? _categoriesAndSliders;

  Future<void>getCategoriesAndSliders({bool requestAgain=false})async{
    if (_categoriesAndSliders==null) {
      await _sendRequest();
    }else{
      requestAgain?
        await _sendRequest()
        :emit(GetCategoriesAndSlidersSuccessState(categoriesAndSliders: _categoriesAndSliders!));
    }
    
  }

  Future<void>_sendRequest()async{
    emit(GetCategoriesAndSlidersLoadingState());
    Either<Failure,CategoriesAndSliders>failureOrHotels= await getCategoriesAndSlidersUsecase.excute();
    failureOrHotels.fold(
      (Failure failure){
        emit(GetCategoriesAndSlidersFailedState(message: failure.message));
      }, 
      (CategoriesAndSliders categoriesAndSliders){
        _categoriesAndSliders=categoriesAndSliders;
        emit(GetCategoriesAndSlidersSuccessState(categoriesAndSliders: categoriesAndSliders));
      }
    );
  }
}