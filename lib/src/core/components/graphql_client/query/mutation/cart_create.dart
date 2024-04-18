const String cartCreateMutation = '''
  mutation cartCreate(\$input: CartInput = {}) {
    cartCreate(input: \$input) {
      cart {
        id
      }
    }
  }
''';