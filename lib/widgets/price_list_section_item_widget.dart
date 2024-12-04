import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class PriceListSectionItemWidget extends StatelessWidget {
  PriceListSectionItemWidget(this.priceListSectionItemModelObj, {super.key});

  PriceListSectionItemModel priceListSectionItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  priceListSectionItemModelObj.buyDate!,
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontSize: 14.sp
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(right: 2.w),
                    child: Text(
                      priceListSectionItemModelObj.price!,
                      style: theme.textTheme.titleMedium!.copyWith(
                          fontSize: 14.sp
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgCoffeeCupSmall,
                  height: 1.75.h,
                  width: 3.w,
                  alignment: Alignment.bottomCenter,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: Text(
                    priceListSectionItemModelObj.coffeeName!,
                    style: CustomTextStyles.labelMediumPrimary!.copyWith(
                        fontSize: 16.sp
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgLocation,
                height: 2.h,
                width: 4.w,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Text(
                  priceListSectionItemModelObj.address!,
                  style: CustomTextStyles.labelMediumPrimary!.copyWith(
                      fontSize: 13.sp
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
