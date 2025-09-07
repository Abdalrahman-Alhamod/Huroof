import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/imports_manager.dart';
import '../widgets/custom_loading_indicator.dart';

void showLoadingDialog() {
  Get.dialog(
    Center(
      child: Container(
        height: 180,
        width: 180,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: CustomLoadingIndicator(color: AppColors.primary, size: 80),
      ),
    ),
    barrierDismissible: false,
  );
}
