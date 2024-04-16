const String getCustomerQuery = '''
  query(\$customerAccessToken: String!){
    customer(customerAccessToken: \$customerAccessToken) {
      id
      createdAt
      email
      displayName
      firstName
      lastName
    }
  }
''';

