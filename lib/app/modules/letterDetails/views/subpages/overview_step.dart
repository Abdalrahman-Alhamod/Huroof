// 📁 lib/app/modules/letter_details/widgets/steps/overview_step.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:huroof/app/data/model/letter.dart';
import 'package:huroof/core/utils/imports_manager.dart';
import 'package:huroof/generated/locales.g.dart';

class OverviewStep extends StatelessWidget {
  final Letter letter;

  const OverviewStep({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header with icon & subtitle
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.edit, size: 16, color: AppColors.primary),
                    SizedBox(width: 6.w),
                    Text(
                      LocaleKeys.overviewTitle.tr,
                      style: AppTextStyles.s14_regular.primaryColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                LocaleKeys.overviewSubtitle.tr,
                style: AppTextStyles.s16_medium.darkGreyColor,
              ),
            ],
          ),
        ),

        Expanded(
          flex: 5,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary.withValues(alpha: 0.95),
                  AppColors.primary.withValues(alpha: 0.5),
                ],
              ),
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  offset: const Offset(0, 3),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  letter.letter!,
                  style: AppTextStyles.s68_bold.whiteColor.copyWith(
                    fontSize: 90,
                    fontFamily: AppFonts.Amiri,
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 6.h,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    letter.pronunciation!,
                    style: AppTextStyles.s18_medium.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: const Icon(
                        Icons.info_outline,
                        size: 18,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      LocaleKeys.descriptionTitle.tr,
                      style: AppTextStyles.s16_bold.blackColor,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  letter.description!,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.s16_regular.darkGreyColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
