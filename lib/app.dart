import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'core/utils/imports_manager.dart';
import 'core/utils/initial_bindings.dart';
import 'generated/locales.g.dart';

class HuroofApp extends StatelessWidget {
  const HuroofApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 846),
      builder: (_, __) {
        return GetMaterialApp(
          title: AppStrings.appName,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          defaultTransition: Get.defaultTransition,
          theme: AppTheme.theme,
          themeMode: ThemeMode.light,
          locale: AppLocales.en,
          fallbackLocale: AppLocales.ar,
          translationsKeys: AppTranslation.translations,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          initialBinding: InitialBindings(),
        );
      },
    );
  }
}
