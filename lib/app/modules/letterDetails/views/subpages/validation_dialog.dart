import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:huroof/core/utils/imports_manager.dart';
import 'package:huroof/generated/locales.g.dart';

Future<void> showValidationDialog({
  required BuildContext context,
  required bool isSuccess,
  required VoidCallback onRetry,
  required VoidCallback onSuccess,
}) {
  final lottieAsset = isSuccess ? AppLottie.success : AppLottie.tryAgain;

  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return ValidationDialog(
        lottieAsset: lottieAsset,
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
    required this.lottieAsset,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.isSuccess,
    required this.onRetry,
    required this.onSuccess,
  });

  final bool isSuccess;
  final String lottieAsset;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onRetry;
  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      backgroundColor: AppColors.surface,
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(lottieAsset, width: 150.w, repeat: false),
            SizedBox(height: 20.h),
            Text(
              title,
              style: AppTextStyles.s20_bold.copyWith(
                color: isSuccess ? AppColors.success : AppColors.error,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              subtitle,
              style: AppTextStyles.s16_regular.darkGreyColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                isSuccess ? onSuccess() : onRetry();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
              ),
              child: Text(
                buttonText,
                style: AppTextStyles.s16_medium.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
