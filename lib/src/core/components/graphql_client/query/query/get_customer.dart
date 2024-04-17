const String getCustomerQuery = '''
  query(\$customerAccessToken: String!){
    customer(customerAccessToken: \$customerAccessToken) {
      acceptsMarketing
      createdAt
      displayName
      email
      firstName
      id
      lastName
      numberOfOrders
      phone
      tags
      updatedAt
    }
  }
''';

