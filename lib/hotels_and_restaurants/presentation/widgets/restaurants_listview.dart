import 'package:assignment_app/core/resources/color_manager.dart';
import 'package:assignment_app/core/widgets/custom_network_image.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/restaurant.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/widgets/restaurants_bloc_builder.dart';
import 'package:flutter/material.dart';

class RestaurantsListView extends StatelessWidget {
  const RestaurantsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return RestaurantBlocBuilder(
      successBuilder: (restaurants) {
        return ListView.separated(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: restaurants.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10,),
          itemBuilder: (context, index) => _RestaurantWidget(restaurant: restaurants[index]),
        );
      },
    );
  }
}

class _RestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;
  const _RestaurantWidget({
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow:const [
          BoxShadow(color: ColorManager.grey,blurRadius: 10),
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: _ImageAndLogo(restaurant: restaurant),
          ),
          Expanded(
            flex: 1,
            child:_RestaurantInfo(restaurant: restaurant,),
          ),
        ],
      ),
    );
  }
}

class _RestaurantInfo extends StatelessWidget {
  final Restaurant restaurant;
  const _RestaurantInfo({
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name??"Not Exists",
            style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),  
          ),
          const Spacer(),
          Text(
            restaurant.address??"Not Exists",
            maxLines: 1,overflow: TextOverflow.ellipsis,
            style:const TextStyle(color: ColorManager.grey),
          ),
          const Spacer(),
          const Text(
            "Dine on authentic Persian food",
            style: TextStyle(color: ColorManager.primary),
          ),
        ],
      ),
    );
  }
}

class _ImageAndLogo extends StatelessWidget {
  const _ImageAndLogo({
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomNetwrorkImage(image: restaurant.image),
        PositionedDirectional(
          bottom: -35,
          end: 25,
          child: Container(
            height: 75,
            width: 75,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: CustomNetwrorkImage(image: restaurant.logo),
          ),
        ),
      ],
    );
  }
}