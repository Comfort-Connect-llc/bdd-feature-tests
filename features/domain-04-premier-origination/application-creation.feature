# Feature file generated from BRD User Stories
# Domain 4: Premier Program Origination
# Section 4.1: Application Creation

Feature: Application Creation
  Premier Program Origination

  @US-4-1-1 @domain-04 @application
  Scenario: Create Premier Application
    # As a Dealer, I want to create a new Premier Program application for a homeowner
    # so that I can offer them Comfort Connect's all-inclusive home comfort solution
    Given I am an enrolled Premier dealer
    When I create a new application
    Then an application record is created
    And I can enter homeowner information

  @US-4-1-2 @domain-04 @application
  Scenario: Send Application Invitation to Homeowner
    # As a Dealer, I want to send an application invitation to the homeowner
    # so that they can complete their portion of the application
    Given I have created an application with homeowner contact info
    When I send the invitation
    Then the homeowner receives a link via email/SMS
    And the application status changes to "Invitation Sent"

  @US-4-1-3 @domain-04 @application
  Scenario: Submit Application for Underwriting
    # As a Homeowner, I want to submit my application
    # so that Comfort Connect can evaluate my eligibility for the Premier Program
    Given I have completed all required application fields
    When I submit my application
    Then my credit is evaluated (soft pull)
    And I receive a decision within seconds
