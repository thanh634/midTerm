import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'base_button.dart';

class CustomElevatedButton extends BaseButton {
  const CustomElevatedButton({
    Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.textStyle, // Add this line
    super.margin,
    super.onPressed,
    super.buttonStyle,
    super.alignment,
    super.buttonTextStyle,
    super.isDisabled,
    super.height,
    super.width,
    required super.text
  });

  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final TextStyle? textStyle; // Add this line


  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
        alignment: alignment ?? Alignment.center,
        child: buildElevatedButtonWidget)
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget =>
      Container(
        height: height ?? 8.h,
        width: width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text,
                style: buttonTextStyle ??
                    CustomTextStyles.titleSmallPoppinsOnPrimary,
              ),
              rightIcon ?? const SizedBox.shrink()
            ],
          ),
        ),
      );
}