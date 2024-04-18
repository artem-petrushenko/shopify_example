const cartLinesAddMutation = '''
mutation cartLinesAdd(\$cartId: String!, merchandiseId: String!, quantity: Int!) {
  cartLinesAdd(
    lines: {quantity: \$quantity, merchandiseId: \$merchandiseId}
    cartId: \$cartId
  ) {
    cart {
      id
    }
  }
}
''';