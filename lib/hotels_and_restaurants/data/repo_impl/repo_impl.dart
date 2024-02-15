import 'package:assignment_app/core/error/exceptions.dart';
import 'package:assignment_app/core/error/failures.dart';
import 'package:assignment_app/core/network/network_connection_info/network_connection_info.dart';
import 'package:assignment_app/hotels_and_restaurants/data/data_source/remote_data_source.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/categories_and_sliders.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/hotel.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/restaurant.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/repo/repo.dart';

import 'package:dartz/dartz.dart';

class RepoImpl extends Repo{
  final NetworkConnectionInfo networkConnectionInfo;
  final RemoteDataSource remoteDataSource;
  const RepoImpl({
    required this.networkConnectionInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure,List<Hotel>>>getHotels(){
    return _failureHandler(
      functionToExcute: () async{
        return await remoteDataSource.getHotels();
      },
    );
  }

  @override
  Future<Either<Failure,List<Restaurant>>>getRestaurants(){
    return _failureHandler(
      functionToExcute: () async{
        return await remoteDataSource.getRestaurants();
      },
    );
  }

  @override
  Future<Either<Failure,CategoriesAndSliders>>getCategoriesAndSliders(){
    return _failureHandler(
      functionToExcute: () async{
        return await remoteDataSource.getCategoriesAndSliders();
      },
    );
  }

  Future<Either<Failure,T>>  _failureHandler<T>({
    required  Future<T> Function() functionToExcute,
  })async{
    if(await networkConnectionInfo.isConnected){
      try {
        return Right(await functionToExcute.call());
      } on RemoteDataBaseException catch ( e) {
        return Left(RemoteDataBaseFailure(message: e.message)); 
      }
    }
    return const Left(OfflineFailure());
  }

  @override
  List<Object?> get props => [
    networkConnectionInfo,
    remoteDataSource,
  ];

  
}