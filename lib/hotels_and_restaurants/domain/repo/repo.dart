import 'package:assignment_app/core/error/failures.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/categories_and_sliders.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/hotel.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/restaurant.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Repo extends Equatable{
  const Repo();

  Future<Either<Failure,List<Hotel>>>getHotels();
  Future<Either<Failure,List<Restaurant>>>getRestaurants();
  Future<Either<Failure,CategoriesAndSliders>>getCategoriesAndSliders();
}