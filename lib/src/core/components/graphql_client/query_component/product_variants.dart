String productVariant = '''
      variants(first: \$productFirst) {
        nodes {
          availableForSale
          id
          title
          compareAtPriceV2 {
            amount
            currencyCode
          }
          priceV2 {
            amount
            currencyCode
          }
        }
      }
''';
