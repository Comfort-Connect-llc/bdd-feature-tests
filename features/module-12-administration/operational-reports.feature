# Feature file generated from BRD User Stories
# Domain 21: Reporting & Analytics
# Section 21.1: Operational Reports

Feature: Operational Reports
  Reporting & Analytics

  @US-21-1-1 @domain-21 @application @report
  Scenario: Generate Application Pipeline Report
    # As a Administrator, I want to generate pipeline reports
    # so that I can see application volume and status
    Given applications exist in the system
    When I generate the pipeline report
    Then I see applications by status, dealer, and date range
    And can export the report

  @US-21-1-2 @domain-21 @report
  Scenario: Generate Funding Report
    # As a Administrator, I want to generate funding reports
    # so that I can track payments to dealers
    Given funding has been processed
    When I generate the funding report
    Then I see all funding by date, dealer, and amount
    And can reconcile with financial systems

  @US-21-1-3 @domain-21 @report
  Scenario: Generate Delinquency Report
    # As a Administrator, I want to generate delinquency reports
    # so that I can monitor collection needs
    Given accounts have balances
    When I generate the delinquency report
    Then I see accounts by days past due
    And total amounts at risk
