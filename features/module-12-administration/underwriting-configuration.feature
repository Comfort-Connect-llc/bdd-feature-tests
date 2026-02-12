# Feature file generated from BRD User Stories
# Domain 20: Configuration & Administration
# Section 20.2: Underwriting Configuration

Feature: Underwriting Configuration
  Configuration & Administration

  @US-20-2-1 @domain-20
  Scenario: Configure Underwriting Criteria
    # As a Administrator, I want to configure underwriting criteria groups
    # so that approval decisions reflect business rules
    Given underwriting rules need to be updated
    When I configure criteria groups
    Then new applications are evaluated against the updated rules

  @US-20-2-2 @domain-20
  Scenario: Assign Underwriting Config Type to Company
    # As an Administrator, I want to assign an underwriting config type to a company
    # so that their applications are evaluated using the appropriate underwriting criteria
    Given a company is enrolled
    When I select an underwriting config type from available options
    Then the config type is saved to the company record
    And applications from that company use the associated underwriting rules

  @US-20-2-3 @domain-20
  Scenario: View Available Underwriting Config Types
    # As an Administrator, I want to view the list of available underwriting config types
    # so that I can select the appropriate one for a company
    Given I am configuring a company's underwriting settings
    When I view the config type options
    Then I see a list of available config types
    And each option includes a description of its purpose
