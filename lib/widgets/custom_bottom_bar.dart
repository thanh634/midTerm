import 'package:flutter/material.dart';
import '../core/app_export.dart';

enum BottomBarEnum { Home, Rewards, Orders }

class CustomBottomBar extends StatefulWidget {
  final BottomBarEnum initialTab; // Add this property

  const CustomBottomBar({super.key, required this.initialTab});

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}


class BottomMenuModel {
  BottomMenuModel(
      {required this.icon, required this.activeIcon, required this.type});

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class CustomBottomBarState extends State<CustomBottomBar> {
  late BottomBarEnum selectedTab;
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedTab = widget.initialTab;
    selectedIndex =
        bottomMenuList.indexWhere((menu) => menu.type == selectedTab);
  }

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHome,
      activeIcon: ImageConstant.imgHomeActive,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgRewards,
      activeIcon: ImageConstant.imgRewardsActive,
      type: BottomBarEnum.Rewards,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgOrder,
      activeIcon: ImageConstant.imgOrderActive,
      type: BottomBarEnum.Orders,
    )
  ];

  // Method to handle tab change and routing
  void _onTabChanged(BottomBarEnum newTab) {
    switch (newTab) {
      case BottomBarEnum.Home:
        Navigator.pushNamed(context, '/home_page');
        break;
      case BottomBarEnum.Rewards:
        Navigator.pushNamed(context, '/rewards_page');
        break;
      case BottomBarEnum.Orders:
        Navigator.pushNamed(context, '/my_current_order_page');
        break;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.h),
        boxShadow: [
          BoxShadow(
            color: const Color(0X1E000000),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: bottomMenuList.map((menu) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: menu.icon,
              height: 3.5.h,
              width: 8.w,
              color: const Color(0XFFD7D7D7),
            ),
            activeIcon: CustomImageView(
              imagePath: menu.activeIcon,
              height: 3.5.h,
              width: 8.w,
              color: const Color(0XFF324A59),
            ),
            label: '',
          );
        }).toList(),
        onTap: (index) {
          _onTabChanged(bottomMenuList[index].type);
        },
      ),
    );
  }
}


class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffffff),
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(fontSize: 18,),
            )
          ],
        ),
      ),
    );
  }
}
