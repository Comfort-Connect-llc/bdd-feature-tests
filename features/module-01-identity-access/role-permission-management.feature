# Feature file generated from BRD User Stories
# Domain 2: User & Profile Management
# Section 2.2: Role & Permission Management

Feature: Role & Permission Management
  User & Profile Management

  @US-2-2-1 @domain-02 @signature
  Scenario: Assign Role to User
    # As a Administrator, I want to assign roles to users
    # so that they have appropriate access to platform features
    Given a registered user
    When I assign a role (e.g., Sales Rep, Manager, Admin)
    Then the user inherits the permissions associated with that role

  @US-2-2-2 @domain-02
  Scenario: Configure Role Permissions
    # As a Administrator, I want to configure what permissions are associated with each role
    # so that access control is properly managed
    Given a defined role
    When I add or remove entitlements from the role
    Then all users with that role immediately reflect the permission changes

  @US-2-2-3 @domain-02
  Scenario: Manage Partner Access for User
    # As a Administrator, I want to control which financing partners a user can access
    # so that they only see relevant options
    Given a dealer user
    When I configure their partner access
    Then the user only sees applications and options for their enabled partners
