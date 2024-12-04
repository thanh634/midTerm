import 'package:flutter/material.dart';
import '../../core/app_export.dart';



class SplashProvider extends ChangeNotifier {
  SplashModel  splashModelObj = SplashModel();

}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();

  static Widget builder (BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(),
      child: const SplashScreen(),
    );
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 5000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.homePage,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimaryContainer,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgSplashScreen,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            padding: EdgeInsets.only(
              left: 10.0.w,
              top: 20.0.h,
              right: 10.0.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [_buildCoffeeHouseSection(context)],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCoffeeHouseSection(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgLogo,
            height: 20.0.h,
            width: 20.0.h,
          ),
          SizedBox(height: 5.0.h),
          Text(
            "msg_ordinary_coffee".tr,
            style: theme.textTheme.headlineSmall,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}