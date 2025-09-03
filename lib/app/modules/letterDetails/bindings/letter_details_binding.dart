import 'package:get/get.dart';

import '../controllers/letter_details_controller.dart';

class LetterDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LetterDetailsController>(() => LetterDetailsController());
  }
}
