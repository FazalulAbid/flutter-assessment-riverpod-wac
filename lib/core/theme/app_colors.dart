import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF019B5B);
  static const Color primaryDark = Color(0xFF019B5B);

  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryDark = Color(0xFFFFFFFF);

  static const Color secondary = Color(0xFF22A06D);
  static const Color secondaryDark = Color(0xFF22A06D);

  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSecondaryDark = Color(0xFFFFFFFF);

  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFFFFFFFF);

  static const Color onSurface = Color(0xFF181A1A);
  static const Color onSurfaceDark = Color(0xFF181A1A);

  static const Color primaryContainer = Color(0xFFF5F5F5);
  static const Color primaryContainerDark = Color(0xFFF5F5F5);

  static const Color onPrimaryContainer = Color(0xFF616169);
  static const Color onPrimaryContainerDark = Color(0xFF616169);

  static const Color outline = Color(0xFFD5D5D5);
  static const Color outlineDark = Color(0xFFD5D5D5);

  static const Color error = Color(0xffE5204B);
  static const Color errorDark = Color(0xffE5204B);

  static const Color onError = Color(0xffa40025);
  static const Color onErrorDark = Color(0xffa40025);

  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff0F0F0F);
}

final ColorScheme darkColorScheme = const ColorScheme.dark(
  brightness: Brightness.dark,
  primary: AppColors.primaryDark,
  onPrimary: AppColors.onPrimaryDark,
  surface: AppColors.surfaceDark,
  onSurface: AppColors.onSurfaceDark,
  primaryContainer: AppColors.primaryContainerDark,
  onPrimaryContainer: AppColors.onPrimaryContainerDark,
  outline: AppColors.outlineDark,
  error: AppColors.errorDark,
  onError: AppColors.onErrorDark,
);

final ColorScheme lightColorScheme = const ColorScheme.light(
  brightness: Brightness.light,
  primary: AppColors.primary,
  onPrimary: AppColors.onPrimary,
  surface: AppColors.surface,
  onSurface: AppColors.onSurface,
  primaryContainer: AppColors.primaryContainer,
  onPrimaryContainer: AppColors.onPrimaryContainer,
  outline: AppColors.outline,
  error: AppColors.error,
  onError: AppColors.onError,
);
