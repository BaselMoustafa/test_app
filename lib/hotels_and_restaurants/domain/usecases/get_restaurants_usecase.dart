import 'package:assignment_app/core/error/failures.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/restaurant.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/repo/repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRestaurantsUsecase extends Equatable{
  final Repo repo;
  const GetRestaurantsUsecase({required this.repo});

  Future<Either<Failure,List<Restaurant>>> excute()async{
    return await repo.getRestaurants();
  }

  @override
  List<Object?> get props => [repo];
}