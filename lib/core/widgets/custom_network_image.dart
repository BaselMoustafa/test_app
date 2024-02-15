import 'package:flutter/material.dart';

class CustomNetwrorkImage extends StatelessWidget {
  const CustomNetwrorkImage({super.key,required this.image});
  final String? image;

  @override
  Widget build(BuildContext context) {
    return image==null?const Icon(Icons.error): Image.network(
      image!,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error);
      },
    );
  }
}