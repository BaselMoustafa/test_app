import 'package:flutter/material.dart';

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget({super.key,required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50,),
        const Icon(Icons.error,size: 80,),
        const SizedBox(height: 10,),
        Text(message),
      ],
    );
  }
}