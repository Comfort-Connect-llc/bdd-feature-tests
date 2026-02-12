# Feature file generated from BRD User Stories
# Domain 15: Notifications & Communications
# Section 15.3: In-Portal Notifications

Feature: In-Portal Notifications
  Notifications & Communications

  @US-15-3-1 @domain-15 @email
  Scenario: Display In-App Notifications
    # As a User, I want to see notifications within the portal
    # so that I am aware of important updates
    Given there are notifications for the user
    When they access the portal
    Then they see a notification indicator
    And can view notification details

  @US-15-3-2 @domain-15 @email
  Scenario: Mark Notification as Read
    # As a User, I want to mark notifications as read
    # so that I can track what I've seen
    Given I have unread notifications
    When I view or dismiss a notification
    Then it is marked as read
    And no longer appears as new
