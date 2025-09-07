// 📁 lib/app/modules/letter_details/widgets/steps/draw_animation_step.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huroof/app/data/model/letter.dart';
import 'package:huroof/app/modules/letterDetails/views/widgets/custom_youtube_player.dart';
import 'package:huroof/core/utils/imports_manager.dart';
import 'package:huroof/generated/locales.g.dart';

class DrawAnimationStep extends StatelessWidget {
  final Letter letter;
  const DrawAnimationStep({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Spacer(),
        Flexible(
          flex: 15,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: AppColors.primary),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Pick your target aspect; keep 0.8 if that’s your draw video’s native ratio.
                // Or use classic 16:9 => const ar = 16 / 9;
                const ar = 1.0;

                final maxW = constraints.maxWidth;
                final maxH = constraints.maxHeight;

                // Fit rectangle with aspect `ar` into (maxW x maxH)
                final fittedH = maxW / ar;
                final useWidth = fittedH <= maxH;
                final width = useWidth ? maxW : maxH * ar;
                final height = useWidth ? fittedH : maxH;

                return Center(
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: CustomYoutubePlayer(
                      url: letter.drawVideo!,
                      aspectRatio:
                          ar, // pass the same ratio we used for fitting
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        Spacer(),
      ],
    );
  }
}
