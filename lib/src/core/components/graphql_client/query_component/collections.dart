String collections({int first = 10}) => '''
  collections(first: $first) {
    nodes {
      id
      handle
      title
      updatedAt
    }
  }
''';
