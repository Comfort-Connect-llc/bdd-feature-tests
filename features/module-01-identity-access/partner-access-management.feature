# Feature file for Partner Access Management
# Module 1: Identity & Access
# Section: Partner Access Configuration
# Priority: MEDIUM - Gap identified in audit

Feature: Partner Access Management
  User-level partner access configuration and permissions

  Background:
    Given I am an authenticated Administrator
    And I have access to user management

  @US-1-4-1 @module-01 @partner-access @configuration
  Scenario: Configure Partner Access for User
    # As an Administrator, I want to configure which financing partners a user can access
    # so that they only see relevant financing options
    Given a registered dealer user exists
    When I configure their partner access with:
      | Partner Name   | Access Enabled | Role         |
      | Premier        | Yes            | Full Access  |
      | Momnt          | Yes            | Sales Rep    |
      | Microf         | Yes            | Full Access  |
      | Breeze         | No             | None         |
      | Thrive         | Yes            | View Only    |
    Then the user's partner access is updated
    And they only see applications for enabled partners
    And their permissions reflect the assigned roles

  @US-1-4-2 @module-01 @partner-access @momnt-role
  Scenario: Assign Momnt-Specific Role
    # As an Administrator, I want to assign Momnt-specific roles
    # so that users have appropriate access within Momnt
    Given a user has Momnt partner access enabled
    When I assign a Momnt role:
      | Momnt Role     | Admin, Salesmanager, or Salesrep |
      | Assigned Role  | Salesmanager                      |
    Then the user's Momnt role is updated
    And they can perform actions allowed for Salesmanagers

  @US-1-4-3 @module-01 @partner-access @prequal
  Scenario: Enable Prequalification Access
    # As an Administrator, I want to enable prequalification access for users
    # so that they can send prequalification invitations
    Given a registered dealer user exists
    When I enable prequalification access
    Then the user can send prequalification invitations
    And they can view prequalification results

  @US-1-4-4 @module-01 @partner-access @modular
  Scenario: Enable Modular Pricing Access
    # As an Administrator, I want to enable modular pricing for users
    # so that they can offer modular financing options
    Given a user has standard access
    When I enable modular pricing access
    Then the user sees modular pricing options in quotes
    And they can create modular financing applications

  @US-1-4-5 @module-01 @partner-access @promo
  Scenario: Assign Promotional Access
    # As an Administrator, I want to assign promotional access to users
    # so that they can offer specific promotions
    Given a registered dealer user exists
    When I assign promotional access with:
      | Promotion ID   | Promotion Name        | Active |
      | promo-001      | Spring Sale 2026      | Yes    |
      | promo-002      | No Interest 12 Mo     | Yes    |
    Then the user can apply these promotions to applications
    And the promotions appear in their available options
