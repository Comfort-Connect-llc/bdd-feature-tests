# Feature file for Company Group Management
# Module 2: Dealer Management
# Section: Company Groups & Hierarchy
# Priority: MEDIUM - Gap identified in audit

Feature: Company Group Management
  Dealer hierarchy and group configuration

  Background:
    Given I am an authenticated Administrator
    And I have access to company management

  @US-2-9-1 @module-02 @company-group @hierarchy
  Scenario: Create Company Group
    # As an Administrator, I want to create company groups
    # so that related dealers can be managed together
    Given I need to organize multiple dealer locations
    When I create a company group with:
      | Group Name           | ABC HVAC Enterprise      |
      | Group Type           | Parent Company           |
      | Primary Contact      | John Smith               |
      | Contact Email        | john@abchvac.com         |
      | Contact Phone        | (555) 123-4567           |
    Then the company group is created
    And dealers can be assigned to this group

  @US-2-9-2 @module-02 @company-group @assignment
  Scenario: Assign Dealer to Company Group
    # As an Administrator, I want to assign dealers to company groups
    # so that they share common settings and reporting
    Given a company group exists
    And a dealer is not assigned to any group
    When I assign the dealer to the company group
    Then the dealer is associated with the group
    And the dealer inherits group-level configurations

  @US-2-9-3 @module-02 @company-group @settings
  Scenario: Configure Group-Level Settings
    # As an Administrator, I want to configure settings at the group level
    # so that all dealers in the group share common configurations
    Given a company group has assigned dealers
    When I configure group-level settings including:
      | Partner Access       | Premier, Momnt, Microf   |
      | Pricing Configuration| Standard                 |
      | Impersonation Access | Enabled                  |
    Then all dealers in the group receive these settings
    And individual dealer settings can override group settings

  @US-2-9-4 @module-02 @company-group @reporting
  Scenario: View Group-Level Reporting
    # As an Administrator, I want to view reports at the group level
    # so that I can analyze performance across related dealers
    Given a company group has multiple dealers with activity
    When I generate a group-level report
    Then I see aggregated metrics across all group dealers
    And can drill down to individual dealer performance

  @US-2-9-5 @module-02 @company-group @removal
  Scenario: Remove Dealer from Company Group
    # As an Administrator, I want to remove a dealer from a company group
    # so that they operate independently
    Given a dealer is assigned to a company group
    When I remove the dealer from the group
    Then the dealer is no longer associated with the group
    And group-level settings no longer apply to the dealer
