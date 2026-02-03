# Feature file generated from BRD User Stories
# Domain 1: Dealer/Contractor Onboarding
# Section 1.1: Merchant Application

Feature: Merchant Application
  Dealer/Contractor Onboarding

  @US-1-1-1 @domain-01
  Scenario: Invite Dealer to Apply
    # As a Administrator, I want to send an application invitation to a prospective dealer
    # so that they can begin the onboarding process
    Given a valid dealer contact email and business name
    When I send a merchant application invitation
    Then the dealer receives an email with a secure link to begin their application
    And the application record is created with status "Invitation Sent"

  @US-1-1-2 @domain-01 @application
  Scenario: Save Application Progress
    # As a Dealer, I want to save my application progress at any time
    # so that I can complete it later without losing my information
    Given I am completing my merchant application
    When I save my progress
    Then all entered information is preserved
    And I can resume from where I left off

  @US-1-1-3 @domain-01 @application
  Scenario: Submit Merchant Application
    # As a Dealer, I want to submit my completed merchant application
    # so that Comfort Connect can review my business for approval
    Given I have completed all required fields including business details, tax ID, banking information, and owner information
    When I submit my application
    Then the application status changes to "Submitted"
    And I receive confirmation that my application is under review
