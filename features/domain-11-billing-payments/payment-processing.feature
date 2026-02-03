# Feature file generated from BRD User Stories
# Domain 11: Billing & Payments
# Section 11.3: Payment Processing

Feature: Payment Processing
  Billing & Payments

  @US-11-3-1 @domain-11 @payment
  Scenario: Make One-Time Payment
    # As a Homeowner, I want to make a one-time payment
    # so that I can pay my balance
    Given I have a balance due
    When I submit a payment
    Then the payment is processed
    And I receive a receipt
    And my balance is updated

  @US-11-3-2 @domain-11 @payment
  Scenario: Process Autopay Payment
    # As a System, I want to automatically process scheduled payments
    # so that enrolled homeowners' payments are collected
    Given autopay is enabled and payment is due
    When the scheduled date arrives
    Then the payment is processed using the stored payment method
    And the homeowner is notified of success or failure

  @US-11-3-3 @domain-11 @payment
  Scenario: Generate Payment Receipt
    # As a System, I want to generate receipts for payments
    # so that homeowners have proof of payment
    Given a payment has been processed
    When the receipt is generated
    Then it includes payment amount, date, and confirmation number
    And is available for download and sent via email

  @US-11-3-4 @domain-11 @payment
  Scenario: Process Payment Refund
    # As a Administrator, I want to process payment refunds
    # so that overpayments or corrections can be handled
    Given a refund is warranted
    When I process the refund
    Then the refund is issued to the original payment method
    And the account balance is adjusted
    And the homeowner is notified

  @US-11-3-5 @domain-11 @payment
  Scenario: Handle Payment Failure
    # As a System, I want to handle payment failures appropriately
    # so that collection efforts can proceed
    Given a payment attempt has failed
    When the failure is recorded
    Then the reason is captured (insufficient funds, expired card, etc.)
    And the homeowner is notified
    And retry logic is applied as configured

  @US-11-3-6 @domain-11 @payment
  Scenario: Process Payment Reversal
    # As a Administrator, I want to reverse a payment
    # so that erroneous payments can be corrected
    Given a payment needs to be reversed
    When I process the reversal
    Then the payment is reversed
    And the account balance is adjusted
    And the reversal is recorded for audit
