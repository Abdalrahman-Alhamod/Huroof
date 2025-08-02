import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huroof/core/utils/imports_manager.dart';

import '../controllers/letter_details_controller.dart';
import 'subpages/overview_step.dart';
import 'widgets/letter_details_header.dart';
import 'widgets/letter_details_navigation.dart';

class LetterDetailsView extends GetView<LetterDetailsController> {
  const LetterDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const LetterDetailsHeader(),
            Expanded(
              child: Obx(
                () => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  child: IndexedStack(
                    index: controller.currentStep.value,
                    children: [
                      OverviewStep(letter: controller.letter),
                      // 📌 More steps will go here...
                    ],
                  ),
                ),
              ),
            ),
            const LetterDetailsNavigation(),
          ],
        ),
      ),
    );
  }
}
