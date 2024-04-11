const String getCollectionQuery = r'''
query($after : String, $reverse : Boolean, $first : Int){
  collections(first: $first, reverse: $reverse, after: $after) {
    totalCount
    edges {
      node {
        title
        handle
        id
        updatedAt
        image {
          altText
          height
          id
          width
        }
      }
    }
    pageInfo {
      endCursor
      hasNextPage
      hasPreviousPage
      startCursor
    }
  }
}
''';
