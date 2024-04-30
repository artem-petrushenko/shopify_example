import 'package:flutter/material.dart';
import 'package:shopify_example/src/common/chip/default_chip.dart';

class SaleChip extends StatelessWidget {
  const SaleChip({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DefaultChip(
          child: Text(
            'Sale',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.background,
                ),
          ),
        ),
      );
}
