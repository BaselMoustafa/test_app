import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Spacer(),
        Text("Favorites",style: TextStyle(fontSize: 30),),
        Spacer(),
      ],
    );
  }
}