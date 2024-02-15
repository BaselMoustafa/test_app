import 'package:assignment_app/core/resources/color_manager.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/widgets/main_layout_navigation_bar.dart';
import 'package:assignment_app/hotels_and_restaurants/presentation/widgets/main_layout_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainLayoutWidget extends StatefulWidget {
  const MainLayoutWidget({super.key});

  @override
  State<MainLayoutWidget> createState() => _MainLayoutWidgetState();
}

class _MainLayoutWidgetState extends State<MainLayoutWidget> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController=PageController();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: ColorManager.transparent));
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              SizedBox(
                height: constraints.maxHeight-80,
                child:MainLayoutPageView(pageController: _pageController),
              ),
              SizedBox(
                height: 80,
                child: MainLayoutNavigationBar(pageController: _pageController,),
              ),
            ],
          );
        },
      ),
    );
  }
}