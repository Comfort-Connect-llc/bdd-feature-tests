# Feature file generated from BRD User Stories
# Domain 8: Credit & Underwriting
# Section 8.2: Automated Underwriting

Feature: Automated Underwriting
  Credit & Underwriting

  @US-8-2-1 @domain-08 @application
  Scenario: Evaluate Application Against Underwriting Rules
    # As a System, I want to evaluate applications against configured underwriting rules
    # so that consistent decisions are made
    Given an application with credit data
    When underwriting evaluation runs
    Then the application is checked against criteria including FICO score, DTI, charge-offs, and delinquencies
    And a decision (approve, decline, review) is rendered

  @US-8-2-2 @domain-08
  Scenario: Apply Company-Specific Underwriting Rules
    # As a System, I want to apply company-specific underwriting configurations
    # so that different dealers can have customized criteria
    Given a company has custom underwriting configuration
    When an application from that company is evaluated
    Then the company-specific rules take precedence

  @US-8-2-3 @domain-08
  Scenario: Calculate Debt-to-Income Ratio
    # As a System, I want to calculate the debt-to-income ratio
    # so that it can be used in underwriting decisions
    Given applicant income and credit data showing monthly obligations
    When DTI is calculated
    Then total monthly debt / monthly income is computed
    And the result is compared against DTI thresholds

  @US-8-2-4 @domain-08 @approval
  Scenario: Determine Maximum Approval Amount
    # As a System, I want to calculate the maximum approval amount
    # so that applicants know their spending limit
    Given underwriting criteria and applicant profile
    When maximum amount is calculated
    Then the amount reflects income-based and credit-based limits
    And the lowest applicable limit is used

  @US-8-2-5 @domain-08
  Scenario: Apply Decision Hierarchy
    # As a System, I want to apply decision hierarchy when multiple underwriting rules match
    # so that the most restrictive decision prevails
    Given an application matches multiple underwriting criteria groups
    When decisions are evaluated
    Then "reject" takes precedence over "review"
    And "review" takes precedence over "approved"
    And if no adverse groups match, the application is approved
