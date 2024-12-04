import 'package:flutter/material.dart';
import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme  => ThemeHelper().themeData();

class ThemeHelper {
  final _appTheme = PrefUtils().getThemeData();

  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightcode' : LightCodeColors()
  };

  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightcode' : ColorSchemes.lightCodeColorScheme
  };

  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  ThemeData _getThemeData() {
    var colorScheme = _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;

    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimary,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.h),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.blueGray100.withOpacity(0.4),
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray100,
      ),
    );
  }

  LightCodeColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}


/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme (ColorScheme colorScheme) => TextTheme(
      bodyMedium: TextStyle(
        color: appTheme.gray500,
        fontSize: 14.sp,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),

      bodySmall: TextStyle(
        color: appTheme.gray90001,
        fontSize: 11.sp,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),

      headlineSmall: TextStyle(
        color: appTheme.gray50,
        fontSize: 24.sp,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),

      labelLarge: TextStyle(
        color: colorScheme.primary,
        fontSize: 12.sp,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),

      labelMedium: TextStyle(
        color: colorScheme.primary.withOpacity(0.22),
        fontSize: 10.sp,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),

      titleLarge: TextStyle(
        color: appTheme.gray900,
        fontSize: 22.sp,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),

      titleMedium: TextStyle(
        color: colorScheme.primary,
        fontSize: 16.sp,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),

      titleSmall: TextStyle(
        color: appTheme.gray90001,
        fontSize: 14.sp,
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w500,
      ),
  );
}
class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
    primary: Color (0XFF324A59),
    primaryContainer: Color(0XFFFFE5E5),
    onPrimary: Color (0XFFFFFFFF),
    onPrimaryContainer: Color(0X5E1D2335),
  );
}


class LightCodeColors {
  Color get black900  => const Color(0XFF000000);

  Color get blue20030 => const Color(0X30A1CDE8);

  Color get blueGray100 => const Color(0XFFD7D7D7);

  Color get deepOrange300 => const Color(0XFFFF7465);

  Color get gray100 => const Color(0XFFF4F5F7);
  Color get gray50 => const Color(0XFFFFFAF6);
  Color get gray500 => const Color(0XFFAAAAAA);
  Color get gray5001 => const Color(0XFFF7F8FB);
  Color get gray600 => const Color(0XFF757575);
  Color get gray900 => const Color(0XFF181D2D);
  Color get gray90001 => const Color(0XFF001833);
  Color get gray90038 => const Color(0X38001733);

  Color get lightGreen100 => const Color(0XFFE4D5C9);

  Color get red500 => const Color(0XFFFF3030);
}