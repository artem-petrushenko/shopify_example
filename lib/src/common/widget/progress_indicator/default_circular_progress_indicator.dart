import 'package:flutter/material.dart';

class DefaultCircularProgressIndicator extends StatelessWidget {
  const DefaultCircularProgressIndicator({
    super.key,
    this.value,
    this.strokeCap = StrokeCap.round,
  });

  final double? value;
  final StrokeCap? strokeCap;

  @override
  Widget build(BuildContext context) => CircularProgressIndicator(
        strokeCap: strokeCap,
        value: value,
      );
}
