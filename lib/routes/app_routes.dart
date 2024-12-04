import 'package:flutter/material.dart';
import 'package:midterm/presentation/my_current_order_page.dart';
import '../presentation/details_screen.dart';
import '../presentation/home_screen.dart';
import '../presentation/my_cart_screen.dart';
import '../presentation/order_success_screen.dart';
import '../presentation/profile_screen.dart';
import '../presentation/redeem_rewards_screen.dart';
import '../presentation/rewards_page.dart';
import '../presentation/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String homePage = '/home_page';
  static const String detailsScreen = '/details_screen';
  static const String myCartScreen = '/my_cart_screen';
  static const String orderSuccessScreen = '/order_success_screen';
  static const String profileScreen = '/profile_screen';
  static const String rewardsPage = '/rewards_page';
  static const String redeemRewardsScreen = '/redeem_rewards_screen';
  static const String myCurrentOrderPage = '/my_current_order_page';
  static const String myCurrentTabPage = '/my_current_tab_page';
  static const String myOrderHistoryPage = '/my_order_history_page';
  static const String initialRoute = '/initialRoute';
  
  static Map<String, WidgetBuilder> get routes => {
    splashScreen: SplashScreen.builder,
    detailsScreen: DetailsScreen.builder,
    homePage: HomePage.builder,
    myCartScreen: MyCartScreen.builder,
    orderSuccessScreen: OrderSuccessScreen.builder,
    profileScreen: ProfileScreen.builder,
    redeemRewardsScreen: RedeemRewardsScreen.builder,
    rewardsPage : RewardsPage.builder,
    initialRoute: SplashScreen.builder,
    myCurrentOrderPage: MyCurrentOrderPage.builder
  };
}
