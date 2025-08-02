// 📁 lib/core/widgets/primary_navigation_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huroof/core/utils/imports_manager.dart';

class PrimaryNavigationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData icon;
  final bool isOutlined;

  const PrimaryNavigationButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isOutlined ? Colors.transparent : AppColors.primary;
    final contentColor = isOutlined ? AppColors.primary : Colors.white;
    final sideBorder =
        isOutlined
            ? BorderSide(color: AppColors.primary, width: 1.5)
            : BorderSide.none;

    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16, color: contentColor),
      label: Text(
        label,
        style: AppTextStyles.s16_medium.copyWith(color: contentColor),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 14.h),
        fixedSize: Size(150.w, 55.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: sideBorder,
        ),
      ),
    );
  }
}
