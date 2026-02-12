# Feature file generated from BRD User Stories
# Domain 9: Income & Property Verification
# Section 9.2: Property/Deed Verification

Feature: Property/Deed Verification
  Income & Property Verification

  @US-9-2-1 @domain-09
  Scenario: Request Deed Verification
    # As a System, I want to initiate deed verification for Premier leases
    # so that property ownership is confirmed
    Given a Premier enrollment requires deed verification
    When verification is requested
    Then the verification process is initiated
    And the status reflects "Deed Verification in Progress"

  @US-9-2-2 @domain-09 @validation
  Scenario: Verify Property Ownership
    # As a Administrator, I want to verify property ownership
    # so that leases are properly secured
    Given deed verification is in progress
    When I confirm property ownership matches the applicant
    Then the verification status is updated to "Verified"
    And installation can be authorized

  @US-9-2-3 @domain-09
  Scenario: Handle Deed Verification Failure
    # As a System, I want to handle failed deed verification
    # so that appropriate action can be taken
    Given deed verification has failed
    When the failure is recorded
    Then the applicant and dealer are notified
    And the application is held pending resolution

  @US-9-2-4 @domain-09
  Scenario: Check Active Property Listings
    # As a System, I want to check for active property listings
    # so that leases are not made on properties being sold
    Given a property address
    When active listings are checked
    Then any active listings are flagged
    And additional review is triggered if found
