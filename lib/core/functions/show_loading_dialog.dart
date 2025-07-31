import 'package:get/get.dart';
import '../utils/imports_manager.dart';
import '../widgets/custom_loading_indicator.dart';

void showLoadingDialog() {
  Get.dialog(
    CustomLoadingIndicator(color: AppColors.primary, size: 80),
    barrierDismissible: false,
  );
}
