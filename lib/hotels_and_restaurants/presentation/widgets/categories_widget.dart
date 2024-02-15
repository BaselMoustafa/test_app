import 'package:assignment_app/core/widgets/custom_network_image.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/category.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key,required this.categories});
  final List<Category>categories;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Explore By Category",
            style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5,),
          _CategoriesListView(categories: categories)
        ],
      ),
    );
  }
}

class _CategoriesListView extends StatelessWidget {
  const _CategoriesListView({required this.categories});
  final List<Category>categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 15,), 
        itemBuilder: (context, index) {
          return Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: 80,
                  child: CustomNetwrorkImage(image: categories[index].image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(categories[index].name??"Not Exists"),
              ),
            ],
          );
        },
        
        
      ),
    );
  }
}