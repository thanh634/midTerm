import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_bottom_bar.dart';
import 'profile_screen.dart';
import 'my_cart_screen.dart';
import '../../widgets/loyalty_card_item_widget.dart';
import '../../widgets/coffee_selection_grid_item_widget.dart';

class HomeProvider extends ChangeNotifier {
  HomeModel homeModelObj = HomeModel();

}

// HOME INITIAL PAGE

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        return const HomePage();
      },
    );
  }
}



class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          // Main Page Content based on selected tab
          _buildLayout(context),
          // Floating Bottom Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.all(1.w),
              child: const CustomBottomBar(initialTab: BottomBarEnum.Home),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLayout(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Column(
        children: [
          // App Bar
          SizedBox(
            width: 100.w,
            child: _buildAppBar(context),
          ),
          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(height: 4.h),
                    _buildLoyaltyCardSection(context),
                    SizedBox(height: 4.h),
                    Container(
                      width: double.maxFinite,

                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadiusStyle.customBorderTL24,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 17.w),
                            child: Text(
                              "msg_choose_your_coffee".tr,
                              style: CustomTextStyles.titleMediumBluegray100.copyWith(
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          _buildCoffeeSelectionGrid(context),
                          SizedBox(height: 5.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 5.w),
        child: Column(
          children: [
            AppbarSubtitleOne(
              text: "lbl_good_morning".tr,
            ),
            AppbarTitle(
              text: "lbl_anderson".tr,
            ),
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyCartScreen.builder(context)),
            );
          },
          child: Container(
            color: Colors.transparent,
            height: 5.h,
            width: 5.w,
            child: Icon(Icons.shopping_cart, size: 5.h),
          ),
        ),
        SizedBox(width: 5.h),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen.builder(context)),
            );
          },
          child: Container(
            color: Colors.transparent,
            height: 5.h,
            width: 5.w,
            child: Icon(Icons.person, size: 5.h),
          ),
        ),
        SizedBox(width: 5.h),
      ],
    );
  }

  Widget _buildLoyaltyCardSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 1.w),
      child: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          final model = provider.homeModelObj.loyaltyCardItemModel;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            child: LoyaltyCardItemWidget(model),
          );
        },
      ),
    );
  }

  Widget _buildCoffeeSelectionGrid(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return ResponsiveGridListBuilder(
          minItemWidth: 1,
          minItemsPerRow: 2,
          maxItemsPerRow: 2,
          horizontalGridSpacing: 5.h,
          verticalGridSpacing: 5.h,
          builder: (context, items) => ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            children: items,
          ),
          gridItems: List.generate(
            provider.homeModelObj.coffeeSelectionGridItemList.length,
                (index) {
              CoffeeSelectionGridItemModel model =
              provider.homeModelObj.coffeeSelectionGridItemList[index];
              return CoffeeSelectionGridItemWidget(model);
            },
          ),
        );
      },
    );
  }
}


