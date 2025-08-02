// 📁 lib/app/modules/letter_details/controllers/letter_details_controller.dart
import 'package:get/get.dart';
import 'package:huroof/app/data/model/letter.dart';

class LetterDetailsController extends GetxController {
  late final Letter letter;
  final currentStep = 0.obs;

  @override
  void onInit() {
    super.onInit();
    letter = Get.arguments as Letter;
  }

  void nextStep() {
    if (currentStep.value < totalSteps - 1) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  int get totalSteps {
    int baseSteps = 3; // overview, draw, makhraj

    int formSteps =
        [
          letter.forms!.isolated,
          letter.forms!.initial,
          letter.forms!.medial,
          letter.forms!.finalProperty,
        ].where((form) => form != null && form.toString().isNotEmpty).length;

    int variantSteps = letter.variants!.length * 2; // 2 subpages per variant

    return baseSteps + formSteps + variantSteps;
  }
}
