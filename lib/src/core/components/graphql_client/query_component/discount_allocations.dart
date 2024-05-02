const String discountAllocations = '''
  discountAllocations {
    ... on CartAutomaticDiscountAllocation {
      title
      discountedAmount {
        amount
        currencyCode
      }
    }
  }
''';
