# Feature file generated from BRD User Stories
# Domain 14: Installation & Funding
# Section 14.3: Contractor Payment

Feature: Contractor Payment
  Installation & Funding

  @US-14-3-1 @domain-14 @payment
  Scenario: Initiate Contractor Payment
    # As a System, I want to initiate contractor payment when documentation is verified
    # so that dealers are paid promptly
    Given funding documentation has been verified
    When payment is initiated
    Then the payment is queued for processing
    And the dealer is notified

  @US-14-3-2 @domain-14 @payment
  Scenario: Process Contractor Payment
    # As a System, I want to process contractor payments to their bank account
    # so that dealers receive their funds
    Given a contractor payment has been initiated
    When the payment is processed
    Then funds are transferred to the dealer's bank account
    And the status changes to "Contractor Paid"

  @US-14-3-3 @domain-14
  Scenario: View Funding Status
    # As a Dealer, I want to view the funding status of my installations
    # so that I know when to expect payment
    Given I have completed installations
    When I view funding status
    Then I see the status of each installation's funding
    And expected payment dates
