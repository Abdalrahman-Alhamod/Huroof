import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huroof/core/utils/imports_manager.dart';
import 'package:huroof/generated/locales.g.dart';

import '../../controllers/letter_details_controller.dart';
import 'primary_navigation_button.dart';

class LetterDetailsNavigation extends GetView<LetterDetailsController> {
  const LetterDetailsNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.08),
            blurRadius: 6,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            controller.isFirstStep
                ? Spacer()
                : PrimaryNavigationButton(
                  onPressed: controller.previousStep,
                  label: LocaleKeys.previous.tr,
                  icon: Icons.arrow_back_ios,
                  isOutlined: true,
                ),
           PrimaryNavigationButton(
              onPressed: controller.nextStep,
              label: controller.isLastStep?LocaleKeys.finish.tr: LocaleKeys.next.tr,
              icon: Icons.arrow_forward_ios,
              isOutlined: false,
            ),
          ],
        );
      }),
    );
  }
}
