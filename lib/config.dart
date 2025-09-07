import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:huroof/core/services/storage_service.dart';

import 'core/utils/logger.dart';

Future<void> initAppConfig() async {
  await init(() async {
    await dotenv.load(fileName: ".env");
  }, 'Dotenv');

  await init(() async {
    await Get.putAsync(() => StorageService().onInit());
  }, 'Local Storage');

  await init(() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }, 'Orientation');
}

Future<void> init(Future<void> Function() callback, String errorTitle) async {
  try {
    await callback();
  } catch (error, stackTrace) {
    logger.e(
      '$errorTitle Initialization error: $error',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
