# Feature file generated from BRD User Stories
# Domain 2: User & Profile Management
# Section 2.3: Profile Management

Feature: Profile Management
  User & Profile Management

  @US-2-3-1 @domain-02
  Scenario: Update User Profile
    # As a User, I want to update my profile information
    # so that my contact details remain current
    Given I am logged in
    When I update my profile (name, phone, email preferences)
    Then my changes are saved

  @US-2-3-2 @domain-02
  Scenario: Impersonate User for Support
    # As a Customer Service Representative, I want to view the platform as a specific user sees it
    # so that I can assist them
    Given I have impersonation privileges
    When I impersonate a user
    Then I see the platform exactly as they see it
    And my actions are logged as impersonation

  @US-2-3-3 @domain-02
  Scenario: Deactivate User Account
    # As a Administrator, I want to deactivate a user account
    # so that former employees no longer have platform access
    Given an active user account
    When I deactivate the account
    Then the user can no longer log in
    And their historical activity is preserved
