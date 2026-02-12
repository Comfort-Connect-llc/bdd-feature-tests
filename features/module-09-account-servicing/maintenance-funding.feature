# Feature file generated from BRD User Stories
# Domain 12: Maintenance & Servicing
# Section 12.3: Maintenance Funding

Feature: Maintenance Funding
  Maintenance & Servicing

  @US-12-3-1 @domain-12
  Scenario: Process Maintenance Invoice
    # As a System, I want to process maintenance invoices
    # so that contractors are compensated for service
    Given a maintenance service has been completed
    When the invoice is submitted
    Then the invoice is processed for payment
    And the contractor is paid

  @US-12-3-2 @domain-12
  Scenario: Track Maintenance Costs
    # As a Administrator, I want to track maintenance costs per account
    # so that profitability can be analyzed
    Given maintenance has been performed
    When I view maintenance costs
    Then I see all service costs associated with the account
