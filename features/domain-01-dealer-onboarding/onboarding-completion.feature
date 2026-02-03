# Feature file generated from BRD User Stories
# Domain 1: Dealer/Contractor Onboarding
# Section 1.5: Onboarding Completion

Feature: Onboarding Completion
  Dealer/Contractor Onboarding

  @US-1-5-1 @domain-01
  Scenario: Complete Merchant Onboarding
    # As a Dealer, I want to receive confirmation when my onboarding is complete
    # so that I know I can begin using the platform
    Given all onboarding steps have been completed
    When my onboarding is finalized
    Then I receive a welcome email with login instructions
    And my account is activated for full platform access

  @US-1-5-2 @domain-01 @application
  Scenario: Decline Merchant Application
    # As a Underwriter, I want to decline a merchant application
    # so that unqualified dealers are not enrolled
    Given I have reviewed a merchant application
    When I decline the application
    Then the dealer is notified of the decision
    And the application status changes to "Declined"

  @US-1-5-3 @domain-01
  Scenario: Resend Onboarding Invitation
    # As a Administrator, I want to resend an onboarding invitation to a dealer
    # so that they can continue their application
    Given a dealer has an incomplete application
    When I resend the invitation
    Then the dealer receives a new email with a fresh link
    And their previous progress is preserved

  @US-1-5-4 @domain-01
  Scenario: Configure Dealer Reimbursement Rates
    # As a Administrator, I want to configure reimbursement rates for a dealer
    # so that they are compensated correctly for installations
    Given an approved dealer
    When I configure their reimbursement rates
    Then the rates are saved and applied to future funding calculations
