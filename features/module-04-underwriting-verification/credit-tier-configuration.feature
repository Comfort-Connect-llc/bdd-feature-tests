# Feature file for Credit Tier Configuration
# Module 4: Underwriting & Verification
# Section: Credit Tier and Risk-Based Pricing
# Priority: HIGH - Gap identified in audit

Feature: Credit Tier Configuration
  Credit tier management and risk-based pricing rules

  Background:
    Given I am an authenticated Administrator
    And I have access to underwriting configuration

  @US-4-6-1 @module-04 @credit-tier @configuration
  Scenario: Configure Credit Tiers
    # As an Administrator, I want to configure credit score tiers
    # so that appropriate pricing is applied based on creditworthiness
    Given I am configuring credit tiers
    When I define credit tiers with:
      | Tier Name    | Score Min | Score Max | Risk Level | Max Approval |
      | Super Prime  | 760       | 850       | 1          | $100,000     |
      | Prime        | 700       | 759       | 2          | $75,000      |
      | Near Prime   | 660       | 699       | 3          | $50,000      |
      | Sub Prime    | 580       | 659       | 4          | $25,000      |
    Then the credit tiers are saved
    And applications are classified into tiers based on credit score

  @US-4-6-2 @module-04 @credit-tier @pricing
  Scenario: Assign Pricing by Credit Tier
    # As a System, I want to assign pricing based on credit tier
    # so that risk-appropriate rates are offered
    Given credit tiers are configured
    When an applicant's credit score is evaluated
    Then the applicant is assigned to the appropriate tier
    And available rates reflect the tier-based pricing
    And the maximum approval amount is based on tier limits

  @US-4-6-3 @module-04 @credit-tier @override
  Scenario: Override Credit Tier Assignment
    # As an Underwriter, I want to override credit tier assignment
    # so that special circumstances can be accommodated
    Given an applicant has been assigned to a credit tier
    When I override the tier assignment with justification:
      | Original Tier     | Sub Prime                |
      | Override Tier     | Near Prime               |
      | Justification     | Recent credit event resolved |
      | Approval Required | Yes                      |
    Then the override is recorded
    And the applicant receives pricing based on the override tier
    And the override is visible in the audit trail

  @US-4-6-4 @module-04 @underwriting @dti-limits
  Scenario: Configure Debt-to-Income Limits by Tier
    # As an Administrator, I want to configure DTI limits by credit tier
    # so that appropriate debt burden limits are applied
    Given credit tiers are configured
    When I set DTI limits by tier:
      | Tier Name    | Max Front-End DTI | Max Back-End DTI |
      | Super Prime  | 45%               | 55%              |
      | Prime        | 43%               | 50%              |
      | Near Prime   | 40%               | 45%              |
      | Sub Prime    | 35%               | 40%              |
    Then DTI limits are applied during underwriting
    And applicants exceeding limits are flagged for review
