# Feature file generated from BRD User Stories
# Domain 5: Loan Partner Origination
# Section 5.1: Momnt Loan Flow

Feature: Momnt Loan Flow
  Loan Partner Origination

  @US-5-1-1 @domain-05 @application
  Scenario: Initiate Momnt Loan Application
    # As a System, I want to submit an application to Momnt when the homeowner selects a Momnt loan offer
    # so that they can obtain consumer financing
    Given a homeowner has selected a Momnt loan offer
    When the Momnt application is initiated
    Then the applicant information is submitted to Momnt
    And the application status reflects the Momnt flow

  @US-5-1-2 @domain-05 @credit
  Scenario: Approve Momnt Hard Credit Pull
    # As a Homeowner, I want to authorize a hard credit pull for my loan application
    # so that I can receive a final loan decision
    Given I am applying for a Momnt loan
    When I authorize the hard credit pull
    Then the hard pull is executed
    And I receive a final loan decision

  @US-5-1-3 @domain-05
  Scenario: Receive Momnt Loan Decision
    # As a Homeowner, I want to receive my Momnt loan decision
    # so that I know if I can proceed with financing
    Given a hard pull has been authorized
    When Momnt returns a decision
    Then the decision (approved, declined, review) is displayed

  @US-5-1-4 @domain-05 @application
  Scenario: Submit Momnt Final Application
    # As a Homeowner, I want to complete my Momnt loan application
    # so that my loan can be processed
    Given I have been approved for a Momnt loan
    When I complete the final application
    Then my application is submitted for final review

  @US-5-1-5 @domain-05
  Scenario: Accept Momnt Loan Offer
    # As a Homeowner, I want to accept my Momnt loan offer
    # so that I can finalize my financing
    Given my Momnt application has been approved
    When I accept the loan terms
    Then my acceptance is recorded
    And the loan proceeds to funding preparation

  @US-5-1-6 @domain-05 @application
  Scenario: Cancel Momnt Application
    # As a Homeowner, I want to cancel my Momnt application
    # so that I can pursue other financing options
    Given I have an active Momnt application
    When I cancel the application
    Then the cancellation is submitted to Momnt
    And the status changes to "Loan Application Cancelled"
