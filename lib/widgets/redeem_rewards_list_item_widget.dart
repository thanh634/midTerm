import 'package:flutter/material.dart';
import 'package:midterm/core/app_export.dart';
import 'custom_elevated_button.dart';

class RedeemRewardsListItemWidget extends StatelessWidget {
  RedeemRewardsListItemWidget(this.redeemRewardsListItemModelObj, {super.key});

  RedeemRewardsListItemModel redeemRewardsListItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    redeemRewardsListItemModelObj.coffeeName!,
                    style: CustomTextStyles.titleSmallPoppinsPrimary_1.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    redeemRewardsListItemModelObj.validUntil!,
                    style: CustomTextStyles.labelMediumPrimary_1.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomElevatedButton(
            height: 5.h,
            width: 20.w,
            text: "lbl_1340_pts".tr,
            margin: EdgeInsets.only(top: 0.h),
            buttonTextStyle: CustomTextStyles.labelMediumOnPrimary,
          )
        ],
      ),
    );
  }
}


