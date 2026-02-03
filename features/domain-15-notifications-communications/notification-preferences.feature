# Feature file generated from BRD User Stories
# Domain 15: Notifications & Communications
# Section 15.5: Notification Preferences

Feature: Notification Preferences
  Notifications & Communications

  @US-15-5-1 @domain-15 @email
  Scenario: Configure Notification Preferences
    # As a User, I want to configure my notification preferences
    # so that I receive notifications how I prefer
    Given I am in my profile settings
    When I configure notification preferences
    Then I can enable/disable email, SMS, and in-app notifications
    And my preferences are applied to future notifications
