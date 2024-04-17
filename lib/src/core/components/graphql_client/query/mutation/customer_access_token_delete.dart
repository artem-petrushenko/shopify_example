const customerAccessTokenDeleteMutation = ''' 
  mutation customerAccessTokenDelete {
    customerAccessTokenDelete {
      deletedAccessToken
      deletedCustomerAccessTokenId
    }
  }
''';