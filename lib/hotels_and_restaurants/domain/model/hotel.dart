import 'package:assignment_app/core/constants/constants.dart';
import 'package:equatable/equatable.dart';

class Hotel extends Equatable{
  final String? image;
  final String? name;
  final num rating;
  final String? address;
  final num price;

  const Hotel({
    required this.address,
    required this.image,
    required this.price,
    required this.rating,
    required this.name,
  });
  
  factory Hotel.fromMap(Map<String,dynamic>map){
    return Hotel(
      address: map[KConst.address][KConst.details][KConst.en], 
      image: map[KConst.image][KConst.responsiveUrls][0], 
      price: map[KConst.cheapestRoom][KConst.price], 
      rating: map[KConst.rating], 
      name: map[KConst.name][KConst.en],
    );
  }


  @override
  List<Object?> get props => [
    address,
    image,
    price,
    rating,
    name,
  ];
}