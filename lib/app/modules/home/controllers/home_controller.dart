import 'package:get/get.dart';
import 'package:huroof/app/data/source/letters_data_source.dart';

import '../../../../core/data/model/list_model.dart' show ListModel;
import '../../../../core/data/sources/remote/api_request.dart';
import '../../../data/model/letter.dart';

class HomeController extends GetxController with StateMixin<List<Letter>> {
  final LettersDataSource _lettersDataSource = Get.find();

  void fetchLetters() {
    ApiRequest.handle<ListModel<Letter>>(
      request: _lettersDataSource.getLetters,
      onLoading: () {
        change(null, status: RxStatus.loading());
      },
      onSuccess: (data) {
        change(data.items, status: RxStatus.success());
      },
      onFailure: (errMessage) {
        change(null, status: RxStatus.error(errMessage));
      },
    );
  }
}
