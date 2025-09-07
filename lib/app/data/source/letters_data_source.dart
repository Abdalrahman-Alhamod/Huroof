import '../../../core/data/model/list_model.dart';
import '../model/letter.dart';
import '../model/submit_response.dart';

abstract class LettersDataSource {
  Future<ListModel<Letter>> getLetters();
  Future<Letter> getLetterDetails({required String letterKey});
  Future<SubmitResponse> submit({
    required String letterKey,
    required String syllalbleKey,
    required String audioPath,
    void Function(int sent, int total)? onSendProgress,
  });
}
