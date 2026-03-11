# Feature file generated from BRD User Stories
# Domain 14: Installation & Funding
# Section 14.4: Partner Funding

Feature: Partner Funding
  Installation & Funding

  @US-7-4-1 @module-07 @momnt @charge-request
  Scenario: Initiate Momnt Charge Request
    # As a Dealer, I want to initiate a charge request to Momnt after a homeowner
    # accepts a loan offer, so that the loan funds are disbursed and I receive
    # payment for the installation
    Given a homeowner has accepted a Momnt loan offer and the dealer has entered a planned installation date
    When the dealer selects "Initiate Charge" from the application
    Then the dealer can review and optionally adjust the charge amount within the approved loan amount
    And the platform submits the charge request to Momnt via API
    And the status changes to "Charge Request Initiated — Awaiting Homeowner Approval"
    And the dealer is shown the Momnt Account Readiness status including Welcome Call status and Portal Setup status as informational context
    And the dealer is informed that the homeowner will receive a text from Momnt to approve the charge
    And the charge request is logged with timestamp, charge amount, and initiating dealer user
    And if Momnt rejects the charge request the rejection reason is displayed to the dealer and the status reflects the blocker

  @US-7-4-6 @module-07 @momnt @charge-request @scheduling
  Scenario: Schedule Momnt Charge Request for Future Date
    # As a Dealer, I want to schedule a Momnt charge request for a future date
    # instead of initiating it immediately, so that I can align the charge with the
    # planned installation timeline when installation is not imminent
    Given a homeowner has accepted a Momnt loan offer and the dealer has entered a planned installation date
    When the dealer selects "Schedule Charge" instead of "Initiate Charge"
    Then the dealer can select a future date for the charge request to be submitted
    And the platform recommends a date based on the planned installation date and configured timing rules
    And the scheduled charge request is displayed on the application with the scheduled date
    And the dealer can modify or cancel the scheduled charge before it is submitted
    And the platform automatically submits the charge request to Momnt on the scheduled date
    And if the scheduled charge submission fails the dealer and administrator are notified and the charge is flagged for manual action

  @US-7-4-7 @module-07 @momnt @charge-request @tracking
  Scenario: Track Momnt Charge Approval Status
    # As a Dealer, I want to see the real-time status of a Momnt charge request
    # after it has been initiated, so that I know when the homeowner has approved
    # the charge and when I can expect payment
    Given a charge request has been initiated or scheduled for a Momnt loan
    When the dealer views the application
    Then the dealer sees the current charge status including Initiated, Pending Homeowner Approval, Approved, Funded, or Rejected
    And the dealer sees the Momnt Account Readiness card showing Welcome Call status and Portal Setup status
    And if the charge is approved the dealer sees the estimated payment timeline
    And if the charge is rejected the dealer sees the rejection reason and can re-initiate a new charge request
    And the charge status updates are received via Momnt webhooks and reflected in near real-time

  @US-7-4-8 @module-07 @funding @attribution @cross-lender
  Scenario: Log Requesting User on All Funding Submissions
    # As a Platform, I want to record which user initiated every funding
    # submission — whether a Momnt charge request, Breeze delivery/funding,
    # Microf work-order completion, Thrive funding request, or manual funding
    # paperwork submission — so that there is a clear audit trail of who
    # requested funding on every account
    Given a dealer or administrator initiates any type of funding action on an account
    When the funding submission is recorded by the platform
    Then the platform captures the authenticated user ID, full name, and role of the user who initiated the funding action
    And the platform captures the timestamp of the submission
    And the platform captures the funding type such as Momnt Charge Request, Breeze Delivery Date, Microf Work Completion, Thrive Funding Request, or Manual Funding Paperwork
    And the platform captures the funding amount requested
    And the funding requestor attribution is stored as part of the account funding record and cannot be modified after submission
    And the funding requestor information is visible on the account detail and funding timeline views

  @US-14-4-2 @domain-14
  Scenario: Request Momnt Refund
    # As a Administrator, I want to request a refund from Momnt
    # so that cancelled or adjusted loans are corrected
    Given a Momnt loan requires refund
    When I initiate the refund
    Then the refund is processed with Momnt
    And appropriate adjustments are made

  @US-14-4-3 @domain-14
  Scenario: Request Breeze Funding
    # As a Dealer, I want to request funding from Breeze after delivery/installation
    # so that I receive payment
    Given a Breeze LTO has been executed and installation is complete
    When I set the delivery date
    Then Breeze initiates the funding process
    And I receive payment when funded

  @US-14-4-4 @domain-14
  Scenario: Complete Microf Work Order
    # As a Dealer, I want to complete the work order with Microf
    # so that funding is processed
    Given a Microf LTO has been executed
    When I submit work completion
    Then Microf is notified
    And funding is initiated
