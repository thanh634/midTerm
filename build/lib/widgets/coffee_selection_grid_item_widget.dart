import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class CoffeeSelectionGridItemWidget extends StatelessWidget {
  CoffeeSelectionGridItemWidget(this.coffeeSelectionGridItemModelObj,
      {super.key});

  CoffeeSelectionGridItemModel coffeeSelectionGridItemModelObj;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to DetailPage when the container is tapped
        Navigator.pushNamed(
          context,
          AppRoutes.detailsScreen,
          arguments: coffeeSelectionGridItemModelObj,
        );
      },
      child: Container(
        width: double.maxFinite,

        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 5.h,
        ),
        decoration: BoxDecoration(
          color: appTheme.gray5001,
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: coffeeSelectionGridItemModelObj.coffeeImg!,
              height: 10.h,
              width: 100.w,
            ),
            SizedBox(height: 2.h),
            Text(
              coffeeSelectionGridItemModelObj.coffeeName!,
              style: theme.textTheme.titleSmall!.copyWith(
                fontSize: 18.sp
              ),

            ),
            SizedBox(height: 1.h),
          ],
        ),
      ),
    );
  }

}