import 'package:assignment_app/core/constants/constants.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/category.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/slider.dart';
import 'package:equatable/equatable.dart';

class CategoriesAndSliders extends Equatable{
  final List<Category>categories;
  final List<SliderModel>sliders;

  const CategoriesAndSliders({
    required this.categories,
    required this.sliders,
  });

  factory CategoriesAndSliders.fromMap(Map<String,dynamic>map){
    final List<Category>modeledCategories=[];
    final List<SliderModel>modeledSliders=[];
    for (var i = 0; i < map[KConst.categories].length; i++) {
      modeledCategories.add(Category.fromMap(map[KConst.categories][i]));
    }
    for (var i = 0; i < map[KConst.sliders].length; i++) {
      modeledSliders.add(SliderModel.fromMap(map[KConst.sliders][i]));
    }
    return CategoriesAndSliders(categories: modeledCategories, sliders: modeledSliders);
  }

  @override
  List<Object?> get props => [
    categories,
    sliders,
  ];

}