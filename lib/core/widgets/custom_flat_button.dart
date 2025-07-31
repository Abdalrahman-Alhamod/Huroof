import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/imports_manager.dart';

class CustomFlatButton extends StatelessWidget {
  const CustomFlatButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.width = double.infinity,
    this.height,
    this.isEnabled = true,
    this.backgroundcolor = AppColors.primary,
    this.textcolor = AppColors.white,
    this.borderColor,
    this.isLoading = false,
  });
  final void Function() onPressed;
  final String title;
  final Color backgroundcolor;
  final Color? textcolor;
  final double width;
  final double? height;
  final Color? borderColor;
  final bool isEnabled;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : (isEnabled ? onPressed : null),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundcolor,
        disabledBackgroundColor: backgroundcolor.withValues(alpha: 0.3),
        fixedSize: Size(width, height ?? 60.h),
        elevation: 0,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side:
              borderColor != null
                  ? BorderSide(color: borderColor!)
                  : BorderSide.none,
        ),
      ),
      child:
          isLoading
              ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator(color: AppColors.white)],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.s18_medium.copyWith(color: textcolor),
                  ),
                ],
              ),
    );
  }
}
