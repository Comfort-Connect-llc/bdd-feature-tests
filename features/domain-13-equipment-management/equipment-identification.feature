# Feature file generated from BRD User Stories
# Domain 13: Equipment Management
# Section 13.1: Equipment Identification

Feature: Equipment Identification
  Equipment Management

  @US-13-1-1 @domain-13
  Scenario: Look Up Equipment by Model
    # As a Dealer, I want to look up equipment by model number
    # so that I can find the correct specifications
    Given a model number
    When I search for equipment
    Then matching equipment details are returned
    And specifications are displayed

  @US-13-1-2 @domain-13
  Scenario: Identify Equipment via AI
    # As a Dealer, I want to identify equipment from an invoice or image
    # so that I can quickly capture equipment details
    Given an equipment invoice or image
    When AI analysis is performed
    Then equipment make, model, and specifications are extracted
    And can be added to the work order

  @US-13-1-3 @domain-13
  Scenario: Capture Equipment Serial Number
    # As a Dealer, I want to capture the equipment serial number during installation
    # so that the installed equipment is tracked
    Given equipment is being installed
    When I enter the serial number
    Then the serial is associated with the account
    And is available for warranty and service purposes
