# Feature file generated from BRD User Stories
# Domain 4: Premier Program Origination
# Section 4.7: Verification Requirements

Feature: Verification Requirements
  Premier Program Origination

  @US-4-7-1 @domain-04
  Scenario: Initiate Deed Verification
    # As a System, I want to verify property ownership before installation authorization
    # so that lease agreements are properly secured
    Given an enrollment requires deed verification
    When the verification is initiated
    Then the status shows "Deed Verification in Progress"
    And installation authorization is held pending verification

  @US-4-7-2 @domain-04
  Scenario: Update Deed Verification Status
    # As a Administrator, I want to update the deed verification status
    # so that enrollment can proceed once verified
    Given deed verification is in progress
    When I update the verification status
    Then if verified, installation authorization can proceed

  @US-4-7-3 @domain-04
  Scenario: Initiate Income Verification
    # As a System, I want to verify income when required by underwriting
    # so that approval decisions are supported
    Given an enrollment requires income verification
    When the verification is initiated
    Then the status shows "Income Verification in Progress"

  @US-4-7-4 @domain-04
  Scenario: Update Income Verification Status
    # As a Administrator, I want to update income verification status
    # so that enrollment can proceed once verified
    Given income verification is in progress
    When I update the verification status with results
    Then the application can proceed
