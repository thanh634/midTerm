import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/redeem_rewards_list_item_widget.dart';

class RedeemRewardsProvider extends ChangeNotifier {
  RedeemRewardsModel redeemRewardsModelObj = RedeemRewardsModel();
}

class RedeemRewardsScreen extends StatefulWidget {
  const RedeemRewardsScreen({super.key});

  @override
  RedeemRewardsScreenState createState() => RedeemRewardsScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RedeemRewardsProvider(),
      builder: (context, child) {
        return const RedeemRewardsScreen();
      },
    );
  }
}

class RedeemRewardsScreenState extends State<RedeemRewardsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.FlatWhite,
                height: 8.h,
                width: 20.w,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 5.w, top: 24.h),
              ),
              CustomImageView(
                imagePath: ImageConstant.Cappuccino,
                height: 8.h,
                width: 20.w,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 5.w, top: 12.h),
              ),
              CustomImageView(
                imagePath: ImageConstant.Americano,
                height: 8.h,
                width: 20.w,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 5.w, top: 0.h),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 1.h),
                      Expanded(
                        child: _buildRedeemRewardsList(context),
                      ),
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
      leadingWidth: 10.w,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.only(left: 2.w),
          child: Icon(
            Icons.arrow_back,
            size: 3.h,
            color: Colors.black,
          ),
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitle(
        text: "lbl_redeem".tr,
      ),
    );
  }

  Widget _buildRedeemRewardsList(BuildContext context) {
    return Consumer<RedeemRewardsProvider>(
      builder: (context, provider, child) {
        return ListView.separated(
          padding: EdgeInsets.only(left: 35.w),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(height: 6.h),
          itemCount: provider.redeemRewardsModelObj.redeemRewardsListItemList.length,
          itemBuilder: (context, index) {
            RedeemRewardsListItemModel model = provider.redeemRewardsModelObj.redeemRewardsListItemList[index];
            return RedeemRewardsListItemWidget(model);
          },
        );
      },
    );
  }
}
