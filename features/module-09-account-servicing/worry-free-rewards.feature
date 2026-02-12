# Feature file generated from BRD User Stories
# Domain 12: Maintenance & Servicing
# Section 12.4: Worry-Free Rewards

Feature: Worry-Free Rewards
  Maintenance & Servicing

  @US-12-4-1 @domain-12
  Scenario: Enroll in Worry-Free Rewards
    # As a Homeowner, I want to enroll in the Worry-Free Rewards program
    # so that I can earn benefits for on-time payments
    Given I have an active Premier account
    When I enroll in Worry-Free Rewards
    Then my enrollment is recorded
    And I begin earning rewards based on payment history
