
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
extension LocaleExtensions on GetInterface {
  /// Checks if the current locale is English.
  bool get isEnglish {
    return Get.locale?.languageCode == 'en';
  }
}

extension WidgetAnimationExtensions on Widget {
  /// Fade + Expand (used for SearchBar and vertical reveals)
  Widget fadeInExpand({
    Duration duration = const Duration(milliseconds: 300),
    Key? key,
  }) {
    return AnimatedSwitcher(
      key: key,
      duration: duration,
      transitionBuilder:
          (child, animation) => FadeTransition(
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              axis: Axis.vertical,
              child: child,
            ),
          ),
      child: this,
    );
  }

  /// Fade + Slide from bottom (used for cards, etc.)
  Widget fadeSlide({
    Duration duration = const Duration(milliseconds: 300),
    Offset slideOffset = const Offset(0.0, 0.1),
    Key? key,
  }) {
    return AnimatedSwitcher(
      key: key,
      duration: duration,
      transitionBuilder:
          (child, animation) => FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: slideOffset,
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          ),
      child: this,
    );
  }

  /// Fade-only (e.g. loading -> loaded, skeleton replacement)
  Widget fadeOnly({
    Duration duration = const Duration(milliseconds: 300),
    Key? key,
  }) {
    return AnimatedSwitcher(
      key: key,
      duration: duration,
      transitionBuilder:
          (child, animation) =>
              FadeTransition(opacity: animation, child: child),
      child: this,
    );
  }

  /// Fade + Replace (use when switching widgets like data lists)
  Widget fadeReplace({
    Duration duration = const Duration(milliseconds: 300),
    Key? key,
  }) {
    return AnimatedSwitcher(
      key: key,
      duration: duration,
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      transitionBuilder:
          (child, animation) =>
              FadeTransition(opacity: animation, child: child),
      child: this,
    );
  }
}
