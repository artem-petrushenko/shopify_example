import 'package:flutter/material.dart';
import 'package:shopify_example/src/common/routes/app_router.dart';
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
          onTap: () => Navigator.of(context).pushNamed(
            AppRouter.collection,
            arguments: collections[index].id,
          ),
        ),
      );
}
