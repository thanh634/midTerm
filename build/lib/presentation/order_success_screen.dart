import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';

class OrderSuccessProvider extends ChangeNotifier {
  OrderSuccessModel orderSuccessModelObj = OrderSuccessModel();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({super.key});

  @override
  OrderSuccessScreenState createState() => OrderSuccessScreenState();
  static Widget builder (BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderSuccessProvider(),
      child: const OrderSuccessScreen(),
    );
  }
}

class OrderSuccessScreenState extends State<OrderSuccessScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  CustomImageView(
                    imagePath: ImageConstant.imgTakeAwayDeliv,
                    height: 12.h,
                    width: 12.h,
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    "lbl_order_success".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    "msg_your_order_has_been".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      height: 0.2.h,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomElevatedButton(
                    text: "lbl_track_my_order".tr,
                    margin: EdgeInsets.symmetric(horizontal: 4.h),
                    height: 6.h,
                    buttonStyle: CustomButtonStyles.fillPrimary,
                    onPressed: () {
                      // Navigate to the checkout page when the button is pressed
                      Navigator.pushNamed(context, AppRoutes.myCurrentOrderPage);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}