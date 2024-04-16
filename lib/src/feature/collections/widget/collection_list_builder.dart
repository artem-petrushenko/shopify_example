import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_example/src/common/routes/routes.dart';
import 'package:shopify_example/src/feature/collections/model/collection_model.dart';
import 'package:shopify_example/src/feature/collections/widget/collection_card.dart';

class CollectionListBuilder extends StatelessWidget {
  const CollectionListBuilder({
    super.key,
    required this.collections,
  });

  final List<CollectionModel> collections;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: collections.length,
        itemBuilder: (BuildContext context, int index) => CollectionCard(
          title: collections[index].title,
          onTap: () => context.push(
            Routes.collection,
            extra: collections[index].id,
          ),
        ),
      );
}
