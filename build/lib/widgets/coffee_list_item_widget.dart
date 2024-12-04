import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../core/app_export.dart';


class CoffeeListItemWidget extends StatelessWidget {
  const CoffeeListItemWidget(this.coffeeListItemModelObj, {super.key});

  final CoffeeListItemModel coffeeListItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // Add your delete logic here
            },
            backgroundColor: theme.colorScheme.error,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: "Delete",
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(2.h),
          border: Border.all(color: appTheme.gray100,),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Coffee Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.h),
                  child: Image.asset(
                    coffeeListItemModelObj.coffeeImg!,
                    width: 20.w,
                    height: 8.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 1.w),
                // Coffee Details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      coffeeListItemModelObj.coffeeName!,
                      style: theme.textTheme.titleMedium!.copyWith(
                        fontSize: 20.sp
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      coffeeListItemModelObj.coffeeOpt!,
                      style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: 15.sp
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      coffeeListItemModelObj.num!,
                      style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Coffee Price
            Text(
              coffeeListItemModelObj.price!,
              style: theme.textTheme.titleMedium!.copyWith(
                  fontSize: 18.sp
              ),
            ),
          ],
        ),
      ),
    );
  }
}


