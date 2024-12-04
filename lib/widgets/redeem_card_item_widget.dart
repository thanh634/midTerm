import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class RedeemCardItemWidget extends StatelessWidget {
  final RedeemCardItemModel redeemCardItemModelObj;
  final VoidCallback onRedeem;

  const RedeemCardItemWidget({
    super.key,
    required this.redeemCardItemModelObj,
    required this.onRedeem,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      padding: EdgeInsets.symmetric(horizontal: 7.w), // Horizontal padding
      height: 18.h, // Increased height for better vertical centering
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadiusStyle.roundedBorder12, // Rounded corners
      ),

      child: Row(

        crossAxisAlignment: CrossAxisAlignment.center, // Center elements vertically
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align texts and button horizontally
        children: [
          // Text content
          Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center texts vertically
            crossAxisAlignment: CrossAxisAlignment.start, // Align texts to the left
            children: [
              Text(
                redeemCardItemModelObj.nameCard!,
                style: CustomTextStyles.titleSmallPoppinsBluegray100.copyWith(
                  fontSize: 15.sp, // Larger text for better visibility
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 1.h), // Increased spacing between nameCard and totalPoints
              Text(
                redeemCardItemModelObj.totalPoints!,
                style: CustomTextStyles.titleSmallPoppinsBluegray100.copyWith(
                  fontSize: 25.sp, // Bigger font for totalPoints
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Redeem button
          ElevatedButton(
            onPressed: onRedeem,
            style: ElevatedButton.styleFrom(
              backgroundColor: appTheme.blue20030, // Button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.roundedBorder12, // More rounded button
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h), // Larger button size
            ),
            child: Text(
              'Redeem drinks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp, // Increased button text size
              ),
            ),
          ),
        ],
      ),
    );
  }
}