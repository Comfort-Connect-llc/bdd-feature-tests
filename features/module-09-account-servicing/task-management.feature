# Feature file generated from BRD User Stories
# Domain 16: Customer Service & Support
# Section 16.2: Task Management

Feature: Task Management
  Customer Service & Support

  @US-16-2-1 @domain-16
  Scenario: Create Service Task
    # As a Customer Service Representative, I want to create a task for follow-up
    # so that issues are tracked to resolution
    Given a customer issue requires follow-up
    When I create a task
    Then the task is associated with the account
    And can be assigned and tracked

  @US-16-2-2 @domain-16 @signature
  Scenario: Assign Task to Team Member
    # As a Customer Service Representative, I want to assign tasks to team members
    # so that work is distributed appropriately
    Given a task needs assignment
    When I assign it to a team member
    Then the assignee is notified
    And the task appears in their queue

  @US-16-2-3 @domain-16
  Scenario: Complete Service Task
    # As a Customer Service Representative, I want to mark tasks as complete
    # so that progress is tracked
    Given a task has been resolved
    When I mark it complete with notes
    Then the task is closed
    And the resolution is recorded
