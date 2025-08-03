// 📁 lib/app/modules/letter_details/widgets/letter_details_header.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huroof/core/utils/imports_manager.dart';
import 'package:huroof/generated/locales.g.dart';

import '../../controllers/letter_details_controller.dart';

class LetterDetailsHeader extends GetView<LetterDetailsController> {
  const LetterDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Obx(() {
        final step = controller.currentStep.value + 1;
        final total = controller.totalSteps;
        final percent = ((step / total) * 100).toInt();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.primary,
                  ),
                  onPressed: Get.back,
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      LocaleKeys.letterLearningTitle.tr,
                      style: AppTextStyles.s18_bold.blackColor,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      controller.letter.name!,
                      style: AppTextStyles.s14_regular.darkGreyColor,
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.info,
                    color: AppColors.primary,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${LocaleKeys.stepLabel.tr} $step ${LocaleKeys.ofLabel.tr} $total',
                  style: AppTextStyles.s14_regular.darkGreyColor,
                ),
                Text(
                  '$percent%',
                  style: AppTextStyles.s14_regular.primaryColor,
                ),
              ],
            ),
            SizedBox(height: 6.h),
            LinearProgressIndicator(
              value: step / total,
              minHeight: 6.h,
              backgroundColor: AppColors.lightGrey,
              valueColor: const AlwaysStoppedAnimation(AppColors.primary),
            ),
          ],
        );
      }),
    );
  }
}
