// 📁 lib/core/widgets/letter_tile.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huroof/core/utils/imports_manager.dart';
import 'package:huroof/app/data/model/letter.dart';

class LetterTile extends StatelessWidget {
  final Letter letter;
  final VoidCallback? onTap;

  const LetterTile({super.key, required this.letter, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      splashColor: AppColors.primary.withAlpha(20),
      child: Ink(
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          // color: AppColors.surface,
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.5),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.18),
              offset: const Offset(2, 2),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              letter.letter!,
              style: AppTextStyles.s48_bold.primaryColor.copyWith(
                fontFamily: AppFonts.Amiri,
              ),
            ),
            const SizedBox(height: 8),
            Text(letter.name!, style: AppTextStyles.s16_medium.blackColor),
          ],
        ),
      ),
    );
  }
}
