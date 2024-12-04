import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get dMSans {
    return copyWith(
      fontFamily: 'DM Sans',
    );
  }
}

class CustomTextStyles {

  // Body text style
  static TextStyle get bodySmallGray600 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray600,
        fontSize: 10.sp,
        fontWeight: FontWeight.w300,
      );

  // Headline text style
  static TextStyle get headlineSmallBluegray100 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.blueGray100,
      );

  // Label text style
  static TextStyle get labelLargeBlack900 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.57),
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeDMSansGray90001 =>
      theme.textTheme.labelLarge!.dMSans.copyWith(
        color: appTheme.gray90001,
      );

  static TextStyle get labelLargeGray90001 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray90001,
      );

  static TextStyle get labelLargeGray90038 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray90038,
  );
  static TextStyle get labelMediumBluegray100 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blueGray100,
  );
  static TextStyle get labelMediumDeeporange300 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.deepOrange300,
        fontSize: 11.sp,
        fontWeight: FontWeight.w600,
  );

  static TextStyle get labelMediumGray90038 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray90038,
  );
  static TextStyle get labelMediumOnPrimary =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
  );
  static TextStyle get labelMediumPrimary =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primary,
  );
  static TextStyle get labelMediumPrimary_1 =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.5),
  );


  // Title text style
  static TextStyle get titleLargeGray90001 =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray90001,
        fontSize: 20.sp,
  );
  static TextStyle get titleLargeGray90001SemiBold =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray90001,
        fontWeight: FontWeight.w600,
  );
  static TextStyle get titleMediumBluegray100 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray100,
  );
  static TextStyle get titleMediumGray90001 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90001,
  );
  static TextStyle get titleMediumGray9000118 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90001,
        fontSize: 18.sp,
  );
  static TextStyle get titleMediumGray90001SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90001,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMediumGray90001_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90001,
  );
  static TextStyle get titleMediumPrimary =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.6),
      );
  static get titleSmallPoppins =>
      theme.textTheme.titleSmall!.poppins;
  static TextStyle get titleSmallPoppinsBluegray100 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.blueGray100,
        fontSize: 20.sp,
  );
  static TextStyle get titleSmallPoppinsOnPrimary =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
  );
  static TextStyle get titleSmallPoppinsPrimary =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
  );
  static TextStyle get titleSmallPoppinsPrimarySemiBold =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleSmallPoppinsPrimary_1 =>
  theme.textTheme.titleSmall!.poppins.copyWith(
    color: theme.colorScheme.primary,
  );
}