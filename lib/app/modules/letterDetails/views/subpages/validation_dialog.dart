import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:huroof/core/widgets/custom_flat_button.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:huroof/core/utils/imports_manager.dart';
import 'package:huroof/generated/locales.g.dart';

Future<void> showValidationDialog({
  required BuildContext context,
  required double result,
  required bool isSuccess,
  required VoidCallback onRetry,
  required VoidCallback onSuccess,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return ValidationDialog(
        result: result,
        title:
            isSuccess
                ? LocaleKeys.dialogSuccessTitle.tr
                : LocaleKeys.dialogFailTitle.tr,
        subtitle:
            isSuccess
                ? LocaleKeys.dialogSuccessSubtitle.tr
                : LocaleKeys.dialogFailSubtitle.tr,
        buttonText:
            isSuccess
                ? LocaleKeys.dialogSuccessButton.tr
                : LocaleKeys.dialogFailButton.tr,
        isSuccess: isSuccess,
        onRetry: onRetry,
        onSuccess: onSuccess,
      );
    },
  );
}

class ValidationDialog extends StatelessWidget {
  const ValidationDialog({
    super.key,
    required this.result,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.isSuccess,
    required this.onRetry,
    required this.onSuccess,
  });

  final double result;
  final String title;
  final String subtitle;
  final String buttonText;
  final bool isSuccess;
  final VoidCallback onRetry;
  final VoidCallback onSuccess;

  double _normalizeToFraction(double value) {
    if (value <= 1.0) return value.clamp(0.0, 1.0);
    return (value / 100.0).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final percent = _normalizeToFraction(result);
    final percentInt = (percent * 100).round();
    final Color accent = isSuccess ? AppColors.success : AppColors.error;
    final Color track = accent.withValues(alpha: 0.15);
    final lottieAsset = isSuccess ? AppLottie.success : AppLottie.tryAgain;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      backgroundColor: AppColors.surface,
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Semantics(
              label: 'Validation score',
              value: '$percentInt%',
              child: CircularPercentIndicator(
                radius: 70.w,
                lineWidth: 10.w,
                percent: percent,
                animation: true,
                animateFromLastPercent: true,
                backgroundColor: track,
                progressColor: accent,
                circularStrokeCap: CircularStrokeCap.round,
                center: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: percent * 100),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, _) {
                    final v = value.clamp(0, 100).toInt();
                    return AnimatedScale(
                      scale: 1.0 + (value / 1000), // subtle pop while counting
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        '$v%',
                        style: AppTextStyles.s24_bold.copyWith(color: accent),
                      ),
                    );
                  },
                ),
                animationDuration: 800,
              ),
            ),

            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyles.s20_bold.copyWith(color: accent),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 8.w),
                Lottie.asset(lottieAsset, width: 36.w, repeat: false),
              ],
            ),
            SizedBox(height: 10.h),

            Text(
              subtitle,
              style: AppTextStyles.s16_regular.darkGreyColor,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 24.h),
            CustomFlatButton(
              onPressed: () {
                Navigator.of(context).pop();
                isSuccess ? onSuccess() : onRetry();
              },
              title: buttonText,
            ),
          ],
        ),
      ),
    );
  }
}
