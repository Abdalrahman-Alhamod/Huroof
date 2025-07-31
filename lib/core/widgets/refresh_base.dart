import 'package:flutter/material.dart';

import '../utils/imports_manager.dart';

class RefreshBase extends StatelessWidget {
  const RefreshBase({super.key, required this.child, required this.onRefresh});

  final Widget child;
  final void Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 1,
      color: Colors.white,
      backgroundColor: AppColors.primary,
      onRefresh: () async {
        onRefresh();
      },
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [SliverFillRemaining(child: child)],
      ),
    );
  }
}
