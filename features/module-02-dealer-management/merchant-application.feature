# Feature file generated from BRD User Stories
# Module 2: Dealer Management
# Section 2.1: Merchant Application
# Updated: February 2026 - Enhanced with complete business entity attributes

Feature: Merchant Application
  Dealer/Contractor Onboarding with Complete Business Attributes

  Background:
    Given the Comfort Connect dealer onboarding system is available

  @US-2-1-1 @module-02 @application @invitation
  Scenario: Invite Dealer to Apply
    # As an Administrator, I want to send an application invitation to a prospective dealer
    # so that they can begin the onboarding process
    Given a valid dealer contact with:
      | Contact Email        | dealer@hvaccompany.com   |
      | Business Name        | Quality HVAC Services    |
      | Contact Phone        | (555) 123-4567           |
    When I send a merchant application invitation
    Then the dealer receives an email with a secure link to begin their application
    And the application record is created with status "Invitation Sent"
    And the invitation includes the business development rep information

  @US-2-1-2 @module-02 @application @progress
  Scenario: Save Application Progress
    # As a Dealer, I want to save my application progress at any time
    # so that I can complete it later without losing my information
    Given I am completing my merchant application
    And I have entered partial business information
    When I save my progress
    Then all entered information is preserved
    And I can resume from where I left off
    And the application status shows "In Progress"

  @US-2-1-3 @module-02 @application @submission @attributes
  Scenario: Submit Merchant Application with Complete Business Details
    # As a Dealer, I want to submit my completed merchant application
    # so that Comfort Connect can review my business for approval
    Given I have completed the merchant application with the following business information:
      | Display Name              | Quality HVAC Services         |
      | Legal Business Name       | Quality HVAC Services LLC     |
      | Business Website          | www.qualityhvac.com           |
      | Business Address Line 1   | 123 Main Street               |
      | Business Address Line 2   | Suite 100                     |
      | City                      | Austin                        |
      | State                     | TX                            |
      | ZIP Code                  | 78701                         |
      | EIN (Tax ID)              | 12-3456789                    |
      | Business Phone            | (555) 123-4567                |
      | Business Email            | info@qualityhvac.com          |
      | Year Started              | 2015                          |
    And I have provided ownership information:
      | Owner Name                | John Smith                    |
      | Owner Title               | President                     |
      | Owner Email               | john@qualityhvac.com          |
      | Owner Phone               | (555) 987-6543                |
      | Ownership Percentage      | 100%                          |
      | Owner SSN (last 4)        | XXXX                          |
      | Owner Date of Birth       | MM/DD/YYYY                    |
    And I have provided banking information:
      | Bank Account Type         | Checking                      |
      | Bank Routing Number       | 123456789                     |
      | Bank Account Number       | XXXXXXXXXX                    |
    And I have specified operating details:
      | Operating States          | TX, OK, LA                    |
      | System Types Serviced     | HVAC, Water Heater            |
      | Estimated Monthly Volume  | $75,000                       |
    When I submit my application
    Then the application status changes to "Submitted"
    And I receive confirmation that my application is under review
    And the underwriting team is notified

  @US-2-1-4 @module-02 @application @multi-location
  Scenario: Submit Application with Multiple Locations
    # As a Dealer, I want to register additional business locations
    # so that all my service locations are on the platform
    Given I have completed the primary business location information
    When I add additional locations:
      | Location Name        | Address                   | City      | State | ZIP   |
      | North Branch         | 456 Oak Avenue            | Dallas    | TX    | 75201 |
      | South Branch         | 789 Pine Road             | Houston   | TX    | 77001 |
    Then all locations are associated with my merchant application
    And each location can be configured separately

  @US-2-1-5 @module-02 @application @licensing
  Scenario: Provide State Licensing Information
    # As a Dealer, I want to provide my contractor licensing details
    # so that my compliance status can be verified
    Given I am completing my merchant application
    When I provide state licensing information:
      | State                | License Number    | Expiration Date | License Type       |
      | TX                   | TACLA12345        | 12/31/2026      | HVAC Contractor    |
      | OK                   | OK-MECH-67890     | 06/30/2027      | Mechanical         |
    Then my licensing information is recorded
    And compliance verification can proceed
