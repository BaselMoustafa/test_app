import 'package:assignment_app/core/error/failures.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/hotel.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/repo/repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetHotelsUsecase extends Equatable{
  final Repo repo;
  const GetHotelsUsecase({required this.repo});

  Future<Either<Failure,List<Hotel>>> excute()async{
    return await repo.getHotels();
  }

  @override
  List<Object?> get props => [repo];
}