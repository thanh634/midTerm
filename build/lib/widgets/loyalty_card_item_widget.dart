import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class LoyaltyCardItemWidget extends StatelessWidget {
  LoyaltyCardItemWidget(this.loyaltyCardItemModelObj, {super.key});

  LoyaltyCardItemModel loyaltyCardItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 6.w,
              vertical: 3.h,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100.w,
                  margin: EdgeInsets.only(
                    left: 1.w,
                    right: 2.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        loyaltyCardItemModelObj.nameCard!,
                        style: CustomTextStyles.titleSmallPoppinsBluegray100,

                      ),
                      Text(
                        loyaltyCardItemModelObj.milestones!,
                        style: CustomTextStyles.titleSmallPoppinsBluegray100,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 1.h,),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimary,
                    borderRadius: BorderRadiusStyle.roundedBorder12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgCoffeeCupLightUp,
                        height: 5.h,
                        width: 7.w,
                      ),
                      SizedBox(width: 2.w,),
                      CustomImageView(
                        imagePath: ImageConstant.imgCoffeeCupLightUp,
                        height: 5.h,
                        width: 7.w,
                      ),
                      SizedBox(width: 2.w,),
                      CustomImageView(
                        imagePath: ImageConstant.imgCoffeeCupLightUp,
                        height: 5.h,
                        width: 7.w,
                      ),
                      SizedBox(width: 2.w,),
                      CustomImageView(
                        imagePath: ImageConstant.imgCoffeeCupLightUp,
                        height: 5.h,
                        width: 7.w,
                      ),
                      SizedBox(width: 2.w,),
                      CustomImageView(
                        imagePath: ImageConstant.imgCoffeeCupDarken,
                        height: 5.h,
                        width: 7.w,
                      ),
                      SizedBox(width: 2.w,),
                      CustomImageView(
                        imagePath: ImageConstant.imgCoffeeCupDarken,
                        height: 5.h,
                        width: 7.w,
                      ),
                      SizedBox(width: 2.w,),
                      CustomImageView(
                        imagePath: ImageConstant.imgCoffeeCupDarken,
                        height: 5.h,
                        width: 7.w,
                      ),
                      SizedBox(width: 2.w,),
                      CustomImageView(
                        imagePath: ImageConstant.imgCoffeeCupDarken,
                        height: 5.h,
                        width: 7.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.h,)
              ],
            ),
          )
        ],
      ),
    );
  }
}