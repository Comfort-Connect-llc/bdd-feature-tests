# Feature file generated from BRD User Stories
# Domain 16: Customer Service & Support
# Section 16.5: Support Requests

Feature: Support Requests
  Customer Service & Support

  @US-16-5-1 @domain-16
  Scenario: Submit Support Request
    # As a Homeowner, I want to submit a support request
    # so that I can get help with my account
    Given I have an issue or question
    When I submit a support request
    Then the request is logged
    And I receive confirmation with a reference number

  @US-16-5-2 @domain-16
  Scenario: View Support Request Status
    # As a Homeowner, I want to view the status of my support requests
    # so that I know when to expect resolution
    Given I have submitted a support request
    When I check status
    Then I see the current status and any updates
