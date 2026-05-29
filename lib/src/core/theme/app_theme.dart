import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_palette.dart';
import 'app_typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get dark {
    const palette = AppPalette.dark;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: palette.bgBase,
      colorScheme: ColorScheme.dark(
        surface: palette.bgBase,
        primary: palette.ctaPrimary,
        onPrimary: palette.ctaPrimaryText,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      extensions: const <ThemeExtension<dynamic>>[
        AppPalette.dark,
        AppTypography.dark,
      ],
    );
  }
}
