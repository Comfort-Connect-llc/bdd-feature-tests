# Feature file for Buy-Down Pricing
# Module 5: Pricing & Equipment
# Section: Buy-Down Pricing Configuration
# Priority: MEDIUM - Gap identified in audit

Feature: Buy-Down Pricing
  Dealer buy-down pricing configuration and application

  Background:
    Given I am an authenticated user with pricing access

  @US-5-8-1 @module-05 @buydown @configuration
  Scenario: Enable Buy-Down Pricing for Dealer
    # As an Administrator, I want to enable buy-down pricing for specific dealers
    # so that they can offer lower rates to customers
    Given I am configuring pricing for a dealer
    When I enable buy-down pricing with:
      | Buy-Down Enabled     | Yes                      |
      | Buy-Down Deeper      | Yes                      |
      | Maximum Buy-Down     | 3.00%                    |
    Then the dealer can access buy-down pricing options
    And buy-down rates are available in their quotes

  @US-5-8-2 @module-05 @buydown @calculation
  Scenario: Calculate Buy-Down Impact on Payment
    # As a System, I want to calculate how buy-down affects customer payments
    # so that accurate comparisons can be shown
    Given a financing quote is being generated
    And the dealer has buy-down enabled
    When I calculate payments with buy-down options:
      | Standard Rate        | 9.99% APR                |
      | Buy-Down Rate        | 7.99% APR                |
      | Buy-Down Cost        | $1,500 dealer fee        |
    Then the quote shows both standard and buy-down payments
    And the customer sees the monthly savings with buy-down

  @US-5-8-3 @module-05 @buydown @application
  Scenario: Apply Buy-Down to Customer Quote
    # As a Dealer, I want to apply buy-down pricing to a customer quote
    # so that I can offer a more competitive rate
    Given I am creating a quote for a homeowner
    And buy-down pricing is available
    When I select the buy-down option
    Then the lower rate is applied to the quote
    And I understand the buy-down fee I will incur
    And the customer sees the reduced monthly payment

  @US-5-8-4 @module-05 @buydown @deeper
  Scenario: Access Buy-Down Deeper Rates
    # As a Dealer, I want to access deeper buy-down rates
    # so that I can offer even more competitive financing
    Given I have buy-down deeper enabled
    When I view available buy-down tiers
    Then I see standard buy-down options
    And I see deeper buy-down options with:
      | Tier 1 Buy-Down      | 1.00% rate reduction     |
      | Tier 2 Buy-Down      | 2.00% rate reduction     |
      | Tier 3 Buy-Down      | 3.00% rate reduction     |
    And corresponding dealer fee for each tier

  @US-5-8-5 @module-05 @buydown @reporting
  Scenario: View Buy-Down Usage Report
    # As an Administrator, I want to view buy-down usage across dealers
    # so that I can analyze pricing strategy effectiveness
    Given dealers have used buy-down pricing
    When I generate the buy-down usage report
    Then I see buy-down utilization by dealer
    And average buy-down amounts
    And impact on approval rates
