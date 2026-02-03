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
  Scenario: Set Company Underwriting Rules
    # As a Administrator, I want to set company-specific underwriting rules
    # so that different dealers have customized criteria
    Given a company needs custom rules
    When I configure their underwriting settings
    Then their applications use the custom criteria
