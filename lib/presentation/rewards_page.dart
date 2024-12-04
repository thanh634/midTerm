import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/rewards_history_section_item_widget.dart';
import '../../widgets/loyalty_card_item_widget.dart';
import '../../widgets/redeem_card_item_widget.dart';
import '../../widgets/custom_bottom_bar.dart';

import 'redeem_rewards_screen.dart';


class RewardsProvider extends ChangeNotifier {
  RewardsModel rewardsModelObj = RewardsModel();

}

class RewardsPage extends StatefulWidget {
  const RewardsPage({super.key});

  @override
  RewardsPageState createState() => RewardsPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RewardsProvider(),
      builder: (context, child) {
        return const RewardsPage();
      },
    );
  }
}

class RewardsPageState extends State<RewardsPage> {

  @override
  void initState() {
    super.initState();
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
              margin: EdgeInsets.all(1.w),
              child: const CustomBottomBar(initialTab: BottomBarEnum.Rewards),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLayout(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 1.w,
                top: 1.h,
                right: 1.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLoyaltyCardSection(context),
                  SizedBox(height: 1.h),
                  _buildRedeemCardSection(context),
                  SizedBox(height: 4.h),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      "lbl_history_rewards".tr,
                      style: CustomTextStyles.titleSmallPoppinsPrimary_1.copyWith(
                        fontSize: 20.sp
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  _buildRewardsHistorySection(context),
                  SizedBox(height: 10.h,),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

  PreferredSizeWidget _buildAppBar (BuildContext context)
  {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarSubtitle(
        text: "lbl_rewards".tr,
      ),
    );
  }
  /// Section Widget
  Widget _buildLoyaltyCardSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 1.w),
      child: Consumer<RewardsProvider>(
        builder: (context, provider, child) {
          // Access the single LoyaltyCardItemModel
          final model = provider.rewardsModelObj.loyaltyCardItemModel;

          // Display the single loyalty card item
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            child: LoyaltyCardItemWidget(model),
          );
        },
      ),
    );
  }

  Widget _buildRedeemCardSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 1.w),
      child: Consumer<RewardsProvider>(
        builder: (context, provider, child) {
          // Access the single LoyaltyCardItemModel
          final model = provider.rewardsModelObj.redeemCardItemModel;

          // Display the single loyalty card item
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            child: RedeemCardItemWidget(
                redeemCardItemModelObj: model,
                onRedeem: ()
                  => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => RedeemRewardsScreen.builder(context))),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRewardsHistorySection (BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: Consumer <RewardsProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Divider(
                  height: 0.1.h,
                  thickness: 0.1.h,
                  color: appTheme.black900,
                ),
              );
            },
            itemCount:
            provider.rewardsModelObj.rewardsHistorySectionItemList.length,
            itemBuilder: (context, index) {
              RewardsHistorySectionItemModel model =
              provider.rewardsModelObj.rewardsHistorySectionItemList[index];
              return RewardsHistorySectionItemWidget(model);
            },
          );
        },
      ),
    );
  }
}