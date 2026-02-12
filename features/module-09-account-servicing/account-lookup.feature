# Feature file generated from BRD User Stories
# Domain 16: Customer Service & Support
# Section 16.1: Account Lookup

Feature: Account Lookup
  Customer Service & Support

  @US-16-1-1 @domain-16
  Scenario: Search for Customer Account
    # As a Customer Service Representative, I want to search for customer accounts
    # so that I can assist them
    Given I need to find a customer account
    When I search by name, email, phone, or account number
    Then matching accounts are displayed
    And I can select the account to view details

  @US-16-1-2 @domain-16
  Scenario: View Account Summary
    # As a Customer Service Representative, I want to view an account summary
    # so that I understand the customer's situation
    Given I have accessed a customer account
    When I view the summary
    Then I see key information including status, balance, payment history, and recent activity
