# Feature file for Rate Sheet Configuration
# Module 12: Administration
# Section: Rate Sheet Management
# Priority: HIGH - Critical gap identified in audit

Feature: Rate Sheet Configuration
  Partner rate sheet management for financing products

  Background:
    Given I am an authenticated Administrator
    And I have access to rate configuration

  @US-12-8-1 @module-12 @rate-sheet @configuration
  Scenario: Configure Partner Rate Sheet
    # As an Administrator, I want to configure rate sheets for financing partners
    # so that dealers can offer competitive financing options to homeowners
    Given I am configuring rates for a financing partner
    When I create a rate sheet with the following attributes:
      | APR                  | 9.99%                    |
      | Term                 | 120 months               |
      | Dealer Fee           | 2.5%                     |
      | Maximum Approval     | $75,000                  |
      | Credit Tier          | Prime                    |
      | Product Type         | Standard                 |
      | Product Name         | Home Comfort Loan        |
      | Category             | Consumer Loan            |
    Then the rate sheet is saved and active
    And dealers enrolled with this partner can access these rates

  @US-12-8-2 @module-12 @rate-sheet @eligibility
  Scenario: Configure Rate Eligibility Rules
    # As an Administrator, I want to set eligibility criteria for rate availability
    # so that appropriate rates are offered based on customer profile
    Given a rate sheet exists for a partner
    When I configure eligibility rules with:
      | Credit Score Minimum | 680                      |
      | Credit Score Maximum | 850                      |
      | Risk Range Low       | 1                        |
      | Risk Range High      | 3                        |
      | Minimum Loan Amount  | $5,000                   |
      | Maximum Loan Amount  | $75,000                  |
    Then the eligibility rules are saved to the rate sheet
    And only qualifying applications receive this rate

  @US-12-8-3 @module-12 @rate-sheet @prime-rates
  Scenario: Designate Prime vs Non-Prime Rates
    # As an Administrator, I want to classify rates as prime or non-prime
    # so that risk-appropriate pricing is applied
    Given multiple rate sheets exist
    When I designate a rate sheet as prime
    Then the rate is marked with prime status
    And prime rates are prioritized for qualified applicants

  @US-12-8-4 @module-12 @rate-sheet @promotional
  Scenario: Configure Promotional Rate Terms
    # As an Administrator, I want to configure promotional periods for rates
    # so that special financing offers can be provided
    Given I am creating a promotional rate
    When I configure promotional terms with:
      | Promotional Period     | 12 months               |
      | Interest Only Period   | 6 months                |
      | Amortization Term      | 120 months              |
      | Promotional APR        | 0.00%                   |
      | Standard APR           | 12.99%                  |
    Then the promotional rate is created
    And the promotional terms are displayed to customers

  @US-12-8-5 @module-12 @rate-sheet @activation
  Scenario: Activate or Deactivate Rate Sheet
    # As an Administrator, I want to activate or deactivate rate sheets
    # so that I can control which rates are available
    Given a rate sheet exists
    When I deactivate the rate sheet
    Then the rate is no longer offered to new applications
    And existing applications with this rate are not affected

  @US-12-8-6 @module-12 @rate-sheet @audit
  Scenario: View Rate Sheet Change History
    # As an Administrator, I want to view the audit trail for rate changes
    # so that I can track who made changes and when
    Given a rate sheet has been modified
    When I view the rate sheet audit trail
    Then I see all changes with timestamps and user information
    And I can identify what was changed
