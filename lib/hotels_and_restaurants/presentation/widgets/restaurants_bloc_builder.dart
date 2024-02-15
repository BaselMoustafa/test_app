import 'package:assignment_app/core/widgets/exception_widget.dart';
import 'package:assignment_app/core/widgets/loading_widget.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/restaurant.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/controller/get_restaurants_cubit/get_restaurants_cubit.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/controller/get_restaurants_cubit/get_restaurants_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantBlocBuilder extends StatelessWidget {
  final Widget Function(List<Restaurant> restaurants) successBuilder;
  const RestaurantBlocBuilder({
    super.key,
    required this.successBuilder,  
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRestaurantsCubit,GetRestaurantsCubitStates>(
      builder: (context, state) {
        if(state is GetRestaurantsSuccessState){
          return successBuilder(state.restaurants);
        }
        if(state is GetRestaurantsFailedState){
          return ExceptionWidget(message: state.message);
        }
        return const LoadingWidget();

      },
    );
  }
}