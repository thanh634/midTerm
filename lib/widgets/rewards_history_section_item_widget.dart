import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class RewardsHistorySectionItemWidget extends StatelessWidget {
  RewardsHistorySectionItemWidget(this.rewardsHistorySectionItemModelObj,
      {super.key});

  RewardsHistorySectionItemModel rewardsHistorySectionItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.w),
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
                    rewardsHistorySectionItemModelObj.coffeeName!,
                    style: theme.textTheme.labelLarge!.copyWith(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    rewardsHistorySectionItemModelObj.buyDate!,
                    style: theme.textTheme.labelMedium!.copyWith(
                      fontSize: 15.sp,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              rewardsHistorySectionItemModelObj.points!,
              style: theme.textTheme.titleMedium,
            ),
          )
        ],
      ),
    );
  }
}