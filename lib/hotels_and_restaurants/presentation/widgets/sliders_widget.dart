import 'package:assignment_app/core/widgets/custom_network_image.dart';
import 'package:assignment_app/hotels_and_restaurants/domain/model/slider.dart';
import 'package:flutter/material.dart';

class SlidersWidget extends StatelessWidget {
  const SlidersWidget({super.key,required this.sliders});
  final List<SliderModel>sliders;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 265,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          for(int i=0;i<sliders.length;i++)
          _OneSliderWidget(slider: sliders[i],)
        ],
      ),
    );
  }
}

class _OneSliderWidget extends StatelessWidget {
  const _OneSliderWidget({
    required this.slider,
  });
  final SliderModel slider;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          
          child: CustomNetwrorkImage(image: slider.image),
        )
      ],
    );
  }
}