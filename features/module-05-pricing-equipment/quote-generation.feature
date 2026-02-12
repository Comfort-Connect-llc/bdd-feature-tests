# Feature file generated from BRD User Stories
# Domain 7: Pricing & Quotes
# Section 7.1: Quote Generation

Feature: Quote Generation
  Pricing & Quotes

  @US-7-1-1 @domain-07 @payment
  Scenario: Generate Payment Quote
    # As a Dealer, I want to generate a payment quote for a customer
    # so that they can see estimated monthly payments
    Given project amount and customer information
    When I generate a quote
    Then monthly payment amounts are calculated for available financing options
    And the quote displays term length, payment amount, and total cost

  @US-7-1-2 @domain-07 @payment
  Scenario: Calculate Premier Program Payments
    # As a System, I want to calculate Premier Program monthly payments
    # so that accurate pricing is displayed
    Given project amount, term, and tax rate
    When payments are calculated
    Then the monthly payment includes equipment cost, service costs, and taxes
    And the calculation uses the correct pricing model

  @US-7-1-3 @domain-07
  Scenario: Generate Quote with Bundles
    # As a Dealer, I want to create a quote with bundled equipment packages
    # so that customers see comprehensive pricing
    Given a predefined equipment bundle
    When I generate a quote with the bundle
    Then all bundle components are included
    And the total price reflects any bundle discounts
