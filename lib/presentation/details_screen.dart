import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';

class DetailsProvider extends ChangeNotifier {
  DetailsModel detailsModelObj = DetailsModel();

  int quantity = 1;
  String? _activeButton;
  String? _activeOption;
  String? _activeSize;
  String? _activeIceOption;

  String? get activeIceOption => _activeIceOption;
  String? get activeButton => _activeButton;
  String? get activeOption => _activeOption;
  String? get activeSize => _activeSize;

  void decrementQuantity() {
    if(quantity > 1) {
      quantity--;
      notifyListeners();
    }
  }

  void incrementQuantity(){
    quantity++;
    notifyListeners();
  }

  void setActiveButton(String button) {
    if (_activeButton != button) {
      _activeButton = button;
      notifyListeners();
    }
  }

  void setActiveOption(String option) {
    if (_activeOption != option) {
      _activeOption = option;
      notifyListeners();
    }
  }

  void setActiveSize(String size) {
    if (_activeSize != size) {
      _activeSize = size;
      notifyListeners();
    }
  }

  void setActiveIceOption(String option) {
    if (_activeIceOption != option) {
      _activeIceOption = option;
      notifyListeners();
    }
  }

}

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  DetailsScreenState createState() => DetailsScreenState();
  static Widget builder (BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailsProvider(),
      child: const DetailsScreen(),
    );
  }
}

class DetailsScreenState extends State<DetailsScreen> {
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
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 1.h),
              child: Column(
                children: [
                  SizedBox(height: 2.h),
                  _buildCoffeeImageSection(context),
                  SizedBox(height: 8.h),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_americano".tr,
                            style: theme.textTheme.titleSmall!.copyWith(
                                fontSize: 17.sp
                            )
                        ),
                        Container(
                          width: 30.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 1.w,
                            vertical: 1.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusStyle.roundedBorder12,
                            border: Border.all(
                              color: appTheme.blueGray100.withOpacity(0.4),
                              width: 1.h,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<DetailsProvider>()
                                        .decrementQuantity();
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        "lbl".tr,
                                          style: theme.textTheme.titleSmall!.copyWith(
                                              fontSize: 15.sp
                                          )
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Selector<DetailsProvider, int?>(
                                selector: (context, provider) =>
                                provider.quantity,
                                builder: (context, quantity, child) {
                                  return Text(
                                    (quantity ?? "").toString(),
                                    style: theme.textTheme.titleSmall!.copyWith(
                                        fontSize: 15.sp
                                    ),
                                  );
                                },
                              ),
                              SizedBox(width: 5.w),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<DetailsProvider>()
                                        .incrementQuantity();
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        "lbl2".tr,
                                          style: theme.textTheme.titleSmall!.copyWith(
                                              fontSize: 15.sp
                                          )
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    width: double.maxFinite,
                    child: Divider(
                      color: appTheme.gray100,
                      indent: 5.w,
                      endIndent: 5.w,
                    ),
                  ),
                  SizedBox(height: 1.h),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "lbl_shot".tr,
                        style: theme.textTheme.titleSmall!.copyWith(
                          fontSize: 17.sp
                        ),
                      ),
                      const Spacer(),
                      Selector<DetailsProvider, String?>(
                        selector: (context, provider) => provider.activeButton,
                        builder: (context, activeButton, child) {
                          return Row(
                            children: [
                              CustomOutlinedButton(
                                height: 3.h,
                                width: 15.w,
                                text: "lbl_single".tr,
                                isActive: activeButton == "single",
                                onTap: () {
                                  context.read<DetailsProvider>().setActiveButton("single");
                                },
                              ),
                              SizedBox(width: 4.w),
                              CustomOutlinedButton(
                                height: 3.h,
                                width: 15.w,
                                text: "lbl_double".tr,
                                isActive: activeButton == "double",
                                onTap: () {
                                  context.read<DetailsProvider>().setActiveButton("double");
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.h),
                  SizedBox(
                    width: double.maxFinite,
                    child: Divider(
                      color: appTheme.gray100,
                      indent: 5.w,
                      endIndent: 5.w,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  _buildSelectOptionsRow(context),
                  SizedBox(height: 1.h),
                  SizedBox(
                    width: double.maxFinite,
                    child: Divider(
                      color: appTheme.gray100,
                      indent: 5.w,
                      endIndent: 5.w,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                      left: 10.w,
                      right: 8.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_size".tr,
                          style: theme.textTheme.titleSmall!.copyWith(fontSize: 17.sp),
                        ),
                        Selector<DetailsProvider, String?>(
                          selector: (context, provider) => provider.activeSize,
                          builder: (context, activeSize, child) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.read<DetailsProvider>().setActiveSize("small");
                                  },
                                  child: CustomImageView(
                                    imagePath: activeSize == "small"
                                        ? ImageConstant.imgSizeSelected
                                        : ImageConstant.imgSize,
                                    height: 2.h,
                                    width: 3.3.w,
                                    alignment: Alignment.bottomCenter,
                                    margin: EdgeInsets.only(left: 33.w),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                   context.read<DetailsProvider>().setActiveSize("medium");
                                  },
                                  child: CustomImageView(
                                    imagePath: activeSize == "medium"
                                        ? ImageConstant.imgSizeSelected
                                        : ImageConstant.imgSize,
                                    height: 3.h,
                                    width: 5.w,
                                    alignment: Alignment.bottomCenter,
                                    margin: EdgeInsets.only(left: 8.w),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.read<DetailsProvider>().setActiveSize("large");
                                  },
                                  child: CustomImageView(
                                    imagePath: activeSize == "large"
                                      ? ImageConstant.imgSizeSelected
                                      : ImageConstant.imgSize,
                                    height: 4.h,
                                    width: 6.6.w,
                                    margin: EdgeInsets.only(left: 8.w, right: 5.w),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    width: double.maxFinite,
                    child: Divider(
                      color: appTheme.gray100,
                      indent: 5.w,
                      endIndent: 5.w,
                    ),
                  ),
                  SizedBox(height: 1.h),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.5.h),
                        child: Text(
                          "lbl_ice".tr,
                          style: theme.textTheme.titleSmall!.copyWith(fontSize: 17.sp),
                        ),
                      ),
                      Selector<DetailsProvider, String?>(
                        selector: (context, provider) => provider.activeIceOption,
                        builder: (context, activeIceOption, child) {
                          return Row(
                            children: [
                              _buildIceOption(
                                context: context,
                                isActive: activeIceOption == "low",
                                onTap: () => context.read<DetailsProvider>().setActiveIceOption("low"),
                                margin: EdgeInsets.only(left: 36.w, bottom: 1.5.h),
                              ),
                              buildTwoIceStack(
                                isActive: activeIceOption == "moderate",// or false for inactive
                                onTap: () => context.read<DetailsProvider>().setActiveIceOption("moderate"),
                                size: 2.h, // Adjust the size as needed
                                margin: EdgeInsets.only(left: 8.w),
                              ),
                              _buildStackedIceOption(
                                context: context,
                                isActive: activeIceOption == "custom",
                                onTap: () => context.read<DetailsProvider>().setActiveIceOption("custom"),
                                margin: EdgeInsets.only(left: 5.w),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),                  SizedBox(height: 1.h),
                  SizedBox(
                    width: double.maxFinite,
                    child: Divider(
                      color: appTheme.gray100,
                      indent: 5.w,
                      endIndent: 5.w,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  _buildTotalAmountRow(context),
                  SizedBox(height: 4.h),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildAddToCartSection(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context)
  {
    return CustomAppBar(
      leadingWidth: 5.h,
      leading: GestureDetector(
        onTap: () {
          // Navigate to the RewardPage when the left arrow is tapped
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.only(left: 1.h),  // Adjust the left padding to move the arrow to the right
          child: Icon(
            Icons.arrow_back,  // Use left arrow icon
            size: 5.h,
            color: Colors.black,  // Set the desired color for the icon
          ),
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitle(text: "lbl_details".tr),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context, AppRoutes.myCartScreen,
            );
          },
          child: Container(
            color: Colors.transparent,
            height: 5.h,
            width: 5.w,
            child: Icon(Icons.shopping_cart, size: 5.h),
          ),
        ),
        SizedBox(width: 5.h),
      ],
    );
  }

  Widget _buildCoffeeImageSection (BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 0.h),
      decoration: BoxDecoration(
        color: appTheme.gray5001,
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.Americano,
            height: 15.h,
            width: 50 .w,
          )
        ],
      ),
    );
  }

  Widget _buildSelectOptionsRow(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 0.h),
            child: Text(
              "lbl_select".tr,
              style: theme.textTheme.titleSmall!.copyWith(fontSize: 17.sp),
            ),
          ),
          Selector<DetailsProvider, String?>(
            selector: (context, provider) => provider.activeOption,
            builder: (context, activeOption, child) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<DetailsProvider>().setActiveOption("cold");
                    },
                    child: CustomImageView(
                      imagePath: activeOption == "cold"
                          ? ImageConstant.imgColdSelect
                          : ImageConstant.imgCold,
                      height: 3.5.h,
                      width: 4.w,
                      margin: EdgeInsets.only(left: 40.w),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<DetailsProvider>().setActiveOption("hot");
                    },
                    child: CustomImageView(
                      imagePath: activeOption == "hot"
                          ? ImageConstant.imgHotSelect
                          : ImageConstant.imgHot,
                      height: 3.h,
                      width: 6.25.w,
                      margin: EdgeInsets.only(left: 10.w),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTotalAmountRow(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 4.h,
        right: 8.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "lbl_total_amount".tr,
            style: CustomTextStyles.titleMediumGray90001_1,
          ),
          Text(
            "lbl_3_00".tr,
            style: CustomTextStyles.titleMediumGray90001SemiBold,
          )
        ],
      ),
    );
  }

  Widget _buildAddToCartSection (BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomElevatedButton(
            text: "lbl_add_to_cart".tr,
            margin: EdgeInsets.only(bottom: 2.h),
            buttonStyle: CustomButtonStyles.fillPrimary,
            onPressed: () {
                // Navigate to the checkout page when the button is pressed
              Navigator.pushNamed(context, AppRoutes.myCartScreen);
            },
          )
        ],
      ),
    );
  }

  Widget _buildIceOption({
    required BuildContext context,
    required bool isActive,
    required VoidCallback onTap,
    required EdgeInsets margin,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 2.h,
        width: 2.h,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.75.h),
          border: Border.all(
            color: isActive ? appTheme.black900 : appTheme.blueGray100,
            width: 0.3.h,
          ),
        ),
      ),
    );
  }

  Widget buildTwoIceStack({
    required bool isActive,
    required VoidCallback onTap,
    required double size, // Base size of each ice piece
    EdgeInsets? margin,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: size * 2, // Total height for the 2 pieces
        width: size, // Width of each ice piece
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              bottom: size, // Position the top piece above the bottom
              child: Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.75.h),
                  border: Border.all(
                    color: isActive ? appTheme.black900 : appTheme.blueGray100,
                    width: 0.3.h,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0, // Place the bottom piece at the base
              child: Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.75.h),
                  border: Border.all(
                    color: isActive ? appTheme.black900 : appTheme.blueGray100,
                    width: 0.3.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildStackedIceOption({
    required BuildContext context,
    required bool isActive,
    required VoidCallback onTap,
    required EdgeInsets margin,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 4.h,
        width: 4.h,
        margin: margin,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 2.h,
                width: 2.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.75.h),
                  border: Border.all(
                    color: isActive ? appTheme.black900 : appTheme.blueGray100,
                    width: 0.3.h,
                  ),
                ),
              ),
            ),
            Container(
              height: 2.h,
              width: 2.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.75.h),
                border: Border.all(
                  color: isActive ? appTheme.black900 : appTheme.blueGray100,
                  width: 0.3.h,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 2.h,
                width: 2.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.75.h),
                  border: Border.all(
                    color: isActive ? appTheme.black900 : appTheme.blueGray100,
                    width: 0.3.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


