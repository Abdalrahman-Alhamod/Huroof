import 'package:get/get.dart';

import '../../../core/services/api_services.dart';

class LettersRemoteDataSource {
  final ApiServices _apiServices = Get.find<ApiServices>();

  Future<ListModel<Letter>> get() async {
    final response = await _apiServices.get(AppUrl.advertisements);
    return ListModel.fromJson(
      response,
      (itemJson) => Advertisement.fromJson(itemJson),
    );
  }

}
