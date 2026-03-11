# Feature file for Momnt Loan Visibility on Account
# Module 09: Account Servicing
# Section 9.18: Momnt Loan Visibility

Feature: Momnt Account Visibility
  Account Servicing — Momnt-specific loan visibility for administrators and CSRs

  @US-9-18-1 @module-09 @momnt @readiness
  Scenario: View Momnt Account Readiness Status
    # As an Administrator, I want to view the Momnt Account Readiness status
    # (Welcome Call and Portal Setup) on a homeowner's account, so that I can
    # identify and troubleshoot potential charge request blockers before they cause delays
    Given a homeowner has an active Momnt loan application
    When I view the account detail
    Then I see a Momnt Account Readiness section showing the current Welcome Call status as Scheduled, Attempted, Completed, or Failed
    And I see the Portal Setup status as Incomplete or Complete
    And I see the date and time of the most recent status update for each readiness indicator
    And if either readiness indicator reflects a blocker it is visually highlighted as a warning
    And I can view the readiness status history showing all status changes with timestamps
    And the readiness data is sourced from Momnt webhooks

  @US-9-18-2 @module-09 @momnt @timeline @funding
  Scenario: View Momnt Charge and Funding Timeline
    # As an Administrator, I want to view a consolidated timeline of Momnt charge
    # request and funding events on a homeowner's account, so that I have full
    # visibility into the financing lifecycle and can answer dealer or homeowner inquiries
    Given a homeowner has an active or completed Momnt loan
    When I view the account detail
    Then I see a Momnt Financing Timeline showing key events in chronological order
    And the timeline includes loan acceptance date, installation date entered, charge request initiated or scheduled date, homeowner charge approval date, funding date, and payment amount
    And each event shows the date, time, and relevant details such as charge amount, initiating user, and approval status
    And if a charge request is currently scheduled for a future date the scheduled date is displayed with the ability to view or modify the schedule subject to permissions
    And if a charge was rejected the rejection reason and any subsequent retry attempts are visible
    And the timeline data is sourced from platform records and Momnt webhooks
