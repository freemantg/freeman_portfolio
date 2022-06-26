import 'package:flutter/material.dart';

enum ThemeType {
  light,
  dark,
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  AppTheme({
    required this.isDark,
    required this.colorScheme,
  });

  bool isDark;
  ColorScheme colorScheme;

  factory AppTheme.fromType(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.light:
        return AppTheme(isDark: false, colorScheme: lightColorScheme);
      case ThemeType.dark:
        return AppTheme(isDark: true, colorScheme: darkColorScheme);
    }
  }

  ThemeData get themeData {
    var t = ThemeData.from(colorScheme: colorScheme);
    return t.copyWith(
      iconTheme: IconThemeData(
        color: isDark ? const Color(0xFFFFFFFF) : const Color(0xFF111013),
      ),
    );
  }
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF111013),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFD8E2FF),
  onPrimaryContainer: Color(0xFF001A41),
  secondary: Color(0xFFFF9BCD),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFD8E2FF),
  onSecondaryContainer: Color(0xFF0F1B32),
  tertiary: Color(0xFF76517B),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFED6FF),
  onTertiaryContainer: Color(0xFF2D0E34),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFF6F5F1),
  onBackground: Color(0xFF1B1B1F),
  surface: Color(0xFFFEFBFF),
  onSurface: Color(0xFF1B1B1F),
  surfaceVariant: Color(0xFFE1E2EC),
  onSurfaceVariant: Color(0xFF44474F),
  outline: Color(0xFF74777F),
  shadow: Color(0xFF000000),
  inverseSurface: Color(0xFF303033),
  onInverseSurface: Color(0xFFF2F0F4),
  inversePrimary: Color(0xFFADC6FF),
  surfaceTint: Color(0xFF005AC1),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFBBC7C9),
  onPrimary: Color(0xFF002E69),
  primaryContainer: Color(0xFF004494),
  onPrimaryContainer: Color(0xFFD8E2FF),
  secondary: Color(0xFFFF9BCD),
  onSecondary: Color(0xFF253048),
  secondaryContainer: Color(0xFF3B475F),
  onSecondaryContainer: Color(0xFFD8E2FF),
  tertiary: Color(0xFFE5B8E8),
  onTertiary: Color(0xFF44244A),
  tertiaryContainer: Color(0xFF5D3A62),
  onTertiaryContainer: Color(0xFFFED6FF),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFB4AB),
  background: Color(0xFF1C2029),
  onBackground: Color(0xFFE3E2E6),
  surface: Color(0xFF1B1B1F),
  onSurface: Color(0xFFE3E2E6),
  surfaceVariant: Color(0xFF44474F),
  onSurfaceVariant: Color(0xFFC4C6D0),
  outline: Color(0xFF8E9099),
  shadow: Color(0xFF000000),
  inverseSurface: Color(0xFFE3E2E6),
  onInverseSurface: Color(0xFF303033),
  inversePrimary: Color(0xFF005AC1),
  surfaceTint: Color(0xFFADC6FF),
);
