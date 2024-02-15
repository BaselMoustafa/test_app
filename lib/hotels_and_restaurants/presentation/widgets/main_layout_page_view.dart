import 'package:assignment_app/hotels_and_restaurants/presentation/pages/account_page.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/pages/favorites_page.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/pages/home_page.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';

class MainLayoutPageView extends StatelessWidget {
  final PageController pageController;
  const MainLayoutPageView({super.key,required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics:const NeverScrollableScrollPhysics(),
      controller: pageController,
      scrollDirection: Axis.horizontal,
      children:const [
        HomePage(),
        SearchPage(),
        FavoritesPage(),
        AccountPage()
      ],
    );
  }
}