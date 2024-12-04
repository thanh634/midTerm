import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/coffee_list_item_widget.dart';
import '../widgets/app_bar/appbar_subtitle.dart';

class MyCartProvider extends ChangeNotifier {
  MyCartModel myCartModelObj = MyCartModel();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  MyCartScreenState createState() => MyCartScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyCartProvider(),
      child: const MyCartScreen(),
    );
  }
}

class MyCartScreenState extends State<MyCartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: 100.w,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: 100.w,
                  padding: EdgeInsets.only(top: 1.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: 1.h),
                      _buildCoffeeList(context)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: _buildTotalPriceRow(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 5.w,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container( // Wrap the icon in a Container
          width: 6.w, // Set desired width for hitbox
          height: 6.h, // Set desired height for hitbox
          alignment: Alignment.center, // Center the icon within the container
          child: Icon(
            Icons.arrow_back,  // Use left arrow icon
            size: 5.h,
            color: Colors.black,  // Set the desired color for the icon
          ),
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitle(text: "lbl_my_cart".tr,),

    );
  }



  Widget _buildCoffeeList(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.maxFinite,
        child: Consumer<MyCartProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 2.h,
                );
              },
              itemCount:
              provider.myCartModelObj.coffeeListItemList.length,
              itemBuilder: (context, index) {
                CoffeeListItemModel model =
                provider.myCartModelObj.coffeeListItemList[index];
                return CoffeeListItemWidget(model,);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildTotalPriceRow(BuildContext context) {
    return Container(
      height: 15.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Total Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Total Price",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 20.sp,
                ),
              ),
              Text(
                "\$9.00",
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
          // Checkout Button
          CustomElevatedButton(
            width: 40.w,
            height: 10.h,
            text: "Checkout",
            buttonTextStyle: TextStyle(
              fontSize: 18.sp, // Set your desired font size here
              fontWeight: FontWeight.bold, // Optional: make the text bold
              color: Colors.white, // Optional: set the text color
            ),
            leftIcon: Container(
              margin: EdgeInsets.only(right: 1.w),
              child: CustomImageView(
                imagePath: ImageConstant.imgCart,
                height: 6.h,
                width: 6.w,
                fit: BoxFit.contain,
              ),
            ),
            onPressed: () {
              // Navigate to the checkout page when the button is pressed
              Navigator.pushNamed(context, AppRoutes.orderSuccessScreen);
            },
          ),
        ],
      ),
    );
  }

}