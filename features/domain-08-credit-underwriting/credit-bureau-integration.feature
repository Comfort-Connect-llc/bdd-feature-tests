# Feature file generated from BRD User Stories
# Domain 8: Credit & Underwriting
# Section 8.1: Credit Bureau Integration

Feature: Credit Bureau Integration
  Credit & Underwriting

  @US-8-1-1 @domain-08 @credit
  Scenario: Perform Soft Credit Pull
    # As a System, I want to perform a soft credit pull for prequalification
    # so that applicant creditworthiness can be evaluated without impacting their credit score
    Given applicant personal information and consent
    When a soft credit pull is requested
    Then credit data is retrieved from the bureau
    And the inquiry does not appear on the applicant's credit report

  @US-8-1-2 @domain-08 @credit
  Scenario: Perform Hard Credit Pull
    # As a System, I want to perform a hard credit pull when required for final loan decisions
    # so that complete credit evaluation can occur
    Given applicant authorization for a hard pull
    When a hard credit pull is executed
    Then complete credit data is retrieved
    And the inquiry is recorded on the applicant's credit report

  @US-8-1-3 @domain-08 @credit @report
  Scenario: Store Credit Report
    # As a System, I want to store credit report information
    # so that it's available for underwriting review
    Given a credit pull has been completed
    When the report is received
    Then key credit data is stored securely
    And a PDF copy is saved for reference

  @US-8-1-4 @domain-08 @credit
  Scenario: Detect Credit Freeze
    # As a System, I want to detect when an applicant has a credit freeze
    # so that they can be appropriately informed
    Given a credit pull is attempted
    When a credit freeze is detected
    Then the application is flagged as "Credit Freeze Detected"
    And the applicant is informed they need to lift the freeze
