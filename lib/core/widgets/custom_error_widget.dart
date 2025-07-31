import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../utils/imports_manager.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String? errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LottieBuilder.asset(AppLottie.error, width: 40.w),
          SizedBox(height: 10.h),
          Text(
            'حدث خطأ: ${errMessage ?? 'غير معروف'}',
            style: AppTextStyles.s16_bold.redColor,
          ),
        ],
      ),
    );
  }
}
