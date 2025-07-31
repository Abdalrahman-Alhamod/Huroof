part of '../utils/imports_manager.dart';

abstract final class AppColors {
  AppColors._();

  ///--- Primary & Accent
  static const primary = Color(
    0xFF007B5E,
  ); // Trust, clarity (Main buttons, highlights)
  static const secondary = Color(
    0xFFFFB74D,
  ); // Joy, action (Mic icon, interactive elements)

  ///--- Feedback Colors
  static const success = Color(
    0xFF4CAF50,
  ); // Growth, approval (“Correct” feedback)
  static const error = Color(
    0xFFE53935,
  ); // Alert, caution (“Try Again” feedback)

  ///--- Background & Surface
  static const background = Color(0xFFFFF8E1); // Calm, clean (App background)
  static const surface = Color(0xFFFFFFFF); // Neutral, clean (Cards, dialogs)

  ///--- Text Colors
  static const text = Color(0xFF222222); // High contrast (Arabic content)
  static const mutedGray = Color(
    0xFFBDBDBD,
  ); // Balance (Secondary text, dividers)

  ///--- Legacy Colors (mapped to fit new palette)
  static const black = Color(0xFF000000); // Pure black for strong contrast
  static const white = Color(
    0xFFFFFFFF,
  ); // Pure white for backgrounds and surfaces
  static const grey = Color(0xFF909090); // Neutral mid-grey, use sparingly
  static const lightGrey = Color(
    0xFFF8FAFC,
  ); // Very light grey, near white, for subtle backgrounds
  static const darkGrey = Color(
    0xFF605A56,
  ); // Dark muted grey for less prominent text
  static const yellow = Color(
    0xFFFFDF00,
  ); // Bright yellow, use sparingly as accent or warnings
}
