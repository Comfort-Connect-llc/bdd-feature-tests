# Feature file generated from BRD User Stories
# Domain 21: Reporting & Analytics
# Section 21.4: Dealer Reporting

Feature: Dealer Reporting
  Reporting & Analytics

  @US-21-4-1 @domain-21
  Scenario: View Dealer Performance Dashboard
    # As a Dealer, I want to view my performance dashboard
    # so that I can track my business with Comfort Connect
    Given I have applications and funded deals
    When I view my dashboard
    Then I see application volume, approval rates, and funding totals
    And can compare to previous periods

  @US-21-4-2 @domain-21 @application
  Scenario: View Application Status Summary
    # As a Dealer, I want to view a summary of my applications by status
    # so that I can manage my pipeline
    Given I have applications in various statuses
    When I view the summary
    Then I see counts by status
    And can drill down to individual applications
