const String cartLinesUpdateMutation = '''
  mutation cartLinesUpdate(\$cartId: ID!, \$lineId: ID!, \$quantity: Int!) {
    cartLinesUpdate(cartId: \$cartId, lines: {id: \$lineId, quantity: \$quantity}) {
      cart {
        id
      }
    }
  }
''';
