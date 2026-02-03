# Feature file generated from BRD User Stories
# Domain 4: Premier Program Origination
# Section 4.4: Work Order & Quote

Feature: Work Order & Quote
  Premier Program Origination

  @US-4-4-1 @domain-04
  Scenario: Add Work Order Details
    # As a Dealer, I want to add work order details including equipment and installation information
    # so that the lease agreement reflects the actual project
    Given the homeowner has selected a Premier offer
    When I enter work order details (equipment, installation date, total)
    Then the work order is saved
    And the status changes to "Work Order Saved"

  @US-4-4-2 @domain-04
  Scenario: Modify Quote
    # As a Dealer, I want to modify the quote if equipment or pricing changes
    # so that the agreement reflects the actual project
    Given a work order has been saved
    When I modify the quote details
    Then the payment amounts are recalculated
    And the homeowner sees updated terms

  @US-4-4-3 @domain-04
  Scenario: Update Tax Rate
    # As a System, I want to apply the correct tax rate based on installation location
    # so that billing amounts are accurate
    Given an installation address has been provided
    When the system looks up the applicable tax rate
    Then the correct tax rate is applied to calculations
