# Feature file for Momnt Integration Webhooks
# Module 13: Integrations
# Section 13.6: Momnt — Charge and Readiness Webhooks

Feature: Momnt Charge and Readiness Webhooks
  Integrations — Receiving real-time status updates from Momnt for charge requests
  and homeowner account readiness

  @US-13-6-1 @module-13 @momnt @webhook @charge-status
  Scenario: Receive Momnt Charge Status Webhooks
    # As a System, I want to receive webhook notifications from Momnt when a charge
    # request status changes, so that the platform reflects real-time charge and
    # funding status without manual polling
    Given a charge request has been submitted to Momnt
    When Momnt sends a webhook for a charge status change such as Pending Homeowner Approval, Approved, Funded, or Rejected
    Then the platform processes the webhook and updates the application charge status accordingly
    And the status change is logged in the application timeline with timestamp and details
    And relevant parties including dealer and administrator are notified of significant status changes such as approval, funding, or rejection
    And if the webhook indicates funding is complete the funded amount and date are recorded on the account
    And the webhook endpoint validates the request authenticity using Momnt credentials or signature
    And failed webhook processing is retried according to configured retry logic and logged for manual review

  @US-13-6-2 @module-13 @momnt @webhook @readiness
  Scenario: Receive Momnt Account Readiness Status Webhooks
    # As a System, I want to receive webhook notifications from Momnt regarding the
    # homeowner's account readiness status (Welcome Call and portal setup), so that
    # dealers and administrators have visibility into potential charge request blockers
    Given a homeowner has an active Momnt loan application
    When Momnt sends a webhook for a readiness status change such as Welcome Call scheduled, attempted, completed, or failed and Portal Setup complete or incomplete
    Then the platform processes the webhook and updates the Momnt Account Readiness status on the application
    And the readiness status is visible to dealers on the charge request screen
    And the readiness status is visible to administrators on the application detail view
    And if the Welcome Call status changes to Failed an alert is generated for the assigned administrator
    And readiness status history is maintained for audit and reporting purposes
    And the webhook endpoint validates the request authenticity using Momnt credentials or signature
