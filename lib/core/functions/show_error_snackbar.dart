import '../utils/imports_manager.dart';

import 'show_custom_snackbar.dart';

void showErrorSnackbar(String? errMessage) {
  return showCustomSnackbar(
    title: AppStrings.error,
    message: errMessage ?? AppStrings.unexpectedError,
    type: SnackbarType.error,
  );
}
