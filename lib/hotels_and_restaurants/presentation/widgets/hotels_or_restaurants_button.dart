import 'package:assignment_app/core/resources/color_manager.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/controller/get_hotels_cubit/get_hotels_cubit.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/controller/get_restaurants_cubit/get_restaurants_cubit.dart';
import 'package:flutter/material.dart';

class HotelsOrRestaurantsButton extends StatefulWidget {
  const HotelsOrRestaurantsButton({super.key,required this.onChangeHotelsOrRestaurants});
  final void Function(bool hotelsIsSelected)onChangeHotelsOrRestaurants;
  @override
  State<HotelsOrRestaurantsButton> createState() => _HotelsOrRestaurantsButtonState();
}

class _HotelsOrRestaurantsButtonState extends State<HotelsOrRestaurantsButton> with AutomaticKeepAliveClientMixin{
  late bool _hotelsIsSelected=true;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: 70,
      margin:const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(10),
      decoration: _getBoxDecoration(),
      child: Row(
        children: [
          _Button(
            forHotels: true, 
            isSelected: _hotelsIsSelected,
            onTap: _onTapHotels,
          ),
          _Button(
            forHotels: false, 
            isSelected: !_hotelsIsSelected,
            onTap: _onTapRestaurants,
          ),
        ],
      ),
    );
  }

  void _onTapHotels(){
    if(_hotelsIsSelected==false){
      GetHotelsCubit.get(context).getHotels();
      _hotelsIsSelected=true;
      widget.onChangeHotelsOrRestaurants.call(_hotelsIsSelected);
      setState(() {});
    }
  }

  void _onTapRestaurants(){
    if(_hotelsIsSelected==true){
      GetRestaurantsCubit.get(context).getRestaurants();
      _hotelsIsSelected=false;
      widget.onChangeHotelsOrRestaurants.call(_hotelsIsSelected);
      setState(() {});
    }
  }

  BoxDecoration _getBoxDecoration() => BoxDecoration(
    color: ColorManager.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(color: ColorManager.grey.withOpacity(0.8),blurRadius: 10)
    ]
  );
}

class _Button extends StatelessWidget {
  const _Button({
    required this.forHotels,
    required this.isSelected,
    required this.onTap
  });
  final bool forHotels;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: isSelected==false?null:BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Text(
              forHotels?"Hotels":"Restaurants",
              style: TextStyle(
                fontSize: 18,
                color: isSelected?ColorManager.white:ColorManager.primary,
              ),
            
            ),
          ),
        ),
      ),
    );
  }
}