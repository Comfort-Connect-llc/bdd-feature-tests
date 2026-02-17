# Feature file for Homeowner Application with Complete Attributes
# Module 3: Prequalification & Origination
# Section: Application Data Attributes
# Priority: HIGH - Gap identified in audit

Feature: Homeowner Application with Complete Attributes
  Financing application with all required business data attributes

  Background:
    Given the Comfort Connect financing application system is available

  @US-3-16-1 @module-03 @application @homeowner @attributes
  Scenario: Submit Application with Complete Homeowner Information
    # As a Homeowner, I want to submit my complete application information
    # so that my financing eligibility can be accurately evaluated
    Given I am completing a financing application
    When I provide my personal information:
      | First Name            | Jane                     |
      | Last Name             | Doe                      |
      | Date of Birth         | 05/15/1985               |
      | Social Security Number| XXX-XX-1234              |
      | Email Address         | jane.doe@email.com       |
      | Phone Number          | (555) 234-5678           |
      | Preferred Contact     | Email                    |
    And I provide my residential address:
      | Street Address        | 456 Oak Lane             |
      | Unit/Apt              | Apt 2B                   |
      | City                  | Austin                   |
      | State                 | TX                       |
      | ZIP Code              | 78702                    |
      | Property Type         | Single Family Home       |
      | Years at Address      | 5                        |
      | Ownership Status      | Own                      |
    And I provide my employment and income information:
      | Employment Status     | Employed Full-Time       |
      | Employer Name         | Tech Company Inc         |
      | Job Title             | Software Engineer        |
      | Years Employed        | 3                        |
      | Annual Gross Income   | $95,000                  |
      | Additional Income     | $5,000                   |
      | Income Source         | Rental Property          |
    Then my application is ready for submission
    And all required fields are validated

  @US-3-16-2 @module-03 @application @co-applicant @attributes
  Scenario: Add Co-Applicant with Complete Information
    # As a Homeowner, I want to add a co-applicant to my application
    # so that our combined financial profile improves approval chances
    Given I have started a financing application
    When I add a co-applicant with information:
      | First Name            | John                     |
      | Last Name             | Doe                      |
      | Date of Birth         | 03/20/1983               |
      | Social Security Number| XXX-XX-5678              |
      | Email Address         | john.doe@email.com       |
      | Phone Number          | (555) 345-6789           |
      | Relationship          | Spouse                   |
    And the co-applicant provides employment information:
      | Employment Status     | Employed Full-Time       |
      | Employer Name         | Healthcare Corp          |
      | Job Title             | Registered Nurse         |
      | Years Employed        | 8                        |
      | Annual Gross Income   | $72,000                  |
    Then both applicants are included in the application
    And combined income is used for qualification

  @US-3-16-3 @module-03 @application @property @attributes
  Scenario: Provide Property and Installation Details
    # As a Dealer, I want to capture property and installation details
    # so that the financing agreement reflects the actual project
    Given I am creating an application for a homeowner
    When I provide property details:
      | Installation Address  | Same as Residential      |
      | Property Type         | Single Family Home       |
      | Year Built            | 1998                     |
      | Square Footage        | 2,400                    |
      | Foundation Type       | Slab                     |
    And I provide project details:
      | Equipment Type        | Full HVAC System         |
      | Equipment Brand       | Carrier                  |
      | Equipment Model       | 24ACC636A003             |
      | Installation Date     | 03/15/2026               |
      | Project Total         | $12,500                  |
      | Down Payment          | $0                       |
      | Financed Amount       | $12,500                  |
    Then the application includes complete property and project information

  @US-3-16-4 @module-03 @application @consent @disclosures
  Scenario: Capture Required Consents and Disclosures
    # As a System, I want to capture all required consents
    # so that regulatory compliance is maintained
    Given a homeowner is completing their application
    When they acknowledge required disclosures:
      | Disclosure Type           | Acknowledged | Timestamp            |
      | Credit Authorization      | Yes          | 02/17/2026 10:30 AM  |
      | E-Sign Consent            | Yes          | 02/17/2026 10:31 AM  |
      | Privacy Policy            | Yes          | 02/17/2026 10:31 AM  |
      | Terms and Conditions      | Yes          | 02/17/2026 10:32 AM  |
      | Adverse Action Rights     | Yes          | 02/17/2026 10:32 AM  |
    Then all consents are recorded with timestamps
    And the application can proceed to underwriting

  @US-3-16-5 @module-03 @application @partner-specific
  Scenario: Capture Partner-Specific Application Data
    # As a System, I want to capture partner-specific data requirements
    # so that applications can be submitted to external financing partners
    Given a homeowner has selected a financing partner
    When partner-specific data is required for Momnt:
      | Momnt Application ID  | Auto-generated           |
      | Hard Pull Authorized  | Yes                      |
      | Loan Purpose          | Home Improvement         |
      | Requested Amount      | $12,500                  |
      | Preferred Term        | 120 months               |
    Then the partner-specific data is captured
    And the application is ready for partner submission
