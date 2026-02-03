# Feature file generated from BRD User Stories
# Domain 21: Reporting & Analytics
# Section 21.3: Data Export

Feature: Data Export
  Reporting & Analytics

  @US-21-3-1 @domain-21
  Scenario: Export Account Data to Data Warehouse
    # As a System, I want to export account data to the data warehouse
    # so that analytics can be performed
    Given account data exists
    When the export runs
    Then data is loaded to the data warehouse
    And is available for reporting

  @US-21-3-2 @domain-21 @payment
  Scenario: Export Payment Data
    # As a System, I want to export payment data for reconciliation
    # so that financial reporting is accurate
    Given payments have been processed
    When the export runs
    Then payment data is exported
    And can be reconciled with financial systems
