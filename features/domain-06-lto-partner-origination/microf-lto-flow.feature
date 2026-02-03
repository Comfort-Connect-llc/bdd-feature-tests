# Feature file generated from BRD User Stories
# Domain 6: LTO Partner Origination
# Section 6.1: Microf LTO Flow

Feature: Microf LTO Flow
  LTO Partner Origination

  @US-6-1-1 @domain-06 @application
  Scenario: Initiate Microf Application
    # As a System, I want to submit an application to Microf when selected
    # so that the homeowner can obtain LTO financing
    Given a homeowner has selected a Microf LTO offer
    When the Microf application is initiated
    Then an application ID is returned
    And the status reflects the Microf flow

  @US-6-1-2 @domain-06
  Scenario: Accept Microf Lease Offer
    # As a Homeowner, I want to accept my Microf lease offer and sign the agreement
    # so that my LTO is finalized
    Given I have been approved by Microf
    When I accept the lease terms and complete signing
    Then my acceptance is recorded

  @US-6-1-3 @domain-06
  Scenario: Submit Income Proof for Microf
    # As a Homeowner, I want to submit income verification documents
    # so that my Microf application can be approved
    Given Microf requires income verification
    When I upload proof of income documents
    Then the documents are submitted to Microf

  @US-6-1-4 @domain-06 @validation
  Scenario: Verify Microf Income Proof Status
    # As a System, I want to check the status of income verification with Microf
    # so that the application can proceed when verified
    Given income proof has been submitted
    When I check verification status
    Then the application status is updated accordingly

  @US-6-1-5 @domain-06
  Scenario: Complete Microf Work Order
    # As a Dealer, I want to notify Microf that installation is complete
    # so that funding can be requested
    Given installation has been completed
    When I submit the completion notification
    Then Microf is notified
    And the funding process is initiated

  @US-6-1-6 @domain-06 @application
  Scenario: Refresh Microf Application Status
    # As a System, I want to periodically refresh application status from Microf
    # so that the platform reflects current state
    Given an active Microf application
    When the status is refreshed
    Then any status changes from Microf are captured
