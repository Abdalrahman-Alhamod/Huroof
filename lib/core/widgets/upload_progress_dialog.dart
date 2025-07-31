import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/imports_manager.dart';

class UploadProgressDialog extends StatelessWidget {
  final RxDouble progress;

  const UploadProgressDialog({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AlertDialog(
        contentPadding: EdgeInsets.all(20),
        title: Text(AppStrings.uploading),
        content: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: progress.value,
              backgroundColor: AppColors.primary.withAlpha(30),
              strokeWidth: 6,
              constraints: BoxConstraints(minHeight: 120, minWidth: 120),
            ),
            Text(
              '${(progress * 100).toStringAsFixed(0)}%',
              style: AppTextStyles.s24_bold,
            ),
          ],
        ),
      );
    });
  }
}
