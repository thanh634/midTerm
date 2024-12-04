import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray5001,
  );

  static BoxDecoration get fillOnPrimary => BoxDecoration(
    color: theme.colorScheme.onPrimary,
  );

  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
    color: theme.colorScheme.onPrimaryContainer,
  );

  static BoxDecoration get fillPrimary => BoxDecoration(
      color: theme.colorScheme.primary,
  );

  // Outline decorations
  static BoxDecoration get outlineBlueGray => BoxDecoration(
    border: Border.all(
      color: appTheme.blueGray100.withOpacity(0.4),
      width: 1.2.h,
    ),
  );
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderTL24 => BorderRadius.vertical(
    top: Radius.circular(8.h),
  );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(4.h, );
}