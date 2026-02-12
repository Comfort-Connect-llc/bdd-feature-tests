# Feature file generated from BRD User Stories
# Domain 11: Billing & Payments
# Section 11.2: Billing Cycle Management

Feature: Billing Cycle Management
  Billing & Payments

  @US-11-2-1 @domain-11
  Scenario: Generate Monthly Invoice
    # As a System, I want to generate monthly invoices
    # so that homeowners know their payment obligations
    Given a billing period has ended
    When the invoice is generated
    Then it shows previous balance, current charges, payments received, and amount due
    And is delivered via preferred channel

  @US-11-2-2 @domain-11
  Scenario: View Billing History
    # As a Homeowner, I want to view my billing history
    # so that I can track my payments
    Given I have an active billing account
    When I view billing history
    Then I see all past statements, payments, and fees
    And can download statements for my records

  @US-11-2-3 @domain-11
  Scenario: Calculate Balance Due
    # As a System, I want to calculate the current balance due
    # so that accurate amounts are displayed
    Given all billing transactions
    When balance is calculated
    Then it includes past due amounts, current charges, fees, and credits applied

  @US-11-2-4 @domain-11
  Scenario: View Current Period Summary
    # As a Homeowner, I want to view my current billing period summary
    # so that I understand my payment status
    Given I have an active billing account
    When I view my current summary
    Then I see current charges, payments made, fees assessed, and balance remaining
