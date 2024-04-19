import 'package:flutter/material.dart';

class DefaultCircularProgressIndicator extends StatelessWidget {
  const DefaultCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) => const CircularProgressIndicator(
        strokeCap: StrokeCap.round,
      );
}
