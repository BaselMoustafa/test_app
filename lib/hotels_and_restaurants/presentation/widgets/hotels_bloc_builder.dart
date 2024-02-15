import 'package:assignment_app/core/widgets/exception_widget.dart';
import 'package:assignment_app/core/widgets/loading_widget.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/hotel.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/controller/get_hotels_cubit/get_hotels_cubit.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/controller/get_hotels_cubit/get_hotels_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelsBlocBuilder extends StatelessWidget {
  final Widget Function(List<Hotel> hotels) successBuilder;
  const HotelsBlocBuilder({
    super.key,
    required this.successBuilder,  
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHotelsCubit,GetHotelsCubitStates>(
      builder: (context, state) {
        if(state is GetHotelsSuccessState){
          return successBuilder(state.hotels);
        }
        if(state is GetHotelsFailedState){
          return ExceptionWidget(message: state.message);
        }
        return const LoadingWidget();

      },
    );
  }
}