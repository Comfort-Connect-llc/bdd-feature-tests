# Feature file generated from BRD User Stories
# Module 09: Account Servicing
# Section 9.19: Funding Request Audit

Feature: Funding Request Audit
  Account Servicing — Cross-lender visibility into which users requested funding
  on accounts, supporting operations management, compliance auditing, and
  internal accountability across all funding types and lending partners

  @US-9-19-1 @module-09 @funding @audit @cross-lender
  Scenario: View Funding Request Attribution on Account Detail
    # As an Operations Manager or Compliance Officer, I want to see which
    # internal user requested funding on a given account, so that I have a
    # clear audit trail for accountability and dispute resolution
    Given I have permission to view funding request details on an account
    When I view the account detail for any funded or funding-in-progress account
    Then I see a Funding Request Attribution section showing the full name, user ID, and role of the user who initiated the funding request
    And I see the date and time the funding request was submitted
    And I see the funding type such as Momnt Charge Request, Breeze Delivery Date, Microf Work Completion, Thrive Funding Request, or Manual Funding Paperwork
    And I see the funding amount requested
    And if multiple funding requests have been made on the account such as a rejected request followed by a retry I see the attribution for each request in chronological order
    And the funding requestor attribution is read-only and cannot be edited

  @US-9-19-2 @module-09 @funding @audit @cross-lender @search
  Scenario: Search and Filter Funding Requests by Requesting User
    # As an Operations Manager, I want to search and filter funding requests
    # across the portfolio by the user who submitted them, so that I can
    # review a specific user's funding activity for performance management
    # or compliance review
    Given I have permission to access the funding request audit view
    When I navigate to the Funding Request Audit report
    Then I can filter funding requests by requesting user name or user ID
    And I can filter by date range of funding submission
    And I can filter by funding type such as Momnt Charge, Breeze, Microf, Thrive, or Manual
    And I can filter by funding status such as Pending, Approved, Funded, or Rejected
    And I can filter by lender or partner
    And the results display the account number, homeowner name, requesting user, funding type, amount, date, and current status
    And results are sortable by any displayed column
    And results are paginated for large datasets

  @US-9-19-3 @module-09 @funding @audit @cross-lender @export
  Scenario: Export Funding Request Attribution Data
    # As a Compliance Officer, I want to export funding request attribution
    # data, so that I can perform offline analysis or include it in
    # regulatory compliance reports
    Given I have applied filters on the Funding Request Audit report
    When I select "Export"
    Then I can export the filtered results to CSV or Excel format
    And the export includes all displayed columns plus account ID and lender name
    And the export file is timestamped and labeled with the applied filters
    And the export is logged for audit trail purposes

  @US-9-19-4 @module-09 @funding @audit @cross-lender @permissions
  Scenario: Role-Based Access to Funding Request Attribution
    # As an Administrator, I want to control who can view funding request
    # attribution data, so that sensitive internal user activity is only
    # visible to authorized roles
    Given funding request attribution data exists on accounts
    When a user accesses the account detail or Funding Request Audit report
    Then users with the Operations Manager, Compliance Officer, or Administrator role can view the full funding requestor attribution
    And users with the Dealer role can see their own funding request submissions but not those made by other users
    And users with the Customer Service Representative role can see the requesting user name but not the full audit detail
    And users without an authorized role do not see funding requestor attribution data
    And access to the Funding Request Audit report is restricted to Operations Manager, Compliance Officer, and Administrator roles
