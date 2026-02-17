# Feature file generated from BRD User Stories
# Module 8: Billing & Payments
# Section 8.1: Billing Account Setup
# Updated: February 2026 - Enhanced with complete billing entity attributes

Feature: Billing Account Setup
  Billing & Payments with Complete Account Attributes

  Background:
    Given the Comfort Connect billing system is available

  @US-8-1-1 @module-08 @billing @account-creation @attributes
  Scenario: Create Billing Account with Complete Details
    # As a System, I want to create a billing account when a Premier enrollment is activated
    # so that billing can begin with all necessary attributes
    Given a Premier enrollment has been completed with:
      | Account Number        | 1234567                  |
      | Customer Name         | Jane Doe                 |
      | Customer Email        | jane.doe@email.com       |
      | Customer Phone        | (555) 234-5678           |
      | Contractor Company    | Quality HVAC Services    |
      | Installation Date     | 02/15/2026               |
      | Total Retail Price    | $12,500                  |
      | Lease Term            | 96 months                |
      | Pricing Type          | Standard                 |
    When the billing account is created
    Then the billing account includes:
      | Due Day of Month      | 15                       |
      | Escalator Factor      | 2.5%                     |
      | Paper Statement Opt   | No                       |
      | Fee Pause Opt         | No                       |
    And the billing schedule is established for all 96 months
    And the first billing date is set based on installation date

  @US-8-1-2 @module-08 @billing @payment-method @attributes
  Scenario: Set Up Payment Method with Complete Details
    # As a Homeowner, I want to set up my payment method
    # so that I can make payments conveniently
    Given I have an active billing account
    When I add a payment method with:
      | Payment Type          | Bank Account             |
      | Account Holder Name   | Jane Doe                 |
      | Account Type          | Checking                 |
      | Routing Number        | 123456789                |
      | Account Number        | XXXXXXXXXX               |
    Then the payment method is securely stored
    And I can use it for payments
    And the payment method is available for autopay enrollment

  @US-8-1-3 @module-08 @billing @autopay @configuration
  Scenario: Enable Autopay with Configuration Options
    # As a Homeowner, I want to enable automatic payments with my preferences
    # so that my payments are made on time according to my settings
    Given I have a stored payment method
    When I enable autopay with configuration:
      | Payment Day           | Due Date                 |
      | Payment Amount        | Full Balance Due         |
      | Retry on Failure      | Yes                      |
      | Retry Days            | 3, 7, 14                 |
      | Notification Method   | Email and SMS            |
    Then my autopay is configured with these settings
    And my payments are automatically processed on the due date
    And I receive confirmation of each payment

  @US-8-1-4 @module-08 @billing @autopay @disable
  Scenario: Disable Autopay
    # As a Homeowner, I want to disable automatic payments
    # so that I can control when payments are made
    Given I have autopay enabled
    When I disable autopay
    Then automatic payments stop
    And I am responsible for making manual payments
    And I receive confirmation of autopay cancellation

  @US-8-1-5 @module-08 @billing @custom-schedule
  Scenario: Configure Custom Payment Schedule
    # As an Administrator, I want to configure a custom payment schedule
    # so that special billing arrangements can be accommodated
    Given a billing account requires a custom schedule
    When I configure a custom payment schedule with:
      | Schedule Type         | Bi-Weekly                |
      | First Payment Date    | 03/01/2026               |
      | Payment Amount        | $175.00                  |
      | Total Payments        | 192                      |
    Then the custom schedule is saved
    And billing follows the custom schedule instead of standard monthly

  @US-8-1-6 @module-08 @billing @paper-statement
  Scenario: Elect Paper Statement Delivery
    # As a Homeowner, I want to receive paper statements
    # so that I have physical copies for my records
    Given I have an active billing account
    When I opt in to paper statements
    Then my preference is saved
    And I will receive monthly paper statements by mail
    And the applicable statement fee is disclosed

  @US-8-1-7 @module-08 @billing @fee-pause
  Scenario: Enroll in Fee Pause Program
    # As a Homeowner, I want to enroll in the fee pause program
    # so that late fees are waived during financial hardship
    Given I have an active billing account
    And I qualify for fee pause based on circumstances
    When I enroll in the fee pause program
    Then late fees are suspended for the enrolled period
    And my enrollment is recorded with start and end dates
