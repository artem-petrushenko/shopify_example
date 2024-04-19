import 'package:flutter/material.dart';

class ProductRecommendationsCart extends StatelessWidget {
  const ProductRecommendationsCart({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Text(title),
      );
}
