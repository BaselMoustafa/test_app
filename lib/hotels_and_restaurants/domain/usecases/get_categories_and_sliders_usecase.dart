import 'package:assignment_app/core/error/failures.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/categories_and_sliders.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/repo/repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCategoriesAndSlidersUsecase extends Equatable{
  final Repo repo;
  const GetCategoriesAndSlidersUsecase({required this.repo});

  Future<Either<Failure,CategoriesAndSliders>> excute()async{
    return await repo.getCategoriesAndSliders();
  }

  @override
  List<Object?> get props => [repo];
}