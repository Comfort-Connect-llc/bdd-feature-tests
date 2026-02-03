# Feature file generated from BRD User Stories
# Domain 13: Equipment Management
# Section 13.3: Invoice Verification

Feature: Invoice Verification
  Equipment Management

  @US-13-3-1 @domain-13 @validation
  Scenario: Verify Equipment Invoice
    # As a Administrator, I want to verify equipment invoices
    # so that funding is based on actual equipment installed
    Given an equipment invoice has been submitted
    When I verify the invoice
    Then I confirm the equipment matches the work order
    And the invoice is approved for funding
