import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Centralized API endpoints for Huroof App
abstract final class AppUrl {
  AppUrl._(); // Prevent instantiation

  // ----------------------------- Base URLs -----------------------------
  static final baseServ = dotenv.get('BASE_SERVE');
  static final _api = "${baseServ}api/";
  static final storage = "${baseServ}storage/";

  // ----------------------------- Letters -----------------------------
  static final listLetters = "${_api}letters";
  static String letterDetails(String letterKey) => "$listLetters/$letterKey";
  static String submit(String letterKey,String syllableKey) => "${letterDetails(letterKey)}/$syllableKey/submit";

  // ----------------------------- Files -----------------------------
  static final uploadFile = "${_api}upload-file";

  // ----------------------------- Privacy Policy -----------------------------
  static final privacyPolicy = "${_api}privacy-policy";
}
