# Feature file generated from BRD User Stories
# Domain 17: Promotions & Incentives
# Section 17.2: Company-Specific Promotions

Feature: Company-Specific Promotions
  Promotions & Incentives

  @US-17-2-1 @domain-17 @signature
  Scenario: Assign Promotion to Company
    # As a Administrator, I want to assign promotions to specific companies
    # so that custom offers can be provided
    Given a promotion
    When I assign it to specific companies
    Then only those companies can use the promotion
