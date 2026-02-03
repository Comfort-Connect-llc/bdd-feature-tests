# Feature file generated from BRD User Stories
# Domain 5: Loan Partner Origination
# Section 5.2: Thrive Loan Flow

Feature: Thrive Loan Flow
  Loan Partner Origination

  @US-5-2-1 @domain-05 @application
  Scenario: Initiate Thrive Loan Application
    # As a System, I want to submit an application to Thrive when selected
    # so that the homeowner can obtain Thrive financing
    Given a homeowner has selected a Thrive loan offer
    When the Thrive application is initiated
    Then the applicant information is submitted to Thrive

  @US-5-2-2 @domain-05 @application
  Scenario: Submit Thrive Final Application
    # As a Homeowner, I want to complete my Thrive loan application
    # so that my loan can be processed
    Given I am in the Thrive application flow
    When I complete the required steps
    Then my application is submitted for review

  @US-5-2-3 @domain-05
  Scenario: Receive Thrive Loan Decision
    # As a Homeowner, I want to receive my Thrive loan decision
    # so that I can proceed with installation
    Given my Thrive application has been reviewed
    When a decision is rendered
    Then I see my approval status and terms
