# Feature file for Merchant Risk Assessment
# Module 2: Dealer Management
# Section: AI-Based Merchant Evaluation
# Priority: MEDIUM - Gap identified in audit

Feature: Merchant Risk Assessment
  AI-powered merchant evaluation and risk scoring

  Background:
    Given I am an authenticated Underwriter or Administrator
    And I have access to merchant assessment tools

  @US-2-10-1 @module-02 @assessment @ai
  Scenario: Generate AI-Based Merchant Assessment
    # As an Underwriter, I want the system to generate an AI assessment of merchant applications
    # so that I have data-driven insights for approval decisions
    Given a merchant application has been submitted with:
      | Business Name        | Quality HVAC Services    |
      | Years in Business    | 8                        |
      | Annual Revenue       | $2,500,000               |
      | Number of Employees  | 15                       |
      | Service Area         | Texas, Oklahoma          |
    When the AI assessment is generated
    Then the assessment includes:
      | Risk Score           | 1-10 scale               |
      | Recommendation       | Approve/Review/Decline   |
      | Confidence Level     | High/Medium/Low          |
      | Key Risk Factors     | List of concerns         |
      | Positive Indicators  | List of strengths        |

  @US-2-10-2 @module-02 @assessment @web-search
  Scenario: Validate Merchant via Web Search
    # As a System, I want to validate merchant information via web search
    # so that submitted business details can be verified
    Given a merchant application is being processed
    When the system performs web validation
    Then the system searches for:
      | Business registration records                    |
      | Better Business Bureau rating                    |
      | Online reviews and reputation                    |
      | State licensing verification                     |
      | Contractor certification status                  |
    And findings are included in the assessment report

  @US-2-10-3 @module-02 @assessment @review
  Scenario: Review Merchant Assessment Results
    # As an Underwriter, I want to review AI assessment results
    # so that I can make informed approval decisions
    Given an AI assessment has been generated
    When I review the assessment
    Then I see the complete risk analysis
    And I can accept or override the recommendation
    And my decision is recorded with rationale

  @US-2-10-4 @module-02 @assessment @scoring
  Scenario: Configure Contractor Scoring Criteria
    # As an Administrator, I want to configure scoring criteria
    # so that assessments reflect current business priorities
    Given I am configuring assessment parameters
    When I set scoring weights for:
      | Years in Business    | 20%                      |
      | Revenue Size         | 25%                      |
      | Credit History       | 30%                      |
      | Online Reputation    | 15%                      |
      | Licensing Status     | 10%                      |
    Then the scoring weights are applied to future assessments

  @US-2-10-5 @module-02 @assessment @history
  Scenario: View Assessment History
    # As an Administrator, I want to view assessment history for a merchant
    # so that I can track changes over time
    Given a merchant has had multiple assessments
    When I view assessment history
    Then I see all assessments with dates and scores
    And can compare changes over time
