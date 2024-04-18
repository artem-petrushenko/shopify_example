const cartLinesAddMutation = '''
  mutation cartLinesAdd(\$cartId: ID!, \$merchandiseId: ID!, \$quantity: Int!) {
    cartLinesAdd(
      lines: {quantity: \$quantity, merchandiseId: \$merchandiseId}, cartId: \$cartId
    ) {
      cart {
        id
      }
    }
  }
''';