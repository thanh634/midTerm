import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/price_list_section_item_widget.dart';
import '../../widgets/custom_bottom_bar.dart';

import 'my_order_history_page.dart';



class MyCurrentOrderProvider extends ChangeNotifier {
  MyCurrentOrderModel myCurrentOrderModelObj = MyCurrentOrderModel();

  MyCurrentTabModel myCurrentTabModelObj = MyCurrentTabModel();

}

class MyCurrentOrderPage extends StatefulWidget {
  const MyCurrentOrderPage({super.key});
  @override

  MyCurrentOrderPageState createState() => MyCurrentOrderPageState();
  static Widget builder (BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyCurrentOrderProvider(),
      child: const MyCurrentOrderPage(),
    );
  }
}

class MyCurrentOrderPageState extends State<MyCurrentOrderPage> with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

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
              margin: EdgeInsets.all(1.h),
              child: const CustomBottomBar(initialTab: BottomBarEnum.Orders),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLayout(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 1.h),
              _buildOngoingTabSection(context),
              const SizedBox(
                width: double.maxFinite,
                child: Divider(),
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      MyCurrentTabPage.builder(context),
                      MyOrderHistoryPage.builder(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarSubtitle(
        text: "lbl_my_order".tr,

      ),
    );
  }

  Widget _buildOngoingTabSection (BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: TabBar(
              controller: tabviewController,
              labelPadding: EdgeInsets.zero,
              labelColor: appTheme.gray90001,
              labelStyle: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelColor: appTheme.blueGray100,
              unselectedLabelStyle: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
              indicatorColor: theme.colorScheme.primary,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Text(
                    "lbl_on_going".tr,
                  ),
                ),
                Tab(
                  child: Text(
                    "lbl_history".tr,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyCurrentTabPage extends StatefulWidget {
  const MyCurrentTabPage({super.key});

  @override

  MyCurrentTabPageState createState() => MyCurrentTabPageState();
  static Widget builder (BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyCurrentOrderProvider(),
      child: const MyCurrentTabPage(),
    );
  }

}


class MyCurrentTabPageState extends State<MyCurrentTabPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 1.h,
      ),
      child: Column(
        children: [_buildPriceListSection(context)],
      ),

    );
  }

  /// Section Widget
  Widget _buildPriceListSection (BuildContext context) {
    return Expanded(
      child: Consumer <MyCurrentOrderProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 5.h),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0.h),
                child: Divider(
                  height: 1.h,
                  thickness: 0.5.h,
                  color: appTheme.gray100,
                ),
              );
            },
            itemCount:
            provider.myCurrentTabModelObj.priceListSectionItemList.length,
            itemBuilder: (context, index) {
              PriceListSectionItemModel model =
                provider.myCurrentTabModelObj.priceListSectionItemList[index];
              return PriceListSectionItemWidget(model,);
            },
          );
        },
      ),
    );
  }
}