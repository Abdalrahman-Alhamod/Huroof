// 📁 lib/app/modules/letter_details/controllers/letter_details_controller.dart
import 'package:get/get.dart';
import 'package:huroof/app/data/model/letter.dart';
import 'package:huroof/app/data/model/submit_response.dart';
import 'package:huroof/app/data/model/syllable.dart';
import 'package:huroof/app/data/source/letters_data_source.dart';
import 'package:huroof/core/functions/pop_dialog.dart';
import 'package:huroof/core/functions/show_error_snackbar.dart';

import '../../../../core/data/sources/remote/api_request.dart';
import '../views/widgets/upload_progress_dialog.dart';

class LetterDetailsController extends GetxController with StateMixin<Letter> {
  final LettersDataSource _lettersDataSource = Get.find();
  late Letter letter;
  final currentStep = 0.obs;
  String? recordedVoicePath;
  bool get isFirstStep => currentStep.value == 0;
  bool get isLastStep => currentStep.value == totalSteps - 1;

  @override
  void onInit() {
    super.onInit();
    letter = Get.arguments as Letter;
  }

  void fetchLetterDetails() {
    ApiRequest.handle<Letter>(
      request:
          () => _lettersDataSource.getLetterDetails(letterKey: letter.key!),
      onLoading: () {
        change(null, status: RxStatus.loading());
      },
      onSuccess: (responseLetter) {
        letter = responseLetter;
        currentStep.refresh();
        change(responseLetter, status: RxStatus.success());
      },
      onFailure: (errMessage) {
        change(null, status: RxStatus.error(errMessage));
      },
    );
  }

  void submit(Syllable syllable, Function(SubmitResponse) onSuccess) {
    if (recordedVoicePath != null) {
      RxDouble progress = 0.0.obs;
      ApiRequest.handle<SubmitResponse>(
        request:
            () => _lettersDataSource.submit(
              letterKey: letter.key!,
              syllalbleKey: syllable.key!,
              audioPath: recordedVoicePath!,
              onSendProgress: (sent, total) {
                progress.value = sent.toDouble() / total.toDouble();
              },
            ),
        onLoading: () {
          Get.dialog(
            UploadProgressDialog(progress: progress),
            barrierDismissible: false,
          );
        },
        onSuccess: (submitResponse) {
          popDialog();
          onSuccess(submitResponse);
        },
        onFailure: (errMessage) {
          popDialog();
          showErrorSnackbar(errMessage);
        },
      );
    }
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
    if (letter.description == null) return 1;
    int baseSteps = 4; // overview, draw, makhraj, forms

    int syllableSteps =
        (letter.syllables ?? []).length * 2; // 2 subpages per syllable

    return baseSteps + syllableSteps;
  }
}
