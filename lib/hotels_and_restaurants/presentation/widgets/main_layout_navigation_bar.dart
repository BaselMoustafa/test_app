import 'package:assignment_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class MainLayoutNavigationBar extends StatelessWidget {
  const MainLayoutNavigationBar({super.key,required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _getBoxDecoration(),
      child:_BottomSheetDesign(pageController: pageController,),
    );
  }

  BoxDecoration _getBoxDecoration() {
    return BoxDecoration(
      color: ColorManager.white,
      boxShadow: [
        BoxShadow(color: ColorManager.grey.withOpacity(0.3),blurRadius: 20)
      ]
    );
  }
}

class _BottomSheetDesign extends StatefulWidget {
  const _BottomSheetDesign({required this.pageController});
  final PageController pageController;
  @override
  State<_BottomSheetDesign> createState() => _BottomSheetDesignState();
}

class _BottomSheetDesignState extends State<_BottomSheetDesign> {
  int _selectedIndex=0;
  late List<_NavigationBarItemInfo>_navigationBarItemsInfo;

  @override
  void initState() {
    super.initState();
    _navigationBarItemsInfo=const [
      _NavigationBarItemInfo(iconData: Icons.home,label: "Home"),
      _NavigationBarItemInfo(iconData: Icons.search,label: "Search"),
      _NavigationBarItemInfo(iconData: Icons.favorite,label: "Favorites"),
      _NavigationBarItemInfo(iconData: Icons.person,label: "Account"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for(int i=0;i<_navigationBarItemsInfo.length;i++)
        InkWell(
          onTap: (){
            _selectedIndex=i;
            widget.pageController.animateToPage(
              _selectedIndex, 
              duration: const Duration(milliseconds: 750), 
              curve: Curves.ease,
            );
            setState(() {});
          },
          child: _NavigationBarItem(
            isSelected: i==_selectedIndex, 
            navigationBarInfo: _navigationBarItemsInfo[i], 
          ),
        ),
      ],
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    required this.navigationBarInfo,
    required this.isSelected,
  });
  final bool isSelected;
  final _NavigationBarItemInfo navigationBarInfo;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:  isSelected?ColorManager.primary.withOpacity(0.3):null
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                navigationBarInfo.iconData,
                color:isSelected?ColorManager.primary: ColorManager.grey,
              ),
              const SizedBox(height: 3,),
              Text(
                navigationBarInfo.label,
                style: TextStyle(
                  color:isSelected?ColorManager.primary: ColorManager.grey,
                ),
              )
            ],
          ),
        ),
      );
  }
}

class _NavigationBarItemInfo{
  final String label;
  final IconData iconData;
  const _NavigationBarItemInfo({required this.iconData,required this.label});
}
