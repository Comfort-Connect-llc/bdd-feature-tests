# Feature file generated from BRD User Stories
# Domain 11: Billing & Payments
# Section 11.4: Fees & Delinquency

Feature: Fees & Delinquency
  Billing & Payments

  @US-11-4-1 @domain-11
  Scenario: Assess Late Fee
    # As a System, I want to automatically assess late fees when payments are overdue
    # so that collection policies are enforced
    Given a payment is past due beyond the grace period
    When the late fee is assessed
    Then the fee amount is added to the balance
    And the homeowner is notified

  @US-11-4-2 @domain-11
  Scenario: Calculate Days Past Due
    # As a System, I want to calculate days past due
    # so that delinquency status is tracked
    Given a balance is past due
    When days past due is calculated
    Then accurate delinquency aging is determined (30/60/90+ days)

  @US-11-4-3 @domain-11
  Scenario: Initiate Dunning Communications
    # As a System, I want to send dunning communications to delinquent accounts
    # so that past due balances are collected
    Given an account has a past due balance
    When dunning rules are triggered
    Then appropriate reminder communications are sent
    And escalation occurs based on days past due

  @US-11-4-4 @domain-11
  Scenario: Assess Statement Fee
    # As a System, I want to assess statement fees when applicable
    # so that paper statement costs are recovered
    Given an account receives paper statements
    When the billing cycle ends
    Then the statement fee is assessed
    And appears on the next invoice

  @US-11-4-5 @domain-11 @credit
  Scenario: Apply Credit to Account
    # As a Administrator, I want to apply a credit to an account
    # so that adjustments and goodwill can be accommodated
    Given a credit is warranted
    When I apply the credit
    Then the account balance is reduced
    And the credit is recorded with a reason
