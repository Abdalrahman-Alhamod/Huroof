import 'package:get/get.dart';
import 'package:huroof/app/services/letter_service.dart';
import 'package:huroof/core/utils/imports_manager.dart';

import '../../../data/model/letter.dart';

class HomeController extends GetxController {
  final letters = <Letter>[].obs;
  @override
  void onInit() {
    super.onInit();
    loadLetters();
  }

  void loadLetters() async {
    final data =
        Get.isEnglish
            ? await LetterService.getEnglishLetters()
            : await LetterService.getArabicLetters();
    letters.assignAll(data);
  }
}
