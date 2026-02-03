# Feature file generated from BRD User Stories
# Domain 8: Credit & Underwriting
# Section 8.3: Manual Underwriting

Feature: Manual Underwriting
  Credit & Underwriting

  @US-8-3-1 @domain-08 @application
  Scenario: Queue Application for Manual Review
    # As a System, I want to queue applications requiring manual review
    # so that underwriters can evaluate them
    Given an application triggers manual review criteria
    When the application is queued
    Then it appears in the underwriting review queue
    And priority is assigned based on criteria

  @US-8-3-2 @domain-08
  Scenario: Review Manual Underwriting Case
    # As a Underwriter, I want to review applications requiring manual decisions
    # so that I can make informed credit decisions
    Given an application in the manual review queue
    When I review the case
    Then I can view complete credit report, application details, and underwriting rule matches
    And I can approve, approve with conditions, or decline

  @US-8-3-3 @domain-08
  Scenario: Record Manual Underwriting Decision
    # As a Underwriter, I want to record my decision with rationale
    # so that there is an audit trail
    Given I have made a manual underwriting decision
    When I record my decision
    Then the decision, conditions, and rationale are saved
    And the homeowner and dealer are notified
