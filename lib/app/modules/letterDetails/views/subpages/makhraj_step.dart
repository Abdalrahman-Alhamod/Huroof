// 📁 lib/app/modules/letter_details/widgets/steps/makhraj_step.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:huroof/app/data/model/letter.dart';
import 'package:huroof/core/utils/imports_manager.dart';
import 'package:huroof/generated/locales.g.dart';

class MakhrajStep extends StatelessWidget {
  final Letter letter;

  const MakhrajStep({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Header with icon & subtitle
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
                      Icons.mic_external_on,
                      size: 16,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      LocaleKeys.makhrajTitle.tr,
                      style: AppTextStyles.s14_regular.primaryColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                LocaleKeys.makhrajSubtitle.tr,
                style: AppTextStyles.s16_medium.darkGreyColor,
              ),
            ],
          ),
        ),

        /// Makhraj Image Card
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: AppColors.primary),
            ),
            child: Center(
              child: Image.asset(letter.makhrajImage!, fit: BoxFit.contain),
            ),
          ),
        ),
        SizedBox(height: 12.h),

        /// Description Card
        Expanded(
          flex: 2,
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
                        Icons.record_voice_over_rounded,
                        size: 18,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      LocaleKeys.makhrajDescriptionTitle.tr,
                      style: AppTextStyles.s16_bold.blackColor,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  letter.makhrajDescription!,
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
