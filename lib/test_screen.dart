import 'package:assignment_app/core/service_locator/service_locator.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/usecases/get_categories_and_sliders_usecase.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/usecases/get_hotels_usecase.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/usecases/get_restaurants_usecase.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50,),
          ElevatedButton(onPressed: (){
            GetHotelsUsecase(repo: getIt()).excute();
          }, child: const Text("hotels")),

          ElevatedButton(onPressed: (){
            GetRestaurantsUsecase(repo: getIt()).excute();
          }, child: const Text("restaurants")),

          ElevatedButton(onPressed: (){
            GetCategoriesAndSlidersUsecase(repo: getIt()).excute();
          }, child: const Text("categs and sliders"))
        ],
      ),
    );
  }
}