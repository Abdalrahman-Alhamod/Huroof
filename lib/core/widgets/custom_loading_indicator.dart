import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/imports_manager.dart';

class CustomLoadingIndicator extends StatefulWidget {
  const CustomLoadingIndicator({
    super.key,
    this.color = AppColors.primary,
    this.size = 50.0,
    this.onComplete,
    this.durationInSeconds = 2,
  });

  final Color color;
  final double size;
  final VoidCallback? onComplete;
  final int durationInSeconds;
  @override
  CustomLoadingIndicatorState createState() => CustomLoadingIndicatorState();
}

class CustomLoadingIndicatorState extends State<CustomLoadingIndicator> {
  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    Future.delayed(
      Duration(seconds: widget.durationInSeconds),
      () {
        if (widget.onComplete != null) {
          widget.onComplete!();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        color: widget.color,
        size: widget.size,
      ),
    );
  }
}
