import 'package:assignment_app/core/constants/constants.dart';
import 'package:equatable/equatable.dart';

class Restaurant extends Equatable{
  final String? image;
  final String? name;
  final String? address;
  final String? logo;

  const Restaurant({
    required this.address,
    required this.image,
    required this.logo,
    required this.name,
  });
  
  factory Restaurant.fromMap(Map<String,dynamic>map){
    return Restaurant(
      address: map[KConst.address][KConst.details][KConst.en], 
      image: map[KConst.image][KConst.responsiveUrls][0], 
      logo: map[KConst.logo][KConst.responsiveUrls][0], 
      name: map[KConst.name][KConst.en],
    );
  }


  @override
  List<Object?> get props => [
    address,
    image,
    logo,
    name,
  ];
}