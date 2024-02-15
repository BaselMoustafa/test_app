import 'package:assignment_app/hotels_and_restaurants/domain/model/hotel.dart';

abstract class GetHotelsCubitStates {}

class GetHotelsInitialState extends GetHotelsCubitStates{}

class GetHotelsLoadingState extends GetHotelsCubitStates{}

class GetHotelsSuccessState extends GetHotelsCubitStates{
  final List<Hotel>hotels;
  GetHotelsSuccessState({required this.hotels});
}

class GetHotelsFailedState extends GetHotelsCubitStates{
  final String message;
  GetHotelsFailedState({required this.message});
}