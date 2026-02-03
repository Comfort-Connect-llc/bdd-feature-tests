# Feature file generated from BRD User Stories
# Domain 4: Premier Program Origination
# Section 4.8: Application Management

Feature: Application Management
  Premier Program Origination

  @US-4-8-1 @domain-04 @application
  Scenario: Withdraw Application
    # As a Homeowner, I want to withdraw my application
    # so that I am not obligated to proceed if I change my mind
    Given I have an active application that has not been funded
    When I request to withdraw
    Then my application status changes to "Application Withdrawn"
    And the dealer is notified

  @US-4-8-2 @domain-04 @application
  Scenario: Request Application Cancellation
    # As a Dealer, I want to request cancellation of an application
    # so that I can close out deals that won't proceed
    Given I have an active application
    When I request cancellation
    Then the status changes to "Cancellation Requested"

  @US-4-8-3 @domain-04 @application
  Scenario: Cancel Application
    # As a Administrator, I want to cancel an application
    # so that it is properly closed in the system
    Given a cancellation is appropriate
    When I cancel the application
    Then the status changes to "Application Cancelled"
    And all parties are notified
