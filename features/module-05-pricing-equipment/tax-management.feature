# Feature file generated from BRD User Stories
# Domain 7: Pricing & Quotes
# Section 7.3: Tax Management

Feature: Tax Management
  Pricing & Quotes

  @US-7-3-1 @domain-07
  Scenario: Retrieve Tax Rate by Location
    # As a System, I want to retrieve the applicable tax rate for an installation location
    # so that quotes and billing are accurate
    Given an installation address
    When the tax rate is requested
    Then the correct state/local tax rate is returned

  @US-7-3-2 @domain-07
  Scenario: Handle Missing Tax Rate
    # As a System, I want to alert when a tax rate cannot be found
    # so that the issue can be resolved
    Given an installation address
    When no tax rate is found for the location
    Then the application status indicates "Missing Tax Rate"
    And the dealer is prompted to verify the address
