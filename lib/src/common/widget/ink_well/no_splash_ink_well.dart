import 'package:flutter/material.dart';

class NoSplashInkWell extends StatelessWidget {
  const NoSplashInkWell({
    super.key,
    required this.child,
    this.onTap,
  });

  final Widget child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: child,
      );
}
