# Feature file for Offer Ordering & Visibility (Full vs Partial Approvals)
# Module 03: Prequalification & Origination
# Section 3.14: Offer Ordering
#
# Bug-fix stories addressing incorrect ordering and visibility
# of full vs partial approval offers in the offer list.

Feature: Offer Ordering & Visibility
  As a contractor or homeowner viewing financing offers,
  I want fully approved offers prioritized above partial approvals
  and all available options visible and clearly differentiated,
  so that the simplest financing path is obvious while no option is hidden.

  Background:
    Given a homeowner has completed the application process
    And underwriting decisions have been returned from one or more lenders

  # ──────────────────────────────────────────────
  # US-3.14.1 — Prioritize Full Approvals
  # ──────────────────────────────────────────────

  @US-3-14-1 @module-03 @offers @approval @ordering
  Scenario: Full approvals appear above partial approvals in the offer list
    # As a contractor
    # I want fully approved offers to be shown first
    # So that I can quickly guide the homeowner toward the simplest,
    # most reliable financing option
    Given the following underwriting decisions have been returned:
      | Lender | Decision         | Approved Amount | Requested Amount |
      | Momnt  | Full Approval    | $15,000         | $15,000          |
      | Microf | Partial Approval | $10,000         | $15,000          |
      | Breeze | Full Approval    | $15,000         | $15,000          |
    When the offer list is displayed
    Then fully approved offers appear at the top of the list
    And partially approved offers appear after all full approvals
    And the ordering is: Momnt, Breeze, Microf

  @US-3-14-1 @module-03 @offers @approval @ordering
  Scenario: Offer ordering is consistent across contractor and homeowner views
    Given a homeowner has both full and partial approval offers
    When the contractor views the offer list
    And the homeowner views the offer list
    Then both views display full approvals above partial approvals
    And the relative order of offers is identical in both views

  @US-3-14-1 @module-03 @offers @approval @ordering
  Scenario: All partial approvals display normally when no full approvals exist
    Given the following underwriting decisions have been returned:
      | Lender | Decision         | Approved Amount | Requested Amount |
      | Momnt  | Partial Approval | $10,000         | $15,000          |
      | Microf | Partial Approval | $8,000          | $15,000          |
    When the offer list is displayed
    Then all partial approval offers are shown without special reordering
    And no "no full approvals" warning suppresses the offer list

  # ──────────────────────────────────────────────
  # US-3.14.2 — Preserve Visibility of Partial Approvals
  # ──────────────────────────────────────────────

  @US-3-14-2 @module-03 @offers @approval @visibility
  Scenario: Partial approvals remain visible alongside full approvals
    # As a homeowner
    # I want to see all available financing options, including partial approvals
    # So that I can choose a preferred program even if it requires a small down payment
    Given the following underwriting decisions have been returned:
      | Lender | Decision         | Approved Amount | Requested Amount |
      | Momnt  | Full Approval    | $15,000         | $15,000          |
      | Microf | Partial Approval | $10,000         | $15,000          |
    When the offer list is displayed
    Then the Microf partial approval offer is visible in the list
    And it is not hidden, collapsed, or removed

  @US-3-14-2 @module-03 @offers @approval @visibility
  Scenario: Offer cards clearly differentiate full and partial approvals
    Given a homeowner has both full and partial approval offers
    When the offer list is displayed
    Then each offer card displays a label indicating "Full Approval" or "Partial Approval"
    And full and partial approval cards use visually distinct styling

  @US-3-14-2 @module-03 @offers @approval @visibility
  Scenario: Homeowner can select a partial approval offer without restriction
    Given the offer list contains both full and partial approval offers
    When the homeowner selects a partial approval offer
    Then the selection is accepted
    And the homeowner proceeds to the next step in the origination flow

  # ──────────────────────────────────────────────
  # US-3.14.3 — Mixed Offer Scenarios (Full + Partial)
  # ──────────────────────────────────────────────

  @US-3-14-3 @module-03 @offers @approval @mixed
  Scenario: One lender fully approves while others partially approve
    # As a contractor
    # I want to understand when a homeowner has both full and partial approvals
    # So that I can explain trade-offs (e.g., promo vs. down payment)
    Given the following underwriting decisions have been returned:
      | Lender | Decision         | Approved Amount | Requested Amount | Terms          |
      | Momnt  | Full Approval    | $15,000         | $15,000          | 9.99% / 120 mo |
      | Microf | Partial Approval | $10,000         | $15,000          | LTO 60 mo      |
      | Breeze | Partial Approval | $12,000         | $15,000          | LTO 48 mo      |
    When the offer list is displayed
    Then each offer retains its own approval type label
    And each offer displays its individual terms and approved amount
    And the system does not collapse or group offers in a way that hides differences

  @US-3-14-3 @module-03 @offers @approval @mixed
  Scenario: All lenders return partial approvals
    Given the following underwriting decisions have been returned:
      | Lender | Decision         | Approved Amount | Requested Amount |
      | Momnt  | Partial Approval | $10,000         | $15,000          |
      | Microf | Partial Approval | $8,000          | $15,000          |
      | Breeze | Partial Approval | $12,000         | $15,000          |
    When the offer list is displayed
    Then all three offers are displayed individually
    And each offer shows its own approved amount and approval type
    And there is no ambiguity about which offers are full vs partial

  @US-3-14-3 @module-03 @offers @approval @mixed
  Scenario: Offer list does not suppress differences between approval types
    Given a homeowner has offers from multiple lenders with mixed approval types
    When the contractor views the offer list
    Then each offer card shows the lender name, approval type, approved amount, and key terms
    And the contractor can distinguish fully approved from partially approved offers at a glance
