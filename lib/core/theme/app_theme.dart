part of '../utils/imports_manager.dart';

abstract final class AppTheme {
  AppTheme._();

  /// Theme
  static final theme = ThemeData(
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,

      surface: AppColors.surface,
      onSurface: AppColors.text,

      // Use these container roles if you need surface variants
      surfaceContainerHighest: AppColors.background,
      surfaceContainerHigh: AppColors.surface,
      surfaceContainerLow: AppColors.mutedGray,

      error: AppColors.error,
      onError: AppColors.white,

      onPrimary: AppColors.white,
      onSecondary: AppColors.text,
    ),
    // scaffoldBackgroundColor is okay but can be removed if relying on surface roles
    scaffoldBackgroundColor: AppColors.surface,
    fontFamily: Get.isEnglish ? AppFonts.Inter : AppFonts.Tajawal,
    brightness: Brightness.light,
    useMaterial3: true,
  );
}
