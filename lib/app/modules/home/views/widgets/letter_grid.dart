// 📁 lib/core/widgets/letter_grid.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huroof/app/routes/app_pages.dart';

import '../../../../data/model/letter.dart';
import 'letter_tile.dart';

class LetterGrid extends StatelessWidget {
  const LetterGrid({required this.letters, super.key});
  final List<Letter> letters;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: letters.length,
      itemBuilder: (context, index) {
        return LetterTile(
          letter: letters[index],
          onTap:
              () =>
                  Get.toNamed(Routes.LETTER_DETAILS, arguments: letters[index]),
        );
      },
    );
  }
}
