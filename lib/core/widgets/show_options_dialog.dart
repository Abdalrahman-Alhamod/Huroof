import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/option.dart';
import '../utils/imports_manager.dart';

void showOptionsDialog<T>({
  required String title,
  required List<Option<T>> options,
  required Rx<Option<T>?> selectedOption,
  required void Function(Option<T> option) onChange,
  bool enableSearch = false,
}) {
  final TextEditingController searchController = TextEditingController();
  final RxList<Option<T>> filteredOptions = options.obs;

  void filterOptions(String query) {
    if (query.isEmpty) {
      filteredOptions.assignAll(options);
    } else {
      filteredOptions.assignAll(
        options.where(
          (option) => option.label.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }

  Get.dialog(
    Dialog(
      child: SizedBox(
        height: Get.context!.height * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(title, style: AppTextStyles.s20_bold),
            ),
            Visibility(
              visible: enableSearch,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: TextField(
                  controller: searchController,
                  onChanged: filterOptions,
                  decoration: InputDecoration(
                    hintText: 'بحث...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.search_outlined),
                  ),
                ),
              ),
            ),
            Obx(() {
              selectedOption.value; // Observe changes
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero, // Remove padding from the ListView
                  itemBuilder: (context, index) {
                    return RadioListTile<Option<T>>(
                      title: Text(filteredOptions[index].label),
                      value: filteredOptions[index],
                      groupValue: selectedOption.value,
                      onChanged: (value) {
                        onChange(value!);
                        Get.back();
                      },
                      tileColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top:
                              index == 0
                                  ? Radius.circular(16)
                                  : Radius
                                      .zero, // Top corners for the first item
                          bottom:
                              index == filteredOptions.length - 1
                                  ? Radius.circular(16)
                                  : Radius
                                      .zero, // Bottom corners for the last item
                        ),
                      ),
                    );
                  },
                  itemCount: filteredOptions.length,
                  shrinkWrap: true, // Ensure it shrinks for small lists
                ),
              );
            }),
          ],
        ),
      ),
    ),
  );
}
