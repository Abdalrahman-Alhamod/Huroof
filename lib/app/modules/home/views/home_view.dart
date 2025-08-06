// 📁 lib/app/modules/home/views/home_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huroof/app/modules/home/controllers/home_controller.dart';
import 'package:huroof/core/utils/imports_manager.dart';
import 'package:huroof/generated/locales.g.dart';

import 'widgets/letter_grid.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.primary,
        elevation: 2,
        titleSpacing: 14.w,
        centerTitle: false,
        toolbarHeight: 90.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r)),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.letsLearnLetters.tr,
              style: AppTextStyles.s24_bold.whiteColor,
            ),
            SizedBox(height: 12.h),
            Text(
              LocaleKeys.chooseLetterToStart.tr,
              style: AppTextStyles.s14_medium.whiteColor,
            ),
          ],
        ),
        actionsPadding: EdgeInsets.zero,

        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: IconButton(
              onPressed: () {
                final newLocale = Get.isEnglish ? AppLocales.ar : AppLocales.en;
                Get.updateLocale(newLocale);
                controller.loadLetters();
              },
              icon: Icon(Icons.language, color: AppColors.white, size: 40.sp),
            ),
          ),
        ],
      ),
      body: Padding(padding: EdgeInsets.all(16.0.w), child: const LetterGrid()),
    );
  }
}
