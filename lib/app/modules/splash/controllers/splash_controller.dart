import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/assets/image_paths.dart';
import '../../../../core/utils/logger.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    try {
      await precacheImages();
      await Future.delayed(const Duration(seconds: 3));
      await Get.offNamed(Routes.HOME);
    } catch (error) {
      logger.print(
        'Error during initialization: $error',
        color: PrintColor.red,
      );
    }
    super.onReady();
  }

  Future<void> precacheImages() async {
    for (final path in ImagePaths.all) {
      try {
        await precacheImage(AssetImage(path), Get.context!);
      } catch (e, s) {
        logger.print(
          'Error during initializating image with path $path: \nError = $e \nStack Trace =  $s',
          color: PrintColor.red,
        );
      }
    }
  }
}
