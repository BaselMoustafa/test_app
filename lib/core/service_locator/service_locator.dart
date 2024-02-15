import 'package:assignment_app/hotels_and_restaurants/data/data_source/remote_data_source.dart';
import 'package:assignment_app/hotels_and_restaurants/data/repo_impl/repo_impl.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/repo/repo.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/usecases/get_categories_and_sliders_usecase.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/usecases/get_hotels_usecase.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/usecases/get_restaurants_usecase.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/controller/get_categories_and_sliders_cubit/get_categories_and_sliders_cubit.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/controller/get_hotels_cubit/get_hotels_cubit.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/controller/get_restaurants_cubit/get_restaurants_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../network/api/api_helper.dart';
import '../network/network_connection_info/network_connection_info.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    //Cubits=============================================================
    getIt.registerFactory(
      () => GetHotelsCubit(
        getHotelsUsecase: getIt(),
      ),
    );
    getIt.registerFactory(
      () => GetRestaurantsCubit(
        getRestaurantsUsecase: getIt(),
      ),
    );
    getIt.registerFactory(
      () => GetCategoriesAndSlidersCubit(
        getCategoriesAndSlidersUsecase: getIt(),
      ),
    );
    
    //Usecases=============================================================
    getIt.registerLazySingleton(
      () => GetHotelsUsecase(
        repo: getIt(),
      ),
    );
    getIt.registerLazySingleton(
      () => GetRestaurantsUsecase(
        repo: getIt(),
      ),
    );
    getIt.registerLazySingleton(
      () => GetCategoriesAndSlidersUsecase(
        repo: getIt(),
      ),
    );
    
    //Reposatory=============================================================
    getIt.registerLazySingleton<Repo>(
      () =>RepoImpl(networkConnectionInfo: getIt(), remoteDataSource: getIt()),
    );


    //DataSource=============================================================
    getIt.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(
          apiHelper: getIt(),
        ));

    //Helpers================================================================
    getIt.registerLazySingleton<ApiHelper>(
      () => ApiHelperImpl()
    );
    getIt.registerLazySingleton<NetworkConnectionInfo>(
      () => NetworkConnectionInfoImple(
        internetConnectionChecker: InternetConnectionChecker(),
      )
    );
  }
}
