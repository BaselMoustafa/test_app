import 'package:assignment_app/hotels_and_restaurants/domain/model/categories_and_sliders.dart';

abstract class GetCategoriesAndSlidersCubitStates {}

class GetCategoriesAndSlidersInitialState extends GetCategoriesAndSlidersCubitStates{}

class GetCategoriesAndSlidersLoadingState extends GetCategoriesAndSlidersCubitStates{}

class GetCategoriesAndSlidersSuccessState extends GetCategoriesAndSlidersCubitStates{
  final CategoriesAndSliders categoriesAndSliders;
  GetCategoriesAndSlidersSuccessState({required this.categoriesAndSliders});
}

class GetCategoriesAndSlidersFailedState extends GetCategoriesAndSlidersCubitStates{
  final String message;
  GetCategoriesAndSlidersFailedState({required this.message});
}