import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/imports_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: Row(children: [Text(title, style: AppTextStyles.s24_regular)]),
      leading: IconButton(
        color: AppColors.black,
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
