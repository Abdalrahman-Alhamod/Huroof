// 📁 lib/core/widgets/letter_grid.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huroof/app/modules/home/controllers/home_controller.dart';
import 'package:huroof/app/routes/app_pages.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../data/model/letter.dart';
import 'letter_tile.dart';

class LetterGrid extends GetView<HomeController> {
  const LetterGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Skeletonizer(
        enabled: controller.letters.isEmpty,

        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount:
              controller.letters.isEmpty ? 10 : controller.letters.length,
          itemBuilder: (context, index) {
            final letter =
                controller.letters.isEmpty
                    ? Letter(id: '', letter: 'ا', name: 'Alif')
                    : controller.letters[index];
            return LetterTile(
              letter: letter,
              onTap:
                  controller.letters.isEmpty
                      ? null
                      : () {
                        Get.toNamed(
                          Routes.LETTER_DETAILS,
                          arguments: controller.letters[index],
                        );
                      },
            );
          },
        ),
      ),
    );
  }
}
