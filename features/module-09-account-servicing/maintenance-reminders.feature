# Feature file generated from BRD User Stories
# Domain 12: Maintenance & Servicing
# Section 12.2: Maintenance Reminders

Feature: Maintenance Reminders
  Maintenance & Servicing

  @US-12-2-1 @domain-12
  Scenario: Send Scheduled Maintenance Reminder
    # As a System, I want to send scheduled maintenance reminders to homeowners
    # so that regular service is performed
    Given an account is due for scheduled maintenance
    When the reminder is triggered
    Then the homeowner receives a notification
    And can request service through the reminder

  @US-12-2-2 @domain-12
  Scenario: Configure Maintenance Schedule
    # As a Administrator, I want to configure maintenance schedules
    # so that reminders are sent at appropriate intervals
    Given maintenance schedule parameters
    When I configure the schedule
    Then reminders are triggered according to the schedule
