// 📁 lib/app/modules/letter_details/widgets/steps/letter_forms_step.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:huroof/app/data/model/letter.dart';
import 'package:huroof/core/utils/imports_manager.dart';
import 'package:huroof/generated/locales.g.dart';

class LetterFormsStep extends StatelessWidget {
  final Letter letter;

  const LetterFormsStep({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    final forms = letter.forms;
    final List<MapEntry<String, String>> formItems = [];

    if (forms!.isolated != null) {
      formItems.add(MapEntry(LocaleKeys.formIsolated.tr, forms.isolated!));
    }
    if (forms.initial != null) {
      formItems.add(MapEntry(LocaleKeys.formInitial.tr, forms.initial!));
    }
    if (forms.medial != null) {
      formItems.add(MapEntry(LocaleKeys.formMedial.tr, forms.medial!));
    }
    if (forms.finalProperty != null) {
      formItems.add(MapEntry(LocaleKeys.formFinal.tr, forms.finalProperty!));
    }

    return Column(
      children: [
        /// Header
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.line_style_rounded,
                      size: 16,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      LocaleKeys.formsTitle.tr,
                      style: AppTextStyles.s14_regular.primaryColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                LocaleKeys.formsSubtitle.tr,
                style: AppTextStyles.s16_medium.darkGreyColor,
              ),
            ],
          ),
        ),

        /// Forms List
        Expanded(
          child: ListView.separated(
            itemCount: formItems.length,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              final item = formItems[index];
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.06),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.key,
                      style: AppTextStyles.s16_medium.darkGreyColor,
                    ),
                    Text(
                      item.value,
                      style: AppTextStyles.s40_bold.primaryColor,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
