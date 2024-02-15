import 'package:assignment_app/hotels_and_restaurants/domain/model/restaurant.dart';

abstract class GetRestaurantsCubitStates {}

class GetRestaurantsInitialState extends GetRestaurantsCubitStates{}

class GetRestaurantsLoadingState extends GetRestaurantsCubitStates{}

class GetRestaurantsSuccessState extends GetRestaurantsCubitStates{
  final List<Restaurant>restaurants;
  GetRestaurantsSuccessState({required this.restaurants});
}

class GetRestaurantsFailedState extends GetRestaurantsCubitStates{
  final String message;
  GetRestaurantsFailedState({required this.message});
}