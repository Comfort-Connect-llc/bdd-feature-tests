# Feature file generated from BRD User Stories
# Domain 16: Customer Service & Support
# Section 16.3: Notes & Comments

Feature: Notes & Comments
  Customer Service & Support

  @US-16-3-1 @domain-16
  Scenario: Add Note to Account
    # As a Customer Service Representative, I want to add notes to an account
    # so that interaction history is documented
    Given I am viewing a customer account
    When I add a note
    Then the note is saved with timestamp and my name
    And is visible to other authorized users

  @US-16-3-2 @domain-16
  Scenario: View Account Notes
    # As a Customer Service Representative, I want to view all notes on an account
    # so that I understand previous interactions
    Given an account has notes
    When I view notes
    Then I see all notes in chronological order
    And can filter by date or type
