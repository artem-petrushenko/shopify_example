import 'package:flutter/material.dart';

class DefaultCircularProgressIndicator extends StatelessWidget {
  const DefaultCircularProgressIndicator({
    super.key,
    this.value,
    this.strokeCap = StrokeCap.round,
    this.alignment = Alignment.center,
  });

  final double? value;
  final StrokeCap? strokeCap;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) => Align(
        alignment: alignment,
        child: CircularProgressIndicator(
          strokeCap: strokeCap,
          value: value,
        ),
      );
}
