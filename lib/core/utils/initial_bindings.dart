import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../services/api_services.dart';
import '../services/api_services_impl.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => Dio());
    Get.putAsync<ApiServices>(() async => ApiServicesImpl());
  }
}
