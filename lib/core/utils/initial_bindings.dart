import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:huroof/app/data/source/letters_data_source.dart';

import '../../app/data/source/letters_local_data_source.dart';
import '../services/api_services.dart';
import '../services/api_services_impl.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => Dio());
    Get.lazyPut<ApiServices>(() => ApiServicesImpl());
    // Get.lazyPut<LettersDataSource>(() => LettersRemoteDataSource());
    Get.lazyPut<LettersDataSource>(() => LettersLocalDataSource());
  }
}
