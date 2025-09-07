import 'package:get/get.dart';
import 'package:huroof/app/modules/home/controllers/home_controller.dart';

class HomeMiddlware extends GetMiddleware {
  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    Get.find<HomeController>().fetchLetters();
    return super.onPageBuildStart(page);
  }
}
