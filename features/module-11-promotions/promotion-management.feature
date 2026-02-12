# Feature file generated from BRD User Stories
# Domain 17: Promotions & Incentives
# Section 17.1: Promotion Management

Feature: Promotion Management
  Promotions & Incentives

  @US-17-1-1 @domain-17
  Scenario: Create Promotion
    # As a Administrator, I want to create promotional offers
    # so that dealers can offer special terms to homeowners
    Given promotion parameters (discount, special terms, dates)
    When I create the promotion
    Then the promotion is active and available for use
    And has defined start and end dates

  @US-17-1-2 @domain-17
  Scenario: Configure Promotion Eligibility
    # As a Administrator, I want to configure promotion eligibility rules
    # so that promotions are applied correctly
    Given a promotion
    When I configure eligibility (company, region, product, amount range)
    Then only eligible applications can use the promotion

  @US-17-1-3 @domain-17
  Scenario: Apply Promotion to Account
    # As a Dealer, I want to apply a promotion to a customer's account
    # so that they receive special terms
    Given a valid promotion exists
    When I apply it to an eligible application
    Then the promotional terms are applied
    And reflected in the quote and agreement

  @US-17-1-4 @domain-17
  Scenario: Validate Promotion
    # As a System, I want to validate promotions before applying
    # so that only valid promotions are used
    Given a promotion code or selection
    When validation is performed
    Then the system confirms the promotion is active and the account is eligible
    And Or returns an error explaining why it cannot be applied

  @US-17-1-5 @domain-17
  Scenario: View Active Promotions
    # As a Dealer, I want to view active promotions
    # so that I know what offers are available for customers
    Given promotions are configured
    When I view available promotions
    Then I see all promotions I can offer
    And their terms and expiration dates
