// 📁 lib/app/modules/letter_details/controllers/letter_details_controller.dart
import 'package:get/get.dart';
import 'package:huroof/app/data/model/letter.dart';

class LetterDetailsController extends GetxController {
  late final Letter letter;
  final currentStep = 0.obs;
  String? recordedVoicePath;
  bool get isFirstStep => currentStep.value == 0;
  bool get isLastStep => currentStep.value == totalSteps - 1;
  @override
  void onInit() {
    super.onInit();
    letter = Get.arguments as Letter;
  }

  void nextStep() {
    if (currentStep.value < totalSteps - 1) {
      currentStep.value++;
    } else {
      Get.back();
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  int get totalSteps {
    int baseSteps = 4; // overview, draw, makhraj, forms

    int variantSteps = letter.variants!.length * 2; // 2 subpages per variant

    return baseSteps + variantSteps;
  }
}
