import 'dart:math';

import 'package:get/get.dart';
import 'package:huroof/app/data/model/letter.dart';
import 'package:huroof/app/data/model/submit_response.dart';
import 'package:huroof/app/data/source/letters_data_source.dart';
import 'package:huroof/core/data/model/list_model.dart';
import 'package:huroof/core/functions/fake_delay.dart';
import 'package:huroof/core/utils/imports_manager.dart';

import '../../services/letter_service.dart';

class LettersLocalDataSource extends LettersDataSource {
  List<Letter>? _letters;
  @override
  Future<Letter> getLetterDetails({required String letterKey}) async {
    await _loadLetters();
    return _letters?.firstWhere((letter) => letter.key == letterKey) ??
        Letter();
  }

  @override
  Future<ListModel<Letter>> getLetters() async {
    await _loadLetters();
    return ListModel(items: _letters ?? []);
  }

  @override
  Future<SubmitResponse> submit({
    required String letterKey,
    required String syllalbleKey,
    required String audioPath,
    void Function(int sent, int total)? onSendProgress,
  }) async {
    await fakeDelay();
    return SubmitResponse(
      letterKey: letterKey,
      syllableKey: syllalbleKey,
      result: Random().nextDouble(),
    );
  }

  Future<void> _loadLetters() async {
    await fakeDelay();
    _letters =
        Get.isEnglish
            ? await LetterService.getEnglishLetters()
            : await LetterService.getArabicLetters();
  }
}
