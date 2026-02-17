# Feature file for Warranty Management
# Module 5: Pricing & Equipment
# Section: Warranty Configuration
# Priority: HIGH - Critical gap identified in audit

Feature: Warranty Management
  Equipment warranty configuration and eligibility rules

  Background:
    Given I am an authenticated Administrator
    And I have access to warranty configuration

  @US-5-7-1 @module-05 @warranty @configuration
  Scenario: Configure Dealer Warranty Options
    # As an Administrator, I want to configure warranty options for dealers
    # so that they can offer extended warranty coverage to homeowners
    Given I am configuring warranty for a dealer
    When I set up warranty options with:
      | Warranty Provider     | Extended Care Inc       |
      | Warranty Amount       | $2,500                  |
      | Coverage Duration     | 10 years                |
    Then the warranty configuration is saved to the dealer profile
    And the warranty option is available during application creation

  @US-5-7-2 @module-05 @warranty @eligibility
  Scenario: Define Warranty Equipment Eligibility
    # As an Administrator, I want to define which equipment types qualify for warranty
    # so that appropriate coverage is offered
    Given a dealer has warranty configured
    When I configure equipment eligibility with rules:
      | Equipment Type               | Eligible  |
      | Any Single Component HVAC    | Yes       |
      | Any Full HVAC System         | Yes       |
      | Tanked Water Heater          | Yes       |
      | Tankless Water Heater        | Yes       |
      | Water Softener               | Yes       |
      | Water Filter                 | Yes       |
    Then only eligible equipment types can receive warranty coverage
    And ineligible equipment is excluded from warranty offers

  @US-5-7-3 @module-05 @warranty @application
  Scenario: Apply Warranty to Financing Application
    # As a Dealer, I want to include warranty coverage in a customer's financing
    # so that they have comprehensive protection
    Given I am creating a financing application for a homeowner
    And the homeowner is purchasing eligible equipment
    When I add warranty coverage to the application
    Then the warranty cost is included in the financed amount
    And the warranty terms are displayed in the agreement

  @US-5-7-4 @module-05 @warranty @pricing
  Scenario: Calculate Warranty Impact on Monthly Payment
    # As a System, I want to calculate how warranty affects monthly payments
    # so that accurate quotes are provided
    Given a financing quote is being generated
    And warranty coverage is included
    When monthly payments are calculated
    Then the warranty amount is factored into the total financed amount
    And the monthly payment reflects the warranty cost

  @US-5-7-5 @module-05 @warranty @reporting
  Scenario: View Warranty Coverage Report
    # As an Administrator, I want to view warranty coverage across accounts
    # so that I can track warranty utilization
    Given warranty has been included on financed accounts
    When I generate the warranty coverage report
    Then I see accounts with warranty coverage
    And warranty provider, amount, and equipment type for each
