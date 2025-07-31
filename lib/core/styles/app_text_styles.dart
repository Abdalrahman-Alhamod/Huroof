// ignore_for_file: constant_identifier_names, non_constant_identifier_names
part of '../utils/imports_manager.dart';

abstract final class AppTextStyles {
  AppTextStyles._();

  // TextStyle generator
  static TextStyle _style(double size, FontWeight weight) =>
      TextStyle(fontSize: size, fontWeight: weight);

  static final s8_bold = _style(AppFontSize.s8, AppFontWeight.bold);
  static final s8_semiBold = _style(AppFontSize.s8, AppFontWeight.semiBold);
  static final s8_medium = _style(AppFontSize.s8, AppFontWeight.medium);
  static final s8_regular = _style(AppFontSize.s8, AppFontWeight.regular);

  static final s10_bold = _style(AppFontSize.s10, AppFontWeight.bold);
  static final s10_semiBold = _style(AppFontSize.s10, AppFontWeight.semiBold);
  static final s10_medium = _style(AppFontSize.s10, AppFontWeight.medium);
  static final s10_regular = _style(AppFontSize.s10, AppFontWeight.regular);

  static final s12_bold = _style(AppFontSize.s12, AppFontWeight.bold);
  static final s12_semiBold = _style(AppFontSize.s12, AppFontWeight.semiBold);
  static final s12_medium = _style(AppFontSize.s12, AppFontWeight.medium);
  static final s12_regular = _style(AppFontSize.s12, AppFontWeight.regular);

  static final s14_bold = _style(AppFontSize.s14, AppFontWeight.bold);
  static final s14_semiBold = _style(AppFontSize.s14, AppFontWeight.semiBold);
  static final s14_medium = _style(AppFontSize.s14, AppFontWeight.medium);
  static final s14_regular = _style(AppFontSize.s14, AppFontWeight.regular);

  static final s16_bold = _style(AppFontSize.s16, AppFontWeight.bold);
  static final s16_semiBold = _style(AppFontSize.s16, AppFontWeight.semiBold);
  static final s16_medium = _style(AppFontSize.s16, AppFontWeight.medium);
  static final s16_regular = _style(AppFontSize.s16, AppFontWeight.regular);

  static final s18_bold = _style(AppFontSize.s18, AppFontWeight.bold);
  static final s18_semiBold = _style(AppFontSize.s18, AppFontWeight.semiBold);
  static final s18_medium = _style(AppFontSize.s18, AppFontWeight.medium);
  static final s18_regular = _style(AppFontSize.s18, AppFontWeight.regular);

  static final s20_bold = _style(AppFontSize.s20, AppFontWeight.bold);
  static final s20_semiBold = _style(AppFontSize.s20, AppFontWeight.semiBold);
  static final s20_medium = _style(AppFontSize.s20, AppFontWeight.medium);
  static final s20_regular = _style(AppFontSize.s20, AppFontWeight.regular);

  static final s22_bold = _style(AppFontSize.s22, AppFontWeight.bold);
  static final s22_semiBold = _style(AppFontSize.s22, AppFontWeight.semiBold);
  static final s22_medium = _style(AppFontSize.s22, AppFontWeight.medium);
  static final s22_regular = _style(AppFontSize.s22, AppFontWeight.regular);

  static final s24_bold = _style(AppFontSize.s24, AppFontWeight.bold);
  static final s24_semiBold = _style(AppFontSize.s24, AppFontWeight.semiBold);
  static final s24_medium = _style(AppFontSize.s24, AppFontWeight.medium);
  static final s24_regular = _style(AppFontSize.s24, AppFontWeight.regular);

  static final s26_bold = _style(AppFontSize.s26, AppFontWeight.bold);
  static final s26_semiBold = _style(AppFontSize.s26, AppFontWeight.semiBold);
  static final s26_medium = _style(AppFontSize.s26, AppFontWeight.medium);
  static final s26_regular = _style(AppFontSize.s26, AppFontWeight.regular);

  static final s28_bold = _style(AppFontSize.s28, AppFontWeight.bold);
  static final s28_semiBold = _style(AppFontSize.s28, AppFontWeight.semiBold);
  static final s28_medium = _style(AppFontSize.s28, AppFontWeight.medium);
  static final s28_regular = _style(AppFontSize.s28, AppFontWeight.regular);

  static final s30_bold = _style(AppFontSize.s30, AppFontWeight.bold);
  static final s30_semiBold = _style(AppFontSize.s30, AppFontWeight.semiBold);
  static final s30_medium = _style(AppFontSize.s30, AppFontWeight.medium);
  static final s30_regular = _style(AppFontSize.s30, AppFontWeight.regular);

  static final s32_bold = _style(AppFontSize.s32, AppFontWeight.bold);
  static final s32_semiBold = _style(AppFontSize.s32, AppFontWeight.semiBold);
  static final s32_medium = _style(AppFontSize.s32, AppFontWeight.medium);
  static final s32_regular = _style(AppFontSize.s32, AppFontWeight.regular);

  static final s34_bold = _style(AppFontSize.s34, AppFontWeight.bold);
  static final s34_semiBold = _style(AppFontSize.s34, AppFontWeight.semiBold);
  static final s34_medium = _style(AppFontSize.s34, AppFontWeight.medium);
  static final s34_regular = _style(AppFontSize.s34, AppFontWeight.regular);

  static final s36_bold = _style(AppFontSize.s36, AppFontWeight.bold);
  static final s36_semiBold = _style(AppFontSize.s36, AppFontWeight.semiBold);
  static final s36_medium = _style(AppFontSize.s36, AppFontWeight.medium);
  static final s36_regular = _style(AppFontSize.s36, AppFontWeight.regular);

  static final s38_bold = _style(AppFontSize.s38, AppFontWeight.bold);
  static final s38_semiBold = _style(AppFontSize.s38, AppFontWeight.semiBold);
  static final s38_medium = _style(AppFontSize.s38, AppFontWeight.medium);
  static final s38_regular = _style(AppFontSize.s38, AppFontWeight.regular);

  static final s40_bold = _style(AppFontSize.s40, AppFontWeight.bold);
  static final s40_semiBold = _style(AppFontSize.s40, AppFontWeight.semiBold);
  static final s40_medium = _style(AppFontSize.s40, AppFontWeight.medium);
  static final s40_regular = _style(AppFontSize.s40, AppFontWeight.regular);

  static final s42_bold = _style(AppFontSize.s42, AppFontWeight.bold);
  static final s42_semiBold = _style(AppFontSize.s42, AppFontWeight.semiBold);
  static final s42_medium = _style(AppFontSize.s42, AppFontWeight.medium);
  static final s42_regular = _style(AppFontSize.s42, AppFontWeight.regular);

  static final s44_bold = _style(AppFontSize.s44, AppFontWeight.bold);
  static final s44_semiBold = _style(AppFontSize.s44, AppFontWeight.semiBold);
  static final s44_medium = _style(AppFontSize.s44, AppFontWeight.medium);
  static final s44_regular = _style(AppFontSize.s44, AppFontWeight.regular);

  static final s46_bold = _style(AppFontSize.s46, AppFontWeight.bold);
  static final s46_semiBold = _style(AppFontSize.s46, AppFontWeight.semiBold);
  static final s46_medium = _style(AppFontSize.s46, AppFontWeight.medium);
  static final s46_regular = _style(AppFontSize.s46, AppFontWeight.regular);

  static final s48_bold = _style(AppFontSize.s48, AppFontWeight.bold);
  static final s48_semiBold = _style(AppFontSize.s48, AppFontWeight.semiBold);
  static final s48_medium = _style(AppFontSize.s48, AppFontWeight.medium);
  static final s48_regular = _style(AppFontSize.s48, AppFontWeight.regular);

  static final s50_bold = _style(AppFontSize.s50, AppFontWeight.bold);
  static final s50_semiBold = _style(AppFontSize.s50, AppFontWeight.semiBold);
  static final s50_medium = _style(AppFontSize.s50, AppFontWeight.medium);
  static final s50_regular = _style(AppFontSize.s50, AppFontWeight.regular);

  static final s52_bold = _style(AppFontSize.s52, AppFontWeight.bold);
  static final s52_semiBold = _style(AppFontSize.s52, AppFontWeight.semiBold);
  static final s52_medium = _style(AppFontSize.s52, AppFontWeight.medium);
  static final s52_regular = _style(AppFontSize.s52, AppFontWeight.regular);

  static final s54_bold = _style(AppFontSize.s54, AppFontWeight.bold);
  static final s54_semiBold = _style(AppFontSize.s54, AppFontWeight.semiBold);
  static final s54_medium = _style(AppFontSize.s54, AppFontWeight.medium);
  static final s54_regular = _style(AppFontSize.s54, AppFontWeight.regular);

  static final s56_bold = _style(AppFontSize.s56, AppFontWeight.bold);
  static final s56_semiBold = _style(AppFontSize.s56, AppFontWeight.semiBold);
  static final s56_medium = _style(AppFontSize.s56, AppFontWeight.medium);
  static final s56_regular = _style(AppFontSize.s56, AppFontWeight.regular);

  static final s58_bold = _style(AppFontSize.s58, AppFontWeight.bold);
  static final s58_semiBold = _style(AppFontSize.s58, AppFontWeight.semiBold);
  static final s58_medium = _style(AppFontSize.s58, AppFontWeight.medium);
  static final s58_regular = _style(AppFontSize.s58, AppFontWeight.regular);

  static final s60_bold = _style(AppFontSize.s60, AppFontWeight.bold);
  static final s60_semiBold = _style(AppFontSize.s60, AppFontWeight.semiBold);
  static final s60_medium = _style(AppFontSize.s60, AppFontWeight.medium);
  static final s60_regular = _style(AppFontSize.s60, AppFontWeight.regular);

  static final s62_bold = _style(AppFontSize.s62, AppFontWeight.bold);
  static final s62_semiBold = _style(AppFontSize.s62, AppFontWeight.semiBold);
  static final s62_medium = _style(AppFontSize.s62, AppFontWeight.medium);
  static final s62_regular = _style(AppFontSize.s62, AppFontWeight.regular);

  static final s64_bold = _style(AppFontSize.s64, AppFontWeight.bold);
  static final s64_semiBold = _style(AppFontSize.s64, AppFontWeight.semiBold);
  static final s64_medium = _style(AppFontSize.s64, AppFontWeight.medium);
  static final s64_regular = _style(AppFontSize.s64, AppFontWeight.regular);
}

extension TextStyleColorExtension on TextStyle {
  TextStyle get primaryColor => copyWith(color: AppColors.primary);
  TextStyle get secondaryColor => copyWith(color: AppColors.secondary);
  TextStyle get whiteColor => copyWith(color: AppColors.white);
  TextStyle get blackColor => copyWith(color: AppColors.black);
  TextStyle get redColor => copyWith(color: AppColors.error);
  TextStyle get greenColor => copyWith(color: AppColors.success);
  TextStyle get greyColor => copyWith(color: AppColors.grey);
}
