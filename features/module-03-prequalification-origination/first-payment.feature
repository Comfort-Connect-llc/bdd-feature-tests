# Feature file generated from BRD User Stories
# Domain 4: Premier Program Origination
# Section 4.6: First Payment

Feature: First Payment
  Premier Program Origination

  @US-4-6-1 @domain-04 @payment
  Scenario: Make First Month Payment
    # As a Homeowner, I want to make my first month's payment
    # so that my Premier enrollment is activated
    Given I have signed my lease agreement
    When I provide payment via the payment portal
    Then my first payment is processed
    And I receive a receipt
    And the status changes to "Ready for Installation"

  @US-4-6-2 @domain-04 @payment
  Scenario: View Payment Confirmation
    # As a Dealer, I want to see confirmation that the homeowner's first payment was received
    # so that I can proceed with installation
    Given the homeowner has made their first payment
    When I view the application
    Then I see payment confirmation
