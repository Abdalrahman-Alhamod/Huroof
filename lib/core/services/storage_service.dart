import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  GetStorage get _box => GetStorage('settings');

  bool _isFirstLaunch = false;

  bool get firstLaunch => _isFirstLaunch;

  String get apiToken => _box.read(_Keys.apiToken) ?? '';
  set apiToken(String value) => _write(_Keys.apiToken, value);

  Map<String, dynamic> get apiUserData => _box.read(_Keys.apiUserInfo) ?? {};
  set apiUserData(Map<String, dynamic> value) =>
      _write(_Keys.apiUserInfo, value);

  String get languageCode => _box.read(_Keys.languageCode) ?? 'en';
  set languageCode(String value) => _write(_Keys.languageCode, value);

  @override
  Future<StorageService> onInit() async {
    super.onInit();
    await _box.initStorage;
    _isFirstLaunch = _box.read(_Keys.firstLaunch) ?? true;
    if (_isFirstLaunch) {
      await _box.write(_Keys.firstLaunch, false);
    }
    return this;
  }

  void reset() => _box.erase();

  void _write<T>(String key, T value) {
    value == null ? _box.remove(key) : _box.write(key, value);
  }
}

/// storage keys.
abstract class _Keys {
  static const String firstLaunch = 'first_launch';
  static const String apiToken = 'api_token';
  static const String apiUserInfo = 'api_user_info';
  static const String languageCode = 'language_code';
}
