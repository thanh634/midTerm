import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillBlue => ElevatedButton.styleFrom(
    backgroundColor: appTheme.blue20030,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.h)
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(22.h)
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  static ButtonStyle get fillPrimaryTL26 => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(26.h),
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  // text button style
  static ButtonStyle get none => ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
      elevation: WidgetStateProperty.all<double>(0),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      side: WidgetStateProperty.all<BorderSide>(
        const BorderSide(color: Colors.transparent),
      )
  );
}