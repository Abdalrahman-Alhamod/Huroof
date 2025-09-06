// lib/services/letter_service.dart
import 'package:get/get.dart';
import 'package:huroof/core/utils/imports_manager.dart';

import '../../core/helpers/json_loader.dart';
import '../data/model/letter.dart';

class LetterService {
  static List<Letter>? _arabicLetters;
  static List<Letter>? _englishLetters;

  /// Automatically detects locale using `Get.locale` and returns the correct list
  static Future<List<Letter>> getLetters({bool forceReload = false}) async {
    return Get.isEnglish
        ? getEnglishLetters(forceReload: forceReload)
        : getArabicLetters(forceReload: forceReload);
  }

  static Future<List<Letter>> getArabicLetters({
    bool forceReload = false,
  }) async {
    if (_arabicLetters != null && !forceReload) return _arabicLetters!;
    _arabicLetters = await JsonLoader.loadList(
      AppData.arabicLettersJson,
      Letter.fromJson,
    );
    return _arabicLetters!;
  }

  static Future<List<Letter>> getEnglishLetters({
    bool forceReload = false,
  }) async {
    if (_englishLetters != null && !forceReload) return _englishLetters!;
    _englishLetters = await JsonLoader.loadList(
      AppData.englishLettersJson,
      Letter.fromJson,
    );
    return _englishLetters!;
  }

  /// Automatically localized
  static Future<Letter?> getLetterById(String id) async {
    final letters = await getLetters();
    return letters.firstWhereOrNull((l) => l.key == id);
  }

  /// Get the index of a letter by ID (e.g., for navigation)
  static Future<int?> getLetterIndex(String id) async {
    final letters = await getLetters();
    final index = letters.indexWhere((l) => l.key == id);
    return index >= 0 ? index : null;
  }

  /// Get all letter IDs
  static Future<List<String>> getAllIds() async {
    final letters = await getLetters();
    return letters.map((l) => l.key ?? '').toList();
  }

  /// Find a letter by exact Arabic character (e.g. ب)
  static Future<Letter?> getByChar(String char) async {
    final letters = await getLetters();
    return letters.firstWhereOrNull((l) => l.letter == char);
  }

  /// Clear cache
  static void clearCache() {
    _arabicLetters = null;
    _englishLetters = null;
  }
}
