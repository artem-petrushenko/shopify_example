import 'package:flutter/material.dart';
import 'package:shopify_example/src/common/widget/progress_indicator/default_circular_progress_indicator.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) =>
      const Center(child: DefaultCircularProgressIndicator());
}
