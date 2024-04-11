import 'package:flutter/material.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({
    super.key,
    required this.title,
     this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          title: Text(title),
          onTap: onTap,
        ),
      );
}
