import 'package:flutter/material.dart';
import 'package:huroof/app.dart';
import 'package:huroof/config.dart';

void main() async {
  await initAppConfig();
  runApp(const HuroofApp());
}
