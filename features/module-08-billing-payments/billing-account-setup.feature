# Feature file generated from BRD User Stories
# Domain 11: Billing & Payments
# Section 11.1: Billing Account Setup

Feature: Billing Account Setup
  Billing & Payments

  @US-11-1-1 @domain-11
  Scenario: Create Billing Account
    # As a System, I want to create a billing account when a Premier enrollment is activated
    # so that billing can begin
    Given a Premier enrollment has been completed
    When the billing account is created
    Then the billing schedule is established
    And the first billing date is set based on installation date

  @US-11-1-2 @domain-11 @payment
  Scenario: Set Up Payment Method
    # As a Homeowner, I want to set up my payment method
    # so that I can make payments conveniently
    Given I have an active billing account
    When I add a payment method (card, bank account)
    Then the payment method is securely stored
    And I can use it for payments

  @US-11-1-3 @domain-11
  Scenario: Enable Autopay
    # As a Homeowner, I want to enable automatic payments
    # so that my payments are made on time without manual action
    Given I have a stored payment method
    When I enable autopay
    Then my payments are automatically processed on the due date
    And I receive confirmation of each payment

  @US-11-1-4 @domain-11
  Scenario: Disable Autopay
    # As a Homeowner, I want to disable automatic payments
    # so that I can control when payments are made
    Given I have autopay enabled
    When I disable autopay
    Then automatic payments stop
    And I am responsible for making manual payments
