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
