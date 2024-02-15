import 'package:assignment_app/core/constants/constants.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable{
  final String? name;
  final String? image;

  const Category({required this.image,required this.name});
  
  factory Category.fromMap(Map<String,dynamic>map){
    return Category(
      name: map[KConst.name][KConst.en],
      image:map[KConst.image]!=null?map[KConst.image][KConst.responsiveUrls][0]:null, 
    );
  }


  @override
  List<Object?> get props => [
    image,
    name,
  ];
}