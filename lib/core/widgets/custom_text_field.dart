import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/imports_manager.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.obscureText = false,
    this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.initialValue,
    this.unfocusedFillColor,
    this.textDirection,
    this.readOnly = false,
    this.maxLength,
    this.maxLines,
    this.minLines = 1,
    this.isRequired = true,
  });

  final bool obscureText;
  final String? hintText;
  final TextEditingController? controller;
  final bool readOnly;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final Color? unfocusedFillColor;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final TextDirection? textDirection;
  final bool isRequired;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final FocusNode _focusNode;
  late final TextEditingController _controller;
  late bool _enableObscureText;
  bool _isExternalController = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(() => setState(() {}));
    _enableObscureText = widget.obscureText;

    _isExternalController = widget.controller != null;
    _controller = widget.controller ?? TextEditingController();
    if (widget.initialValue != null && !_isExternalController) {
      _controller.text = widget.initialValue!;
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (!_isExternalController) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      obscureText: _enableObscureText,
      readOnly: widget.readOnly,
      onChanged: widget.onChanged,
      validator:
          widget.validator == null && widget.isRequired
              ? (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'هذا الحقل مطلوب';
                }
                return null;
              }
              : null,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      textDirection: widget.textDirection,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      cursorColor: Theme.of(context).colorScheme.primary,
      style: AppTextStyles.s18_medium,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.s18_medium.greyColor,
        filled: true,
        fillColor: widget.unfocusedFillColor ?? AppColors.white,
        contentPadding: EdgeInsets.all(16.sp),
        prefixIcon:
            widget.prefixIcon != null
                ? Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: widget.prefixIcon,
                )
                : null,
        suffixIcon:
            widget.suffixIcon != null
                ? Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: widget.suffixIcon,
                )
                : null,
        prefixIconColor: Colors.grey.shade500,
        suffixIconColor: AppColors.primary,
        enabledBorder: _outlineBorder(AppColors.secondary),
        focusedBorder: _outlineBorder(AppColors.primary, width: 2),
        errorBorder: _outlineBorder(AppColors.error),
        focusedErrorBorder: _outlineBorder(AppColors.error, width: 2),
      ),
    );
  }

  OutlineInputBorder _outlineBorder(Color color, {double width = 1.0}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
