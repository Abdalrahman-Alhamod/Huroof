import 'package:get/get_utils/get_utils.dart';
import 'package:huroof/generated/locales.g.dart';
import 'show_custom_snackbar.dart';

void showErrorSnackbar(String? errMessage) {
  return showCustomSnackbar(
    title: LocaleKeys.error.tr,
    message: errMessage ?? LocaleKeys.unexpectedError.tr,
    type: SnackbarType.error,
  );
}
