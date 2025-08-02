// 📁 lib/app/modules/letter_details/widgets/steps/draw_animation_step.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huroof/app/data/model/letter.dart';
import 'package:huroof/core/utils/imports_manager.dart';
import 'package:huroof/generated/locales.g.dart';
import 'package:lottie/lottie.dart';

class DrawAnimationStep extends StatelessWidget {
  final Letter letter;

  const DrawAnimationStep({super.key, required this.letter});

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
                    const Icon(
                      Icons.gesture,
                      size: 16,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      LocaleKeys.drawLetterTitle.tr,
                      style: AppTextStyles.s14_regular.primaryColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                LocaleKeys.drawLetterSubtitle.tr,
                style: AppTextStyles.s16_medium.darkGreyColor,
              ),
            ],
          ),
        ),
        Spacer(),
        // Animation Display
        Expanded(
          flex: 7,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: AppColors.primary),
            ),
            child: Center(child: Lottie.asset(AppLottie.alifDraw)),
          ),
        ),
        SizedBox(height: 12.h),
        Spacer(),
      ],
    );
  }
}
