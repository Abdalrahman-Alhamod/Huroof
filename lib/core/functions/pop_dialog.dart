import 'package:get/get.dart';

void popDialog() {
  if (Get.isSnackbarOpen) {
    Get.closeAllSnackbars();
  }
  while (Get.isDialogOpen!) {
    Get.back();
  }
}
