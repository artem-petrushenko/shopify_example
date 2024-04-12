import 'package:shopify_example/src/core/components/graphql_client/query_component/image.dart';

String images({int first = 10}) => '''
      images(first: $first) {
        nodes {
          altText
          height
          id
          url
          width
        }
        ${image(name: 'nodes')}
      }
    ''';
