import 'package:assignment_app/core/service_locator/service_locator.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/controller/get_categories_and_sliders_cubit/get_categories_and_sliders_cubit.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/controller/get_hotels_cubit/get_hotels_cubit.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/controller/get_restaurants_cubit/get_restaurants_cubit.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/widgets/main_layout_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>getIt<GetHotelsCubit>()..getHotels()),
        BlocProvider(create: (context)=>getIt<GetRestaurantsCubit>()),
        BlocProvider(create: (context)=>getIt<GetCategoriesAndSlidersCubit>()..getCategoriesAndSliders()),
      ], 
      child: const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: MainLayoutWidget(),
      ),
    );
  }
}
