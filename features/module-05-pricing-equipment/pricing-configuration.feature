# Feature file generated from BRD User Stories
# Domain 7: Pricing & Quotes
# Section 7.2: Pricing Configuration

Feature: Pricing Configuration
  Pricing & Quotes

  @US-7-2-1 @domain-07
  Scenario: Configure Pricing Models
    # As a Administrator, I want to configure pricing models
    # so that quotes reflect current pricing strategies
    Given pricing parameters need to be updated
    When I configure pricing models
    Then new quotes use the updated pricing
    And existing committed quotes are not affected

  @US-7-2-2 @domain-07
  Scenario: View Pricing Metrics
    # As a Administrator, I want to view pricing metrics and analytics
    # so that I can understand pricing performance
    Given pricing has been in use
    When I view pricing metrics
    Then I see analytics on average deal size, common terms, and utilization
