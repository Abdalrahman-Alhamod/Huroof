import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/imports_manager.dart';
import 'custom_text_field.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final Function(String) onChanged;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.s18_bold.blackColor,
        ),
        SizedBox(height: 10.h),
        CustomTextField(hintText: hintText, onChanged: onChanged),
        SizedBox(height: 10.h),
      ],
    );
  }
}
