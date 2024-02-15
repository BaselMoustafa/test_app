abstract class ApiConstants{
  
  static const String baseUrl="https://api.tajj.xyz/v1/";
  static const String hotelsEndPoint="users/hotels";
  static const String restaurantsEndPoint="users/restaurants";
  static const String categoriesAndSlidersEndPoint="meta/data";
  static const Map<String,dynamic> defaultHeaders={
    "Content-Type"   :  "application/json" ,
    "Accept"         :  "application/json" ,
    "Accept-Language":  "ar",
  };
  
}