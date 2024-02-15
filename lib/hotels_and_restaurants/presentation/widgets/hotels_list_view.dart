import 'package:assignment_app/core/resources/color_manager.dart';
import 'package:assignment_app/core/widgets/custom_network_image.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/hotel.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/widgets/hotels_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:rate/rate.dart';

class HotelsListView extends StatelessWidget {
  const HotelsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return HotelsBlocBuilder(
      successBuilder: (hotels) {
        return ListView.separated(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: hotels.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10,),
          itemBuilder: (context, index) => _HotelWidget(hotel: hotels[index]),
        );
      },
    );
  }
}

class _HotelWidget extends StatelessWidget {
  const _HotelWidget({
    required this.hotel,
  });
  final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HotelImage(hotel: hotel),
          const SizedBox(height: 5,),
          Text(hotel.name??"Not Exists",style:const TextStyle(fontSize: 18),),
          const SizedBox(height: 10,),
          Rate(
            allowHalf: true,
            readOnly: true,
            initialValue: double.parse(hotel.rating.toString()),
          ),
          const SizedBox(height: 10,),
          _HotelAddress(hotel: hotel),
          const SizedBox(height: 5,),
          _HotelPrice(hotel: hotel),
        ],
      ),
    );
  }
}

class _HotelImage extends StatelessWidget {
  const _HotelImage({
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration:const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topEnd:Radius.circular(10),
            topStart:Radius.circular(10),
          ),
        ),
        child: CustomNetwrorkImage(image: hotel.image),
      ),
    );
  }
}

class _HotelAddress extends StatelessWidget {
  const _HotelAddress({
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.location_on,color: ColorManager.primary,),
        Expanded(child: Text(hotel.address??"Not Exists",style:const TextStyle(color: ColorManager.grey),)),
      ],
    );
  }
}

class _HotelPrice extends StatelessWidget {
  const _HotelPrice({
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          hotel.price.toString(),
          style: const TextStyle(fontSize: 40,),
        ),
        const SizedBox(width: 5,),
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            "AED",
            style: TextStyle(color: ColorManager.primary,fontSize: 21,),
          ),
        )
      ],
    );
  }
}
