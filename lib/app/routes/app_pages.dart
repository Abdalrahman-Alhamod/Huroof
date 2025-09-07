import 'package:get/get.dart';
import 'package:huroof/app/modules/home/middleware/home_middlware.dart';
import 'package:huroof/app/modules/letterDetails/middleware/letter_details_middlware.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/letterDetails/bindings/letter_details_binding.dart';
import '../modules/letterDetails/views/letter_details_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      middlewares: [HomeMiddlware()],
    ),
    GetPage(
      name: _Paths.LETTER_DETAILS,
      page: () => const LetterDetailsView(),
      binding: LetterDetailsBinding(),
      middlewares: [LetterDetailsMiddlware()],
    ),
  ];
}
