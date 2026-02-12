# Feature file generated from BRD User Stories
# Domain 19: Account Lifecycle Management
# Section 19.2: Buyout Process

Feature: Buyout Process
  Account Lifecycle Management

  @US-19-2-1 @domain-19
  Scenario: Request Lease Buyout
    # As a Homeowner, I want to request a buyout of my Premier lease
    # so that I can own the equipment outright
    Given I have an active Premier lease
    When I request a buyout
    Then a buyout quote is generated
    And I receive the buyout amount and process

  @US-19-2-2 @domain-19
  Scenario: Generate Buyout Quote
    # As a System, I want to generate a buyout quote
    # so that homeowners know the cost to purchase their equipment
    Given a buyout is requested
    When the quote is generated
    Then the buyout amount includes remaining principal and any applicable fees

  @US-19-2-3 @domain-19 @payment
  Scenario: Process Buyout Payment
    # As a Homeowner, I want to pay my buyout amount
    # so that I complete the buyout
    Given a buyout quote has been accepted
    When I make the buyout payment
    Then the payment is processed
    And the buyout is completed

  @US-19-2-4 @domain-19
  Scenario: Complete Buyout Process
    # As a System, I want to complete the buyout process
    # so that the lease is properly closed
    Given a buyout payment has been received
    When the buyout is processed
    Then the lease is terminated
    And the status changes to "Buyout Processed"
    And the homeowner receives confirmation of ownership

  @US-19-2-5 @domain-19
  Scenario: Cancel Buyout Request
    # As a Homeowner, I want to cancel my buyout request
    # so that I can continue my lease if I change my mind
    Given I have requested a buyout but not paid
    When I cancel the request
    Then the buyout is cancelled
    And my lease continues normally
