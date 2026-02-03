# Feature file generated from BRD User Stories
# Domain 14: Installation & Funding
# Section 14.4: Partner Funding

Feature: Partner Funding
  Installation & Funding

  @US-14-4-1 @domain-14
  Scenario: Request Momnt Funding
    # As a System, I want to request funding from Momnt after installation
    # so that the loan is disbursed
    Given a Momnt loan has been approved and installation is complete
    When funding is requested
    Then Momnt processes the funding
    And the dealer receives payment

  @US-14-4-2 @domain-14
  Scenario: Request Momnt Refund
    # As a Administrator, I want to request a refund from Momnt
    # so that cancelled or adjusted loans are corrected
    Given a Momnt loan requires refund
    When I initiate the refund
    Then the refund is processed with Momnt
    And appropriate adjustments are made

  @US-14-4-3 @domain-14
  Scenario: Request Breeze Funding
    # As a Dealer, I want to request funding from Breeze after delivery/installation
    # so that I receive payment
    Given a Breeze LTO has been executed and installation is complete
    When I set the delivery date
    Then Breeze initiates the funding process
    And I receive payment when funded

  @US-14-4-4 @domain-14
  Scenario: Complete Microf Work Order
    # As a Dealer, I want to complete the work order with Microf
    # so that funding is processed
    Given a Microf LTO has been executed
    When I submit work completion
    Then Microf is notified
    And funding is initiated
