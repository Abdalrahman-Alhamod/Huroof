// LetterDetailsView.dart
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
                (letter) {
                  // 1) Build the steps as lazy builders so we don’t construct widgets we don’t show
                  final steps = <_StepItem>[
                    _StepItem('overview',     (ctx) => OverviewStep(letter: letter!)),
                    _StepItem('draw',         (ctx) => DrawAnimationStep(letter: letter!)),
                    _StepItem('makhraj',      (ctx) => MakhrajStep(letter: letter!)),
                    _StepItem('forms',        (ctx) => LetterFormsStep(letter: letter!)),
                    // For each syllable, add audio then record
                    ...?letter?.syllables?.expand((syl) => [
                      _StepItem('audio-${syl.audio ?? syl.text}',   (ctx) => SyllableAudioStep(syllable: syl)),
                      _StepItem('record-${syl.audio ?? syl.text}',  (ctx) => SyllableRecordStep(syllable: syl)),
                    ]),
                  ];

                  return Column(
                    children: [
                      Expanded(
                        child: Obx(() {
                          final idx = controller.currentStep.value.clamp(0, steps.length - 1);
                          final item = steps[idx];

                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                            // 2) AnimatedSwitcher mounts ONLY the current child; previous child is fully disposed
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 250),
                              switchInCurve: Curves.easeOutCubic,
                              switchOutCurve: Curves.easeInCubic,
                              layoutBuilder: (currentChild, previousChildren) => Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  ...previousChildren,
                                  if (currentChild != null) currentChild,
                                ],
                              ),
                              child: KeyedSubtree(
                                // unique key per logical step → guarantees full unmount/remount when step changes
                                key: ValueKey(item.key),
                                child: item.builder(context),
                              ),
                            ),
                          );
                        }),
                      ),
                      // 3) Keep your navigation; make sure it uses steps.length for bounds
                      LetterDetailsNavigation(),
                    ],
                  );
                },
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

class _StepItem {
  final String key;
  final Widget Function(BuildContext) builder;
  _StepItem(this.key, this.builder);
}
