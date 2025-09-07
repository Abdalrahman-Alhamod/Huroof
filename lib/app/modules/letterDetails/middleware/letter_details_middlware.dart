import 'package:get/get.dart';
import 'package:huroof/app/modules/letterDetails/controllers/letter_details_controller.dart';

class LetterDetailsMiddlware extends GetMiddleware {
  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    Get.find<LetterDetailsController>().fetchLetterDetails();
    return super.onPageBuildStart(page);
  }
}
