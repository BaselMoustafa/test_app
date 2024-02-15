import 'package:assignment_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Center(
      child: CircularProgressIndicator(
        color: ColorManager.primary,
      ),
    );
  }
}