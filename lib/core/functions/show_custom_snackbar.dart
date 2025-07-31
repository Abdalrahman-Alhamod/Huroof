import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/imports_manager.dart';

void showCustomSnackbar({
  required String title,
  required String message,
  required SnackbarType type,
}) {
  // Define the colors and icons based on the type
  Color backgroundColor;
  IconData icon;

  switch (type) {
    case SnackbarType.success:
      backgroundColor = AppColors.success;
      icon = Icons.check_circle;
      break;
    case SnackbarType.error:
      backgroundColor = AppColors.error;
      icon = Icons.error;
      break;
    case SnackbarType.info:
      backgroundColor = AppColors.primary;
      icon = Icons.info;
      break;
  }

  // Display the Snackbar
  Get.snackbar(
    title,
    message,
    messageText: Text(message, style: AppTextStyles.s16_medium.whiteColor),
    snackPosition: SnackPosition.TOP,
    backgroundColor: backgroundColor,
    colorText: Colors.white,
    icon: Icon(icon, color: Colors.white, size: 32),
    margin: const EdgeInsets.all(16),
    borderRadius: 8,
    duration: const Duration(seconds: 4),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
  );
}

// Enum for snackbar types
enum SnackbarType { success, error, info }
