# Feature file generated from BRD User Stories
# Domain 19: Account Lifecycle Management
# Section 19.3: Account Termination

Feature: Account Termination
  Account Lifecycle Management

  @US-19-3-1 @domain-19
  Scenario: Request Account Cancellation
    # As a Homeowner, I want to request cancellation of my account
    # so that I can end my agreement
    Given I have an active account
    When I request cancellation
    Then the request is logged
    And the cancellation process begins

  @US-19-3-2 @domain-19
  Scenario: Process Account Termination
    # As a Administrator, I want to process account terminations
    # so that accounts are properly closed
    Given a termination is warranted
    When I process the termination
    Then the account status changes to "Terminated"
    And billing stops
    And all parties are notified

  @US-19-3-3 @domain-19 @payment
  Scenario: Terminate for Non-Payment
    # As a System, I want to terminate accounts for prolonged non-payment
    # so that uncollectable accounts are closed
    Given an account has been delinquent for an extended period
    When termination criteria are met
    Then the account is terminated
    And appropriate collection actions are triggered
