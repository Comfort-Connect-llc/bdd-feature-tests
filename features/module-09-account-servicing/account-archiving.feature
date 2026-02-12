# Feature file generated from BRD User Stories
# Domain 19: Account Lifecycle Management
# Section 19.4: Account Archiving

Feature: Account Archiving
  Account Lifecycle Management

  @US-19-4-1 @domain-19
  Scenario: Archive Completed Account
    # As a System, I want to archive completed accounts
    # so that they are preserved for historical reference
    Given an account has been completed, bought out, or terminated
    When archiving criteria are met
    Then the account is archived
    And historical data is preserved

  @US-19-4-2 @domain-19
  Scenario: Retrieve Archived Account
    # As a Customer Service Representative, I want to retrieve archived accounts
    # so that historical inquiries can be answered
    Given an account has been archived
    When I search for it
    Then the archived account data is retrievable
    And I can view historical information
