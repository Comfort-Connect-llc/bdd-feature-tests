# Feature file generated from BRD User Stories
# Domain 3: Homeowner Prequalification
# Section 3.2: Prequalification Application

Feature: Prequalification Application
  Homeowner Prequalification

  @US-3-2-1 @domain-03 @credit
  Scenario: Provide Consent for Credit Check
    # As a Homeowner, I want to provide consent for a soft credit check
    # so that my financing eligibility can be determined without impacting my credit score
    Given I am completing a prequalification
    When I review and accept the credit check disclosure
    Then my consent is recorded with a timestamp

  @US-3-2-2 @domain-03
  Scenario: Submit Prequalification Information
    # As a Homeowner, I want to submit my personal and financial information
    # so that my financing eligibility can be evaluated
    Given I have consented to a credit check
    When I provide my information (name, DOB, SSN, address, income)
    Then my prequalification is submitted for evaluation

  @US-3-2-3 @domain-03
  Scenario: Add Co-Applicant to Prequalification
    # As a Homeowner, I want to add a co-applicant to my prequalification
    # so that our combined financial profile can be evaluated
    Given I am completing a prequalification
    When I choose to add a co-applicant and provide their information
    Then both applicants' information is submitted together
