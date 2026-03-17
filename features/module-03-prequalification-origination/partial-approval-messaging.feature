# Feature file for Partial Approval Messaging (Homeowner + Contractor)
# Module 03: Prequalification & Origination
# Section 3.15: Partial Approval Messaging
#
# Bug-fix stories addressing unclear or missing messaging when
# a homeowner receives a partial approval from one or more lenders.

Feature: Partial Approval Messaging
  As a homeowner or contractor viewing partially approved offers,
  I want clear, upfront messaging about approval status and potential
  out-of-pocket costs, so that expectations are set before proceeding.

  Background:
    Given a homeowner has completed the application process
    And at least one lender has returned a partial approval

  # ──────────────────────────────────────────────
  # US-3.15.1 — Homeowner Messaging for Partial Approval
  # ──────────────────────────────────────────────

  @US-3-15-1 @module-03 @offers @approval @messaging @homeowner
  Scenario: Homeowner sees clear partial approval message on the offer card
    # As a homeowner
    # I want clear messaging when I am only partially approved
    # So that I understand I may need to provide a down payment before proceeding
    Given the following underwriting decision has been returned:
      | Lender | Decision         | Approved Amount | Requested Amount |
      | Momnt  | Partial Approval | $10,000         | $15,000          |
    When the homeowner views the offer card for Momnt
    Then the offer card displays a message such as "You were approved for a lower amount than requested"
    And the message explicitly states that a down payment may be required
    And the message is visible directly on or near the offer card
    And the message is not hidden in fine print or a secondary screen

  @US-3-15-1 @module-03 @offers @approval @messaging @homeowner
  Scenario: Partial approval message appears before homeowner selects the offer
    Given the homeowner has a partial approval offer from Microf
    When the homeowner views the offer list
    Then the partial approval messaging is visible before the homeowner selects or proceeds with the offer
    And the homeowner does not need to click into offer details to see the partial approval status

  @US-3-15-1 @module-03 @offers @approval @messaging @homeowner
  Scenario: Partial approval message includes the approved amount and shortfall
    Given the following underwriting decision has been returned:
      | Lender | Decision         | Approved Amount | Requested Amount |
      | Breeze | Partial Approval | $12,000         | $15,000          |
    When the homeowner views the Breeze offer card
    Then the approved amount of $12,000 is displayed
    And the difference between requested and approved ($3,000) is communicated
    And the message sets the expectation that the homeowner may need to cover the gap

  # ──────────────────────────────────────────────
  # US-3.15.2 — Down Payment Expectation Clarity
  # ──────────────────────────────────────────────

  @US-3-15-2 @module-03 @offers @approval @messaging @down-payment
  Scenario: Partial approval shows estimated down payment when calculable
    # As a homeowner
    # I want visibility into potential out-of-pocket requirements
    # So that I am not surprised later in the process
    Given the following underwriting decision has been returned:
      | Lender | Decision         | Approved Amount | Requested Amount |
      | Momnt  | Partial Approval | $10,000         | $15,000          |
    And the project total is $15,000
    When the homeowner views the offer card for Momnt
    Then the offer card displays an estimated down payment of $5,000
    And the down payment amount is clearly labeled

  @US-3-15-2 @module-03 @offers @approval @messaging @down-payment
  Scenario: Partial approval shows warning when exact down payment is unknown
    Given a lender has returned a partial approval
    And the exact down payment amount cannot be determined at this stage
    When the homeowner views the offer card
    Then the offer card displays expectation-setting language such as "May require a down payment"
    And the language is consistent across all partial approval offers where the amount is unknown

  @US-3-15-2 @module-03 @offers @approval @messaging @down-payment
  Scenario: Down payment messaging is consistent across all partial approval offers
    Given the following underwriting decisions have been returned:
      | Lender | Decision         | Approved Amount | Requested Amount |
      | Momnt  | Partial Approval | $10,000         | $15,000          |
      | Microf | Partial Approval | $8,000          | $15,000          |
    When the homeowner views the offer list
    Then each partial approval offer includes down payment messaging
    And the messaging format and placement is consistent across all partial approval cards

  # ──────────────────────────────────────────────
  # US-3.15.3 — Contractor-Side Partial Approval Indicator
  # ──────────────────────────────────────────────

  @US-3-15-3 @module-03 @offers @approval @messaging @contractor
  Scenario: Contractor sees a distinct partial approval label on offer cards
    # As a contractor
    # I want a clear visual indicator when an offer is partially approved
    # So that I can proactively explain financing gaps to the homeowner
    Given the following underwriting decisions have been returned:
      | Lender | Decision         | Approved Amount | Requested Amount |
      | Momnt  | Full Approval    | $15,000         | $15,000          |
      | Microf | Partial Approval | $10,000         | $15,000          |
    When the contractor views the offer list
    Then the Microf offer displays a distinct "Partial Approval" label
    And the Momnt offer displays a "Full Approval" label or no qualifier
    And the partial approval indicator is visible in the offer list without expanding details

  @US-3-15-3 @module-03 @offers @approval @messaging @contractor
  Scenario: Contractor can distinguish all approval states at a glance
    Given the following underwriting decisions have been returned:
      | Lender | Decision         | Approved Amount | Requested Amount |
      | Momnt  | Full Approval    | $15,000         | $15,000          |
      | Microf | Partial Approval | $10,000         | $15,000          |
      | Breeze | Partial Approval | $12,000         | $15,000          |
    When the contractor views the offer list
    Then the contractor can quickly distinguish:
      | Lender | Visual Indicator |
      | Momnt  | Fully Approved   |
      | Microf | Partially Approved |
      | Breeze | Partially Approved |
    And a summary line indicates "Some lenders partially approved" when the scenario is mixed

  @US-3-15-3 @module-03 @offers @approval @messaging @contractor
  Scenario: Contractor sees appropriate summary for all-partial scenario
    Given the following underwriting decisions have been returned:
      | Lender | Decision         | Approved Amount | Requested Amount |
      | Momnt  | Partial Approval | $10,000         | $15,000          |
      | Microf | Partial Approval | $8,000          | $15,000          |
    When the contractor views the offer list
    Then each offer displays a "Partial Approval" label
    And no summary references full approvals
    And the contractor understands that all available options require a potential down payment
