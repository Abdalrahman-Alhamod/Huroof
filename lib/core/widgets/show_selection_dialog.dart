import 'package:flutter/material.dart';
import '../utils/imports_manager.dart';

Future<T?> showSelectionBottomSheet<T>(
  BuildContext context, {
  required List<T> items,
  required List<String> labels,
}) async {
  assert(
    items.length == labels.length,
    "Items and labels must have the same length",
  );
  return showModalBottomSheet<T>(
    context: context,
    builder: (BuildContext context) {
      return SelectionBottomSheet<T>(items: items, labels: labels);
    },
  );
}

class SelectionBottomSheet<T> extends StatelessWidget {
  const SelectionBottomSheet({
    super.key,
    required this.items,
    required this.labels,
  });

  final List<T> items;
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(items.length, (index) {
            return ListTile(
              title: Text(labels[index], style: AppTextStyles.s18_bold),
              onTap: () {
                Navigator.pop(context, items[index]);
              },
            );
          }),
        ),
      ),
    );
  }
}
