# Feature file generated from BRD User Stories
# Domain 13: Equipment Management
# Section 13.2: Equipment Catalog

Feature: Equipment Catalog
  Equipment Management

  @US-13-2-1 @domain-13
  Scenario: Manage Equipment Catalog
    # As a Administrator, I want to manage the equipment catalog
    # so that dealers have accurate equipment information
    Given equipment data
    When I add or update the catalog
    Then the equipment is available for lookup
    And specifications are accurate
