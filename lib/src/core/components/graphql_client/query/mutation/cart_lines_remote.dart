const String cartLinesRemoteMutation = '''
  mutation cartLinesRemote(\$linesIds: [ID!]!, \$cartId: ID!) {
    cartLinesRemove(lineIds: \$linesIds, cartId: \$cartId) {
      cart {
        id
      }
    }
  }
''';
