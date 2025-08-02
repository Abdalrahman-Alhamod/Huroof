// ignore_for_file: unused_field

part of '../utils/imports_manager.dart';

abstract final class AppData {
  AppData._();
  static const _path = 'assets/data';
  static const arabicLettersJson = '$_path/letters_ar.json';
  static const englishLettersJson = '$_path/letters_en.json';
}
