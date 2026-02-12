# Feature file generated from BRD User Stories
# Domain 14: Installation & Funding
# Section 14.1: Installation Authorization

Feature: Installation Authorization
  Installation & Funding

  @US-14-1-1 @domain-14
  Scenario: Authorize Installation
    # As a Dealer, I want to authorize that installation can proceed
    # so that I can schedule the work
    Given all pre-installation requirements are met (documents signed, first payment received, verifications complete)
    When I authorize installation
    Then the status changes to "Installation Authorized"
    And installation can proceed

  @US-14-1-2 @domain-14
  Scenario: Record Installation Completion
    # As a Dealer, I want to record that installation is complete
    # so that funding can be processed
    Given installation has been performed
    When I record completion with date and details
    Then the status changes to "Installation Completed"
    And the funding process can begin
