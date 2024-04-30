import 'package:flutter/material.dart';

class DefaultChip extends StatelessWidget {
  const DefaultChip({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 4.0,
          ),
          child: child,
        ),
      );
}
