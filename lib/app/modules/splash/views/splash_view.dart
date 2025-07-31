import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/utils/imports_manager.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.onReady();
    return Scaffold(
      body: Image.asset(
        AppImages.splash,
        fit: BoxFit.cover,
        width: context.width,
        height: context.height,
      ),
    );
  }
}
