const String getCartCostQuery = '''
  query(\$id: ID!) {
    cart(id: \$id) {
      checkoutUrl
      cost {
        totalAmount {
          amount
          currencyCode
        }
        subtotalAmount {
          amount
          currencyCode
        }
        checkoutChargeAmount {
          amount
          currencyCode
        }
      }
    }
  }
''';