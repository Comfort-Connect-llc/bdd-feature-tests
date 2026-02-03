# Feature file generated from BRD User Stories
# Domain 9: Income & Property Verification
# Section 9.1: Income Verification

Feature: Income Verification
  Income & Property Verification

  @US-9-1-1 @domain-09
  Scenario: Request Income Verification
    # As a System, I want to initiate income verification when required
    # so that stated income can be validated
    Given underwriting or policy requires income verification
    When verification is requested
    Then the verification process is initiated
    And the application status reflects verification in progress

  @US-9-1-2 @domain-09 @document
  Scenario: Submit Income Documentation
    # As a Homeowner, I want to submit income documentation
    # so that my income can be verified
    Given income verification is required
    When I upload documents (pay stubs, tax returns, bank statements)
    Then the documents are securely stored
    And verification review can proceed

  @US-9-1-3 @domain-09 @document
  Scenario: Review Income Documentation
    # As a Administrator, I want to review income documentation
    # so that I can verify stated income
    Given income documents have been submitted
    When I review the documentation
    Then I can verify or reject the income verification
    And I can record the verified income amount

  @US-9-1-4 @domain-09
  Scenario: Update Income Verification Status
    # As a Administrator, I want to update income verification status
    # so that the application can proceed
    Given income verification is in progress
    When I update the status (verified, failed, needs more info)
    Then the application status is updated
    And the applicant and dealer are notified
