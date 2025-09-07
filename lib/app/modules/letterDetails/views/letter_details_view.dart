import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huroof/app/modules/letterDetails/views/subpages/draw_animation_step.dart';
import 'package:huroof/app/modules/letterDetails/views/subpages/letter_forms_step.dart';
import 'package:huroof/app/modules/letterDetails/views/subpages/syllable_record_step.dart';
import 'package:huroof/app/modules/letterDetails/views/subpages/makhraj_step.dart';
import 'package:huroof/core/utils/imports_manager.dart';
import 'package:huroof/core/widgets/custom_error_widget.dart';
import 'package:huroof/core/widgets/custom_loading_indicator.dart';

import '../controllers/letter_details_controller.dart';
import 'subpages/syllable_audio_step.dart';
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
              child: controller.obx(
                (letter) => Column(
                  children: [
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
                              OverviewStep(letter: letter!),
                              DrawAnimationStep(letter: letter),
                              MakhrajStep(letter: letter),
                              LetterFormsStep(letter: letter),
                              ...letter.syllables!.expand(
                                (syllable) => [
                                  SyllableAudioStep(syllable: syllable),
                                  SyllableRecordStep(syllable: syllable),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const LetterDetailsNavigation(),
                  ],
                ),
                onLoading: CustomLoadingIndicator(),
                onError: (error) => CustomErrorWidget(errMessage: error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
