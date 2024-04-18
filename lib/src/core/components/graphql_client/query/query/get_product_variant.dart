/// Query to get product variant
const String getProductVariantQuery = '''
  query(\$id: ID, \$first: Int) {
    product(id: \$id) {
      variants(first: \$first) {
        nodes {
          availableForSale
          id
        }
      }
    }
  }
''';
