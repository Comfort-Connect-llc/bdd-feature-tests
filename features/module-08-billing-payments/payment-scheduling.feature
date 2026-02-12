# Feature file generated from BRD User Stories
# Domain 11: Billing & Payments
# Section 11.5: Payment Scheduling

Feature: Payment Scheduling
  Billing & Payments

  @US-11-5-1 @domain-11 @payment
  Scenario: Schedule Future Payment
    # As a Homeowner, I want to schedule a payment for a future date
    # so that I can plan my payments
    Given I have a balance due
    When I schedule a payment for a future date
    Then the payment is queued for processing on that date
    And I receive confirmation of the scheduled payment

  @US-11-5-2 @domain-11 @payment
  Scenario: Cancel Scheduled Payment
    # As a Homeowner, I want to cancel a scheduled payment
    # so that I can change my payment plans
    Given I have a scheduled payment
    When I cancel it before the processing date
    Then the payment is cancelled
    And I am notified of the cancellation
