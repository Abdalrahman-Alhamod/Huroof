import '../data/sources/remote/app_url.dart';

String handleUrl(String url) {
  return url.contains('http') ? url : AppUrl.storage + url;
}
