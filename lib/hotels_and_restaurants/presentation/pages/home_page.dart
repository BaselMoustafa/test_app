import 'package:assignment_app/hotels_and_restaurants/domain/model/categories_and_sliders.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/slider.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/widgets/categories_and_sliders_bloc_builder.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/widgets/categories_widget.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/widgets/hotels_list_view.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/widgets/hotels_or_restaurants_button.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/widgets/restaurants_listview.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/widgets/sliders_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _hotelsIsSelected=true;

  @override
  Widget build(BuildContext context) {
    return CategoriesAndSlidersBlocBuilder(
      successBuilder: (CategoriesAndSliders categoriesAndSliders) {
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            _SliderWithSelectButton(
              sliders: categoriesAndSliders.sliders,
              onChangeHotelsOrRestaurants: _onChangeHotelsOrRestaurants,
            ),
            
            const SizedBox(height: 20,),

            CategoriesWidget(categories: categoriesAndSliders.categories),

            const SizedBox(height: 20,),

            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 10),
              child: Text("All ${_hotelsIsSelected?"Hotels":"Restaurants"}",style:const TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
            ),

            const SizedBox(height: 10,),

            _hotelsIsSelected?const HotelsListView():const RestaurantsListView(),

          ],
        );
      },
    );
  }

  void _onChangeHotelsOrRestaurants(hotelsIsSelected) {
    _hotelsIsSelected=hotelsIsSelected;
    setState(() {});
  }
}

class _SliderWithSelectButton extends StatelessWidget {
  const _SliderWithSelectButton({required this.sliders,required this.onChangeHotelsOrRestaurants});
  final List<SliderModel>sliders;
  final void Function(bool hotelsIsSelected)onChangeHotelsOrRestaurants;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          SlidersWidget(sliders: sliders),
          Align(
            alignment: Alignment.bottomCenter,
            child: HotelsOrRestaurantsButton(
              onChangeHotelsOrRestaurants: onChangeHotelsOrRestaurants,
            ),
          )
        ],
      ),
    );
  }
}