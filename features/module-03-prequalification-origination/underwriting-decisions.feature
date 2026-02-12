# Feature file generated from BRD User Stories
# Domain 4: Premier Program Origination
# Section 4.2: Underwriting Decisions

Feature: Underwriting Decisions
  Premier Program Origination

  @US-4-2-1 @domain-04 @approval
  Scenario: Receive Automatic Approval
    # As a Homeowner, I want to receive automatic approval when I qualify
    # so that I can proceed immediately with my home comfort purchase
    Given my application has been submitted
    When the automated underwriting approves my application
    Then I see my approval amount and available offers
    And the dealer is notified of my approval
    And the application status changes to "Underwriting Approved"

  @US-4-2-2 @domain-04 @approval
  Scenario: Receive Approval for Less
    # As a Homeowner, I want to be informed when I am approved for less than requested
    # so that I can adjust my equipment selection
    Given my application has been submitted
    When I am approved for an amount less than the project total
    Then I see my maximum approval amount
    And I am informed I need to reduce my project cost or add down payment
    And the status changes to "Underwriting Approved for Less"

  @US-4-2-3 @domain-04 @application
  Scenario: Route Application for Manual Review
    # As a System, I want to route applications that don't meet automatic approval criteria to manual review
    # so that borderline cases get human evaluation
    Given an application has been submitted
    When automated underwriting determines manual review is required
    Then the application is queued for underwriter review
    And the homeowner and dealer are informed
    And the status changes to "In Manual Review"

  @US-4-2-4 @domain-04
  Scenario: Complete Manual Underwriting Review
    # As a Underwriter, I want to review applications requiring manual underwriting
    # so that I can make informed decisions
    Given an application is in manual review
    When I review the credit report, income, and other factors
    Then I can approve, approve for less, or decline
    And my decision and rationale are recorded

  @US-4-2-5 @domain-04 @credit
  Scenario: Handle Credit Freeze Detection
    # As a System, I want to detect when an applicant has a credit freeze
    # so that they can be informed to lift it
    Given an application has been submitted
    When a credit freeze is detected during credit pull
    Then the application status changes to "Credit Freeze Detected"
    And the applicant is provided instructions on how to proceed

  @US-4-2-6 @domain-04 @application
  Scenario: Decline Application
    # As a System, I want to decline applications that don't meet approval criteria
    # so that applicants receive adverse action notices
    Given an application has been evaluated
    When it does not meet approval criteria
    Then the status changes to "Premier Program Declined"
    And an adverse action notice is generated and sent
