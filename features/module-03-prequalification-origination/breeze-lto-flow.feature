# Feature file generated from BRD User Stories
# Domain 6: LTO Partner Origination
# Section 6.2: Breeze LTO Flow

Feature: Breeze LTO Flow
  LTO Partner Origination

  @US-6-2-1 @domain-06 @application
  Scenario: Create Breeze Application
    # As a System, I want to submit an application to Breeze/Okinus when selected
    # so that the homeowner can obtain Breeze LTO financing
    Given a homeowner has selected a Breeze LTO offer
    When the Breeze application is submitted
    Then an application is created with Breeze

  @US-6-2-2 @domain-06
  Scenario: Initiate Breeze Checkout
    # As a System, I want to create a checkout session with Breeze
    # so that the homeowner can complete their LTO agreement
    Given a Breeze application has been approved
    When checkout is initiated
    Then a checkout session is created

  @US-6-2-3 @domain-06
  Scenario: Calculate Breeze Lease Terms
    # As a System, I want to calculate Breeze lease terms
    # so that accurate payment information is displayed
    Given cart items and applicant information
    When lease terms are calculated
    Then payment amount, term, and down payment are returned

  @US-6-2-4 @domain-06 @payment
  Scenario: Process Breeze Down Payment
    # As a Homeowner, I want to make my Breeze down payment
    # so that my LTO can be finalized
    Given I have accepted Breeze terms
    When I complete the down payment
    Then my payment is processed
    And the LTO agreement is executed

  @US-6-2-5 @domain-06 @signature
  Scenario: Sign Breeze Contract
    # As a Homeowner, I want to sign my Breeze LTO contract
    # so that my agreement is finalized
    Given I have made my down payment
    When I complete the e-signature process
    Then my contract is executed

  @US-6-2-6 @domain-06
  Scenario: Request Breeze Funding
    # As a Dealer, I want to request funding from Breeze after installation
    # so that I receive payment
    Given installation has been completed
    When I submit the delivery date and equipment details
    Then Breeze initiates the funding process

  @US-6-2-7 @domain-06
  Scenario: Cancel Breeze Funding Request
    # As a Dealer, I want to cancel a Breeze funding request
    # so that I can make corrections if needed
    Given a funding request has been submitted
    When I cancel the request with a reason
    Then the funding request is cancelled

  @US-6-2-8 @domain-06
  Scenario: Cancel Breeze Lease
    # As a Administrator, I want to cancel a Breeze lease
    # so that agreements that won't proceed are closed
    Given an active Breeze application
    When I cancel the lease with a reason
    Then the lease is cancelled with Breeze
