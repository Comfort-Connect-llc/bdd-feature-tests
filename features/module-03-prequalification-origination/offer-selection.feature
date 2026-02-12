# Feature file generated from BRD User Stories
# Domain 4: Premier Program Origination
# Section 4.3: Offer Selection

Feature: Offer Selection
  Premier Program Origination

  @US-4-3-1 @domain-04
  Scenario: Select Premier Offer
    # As a Homeowner, I want to select my preferred Premier Program offer
    # so that I can proceed with enrollment
    Given I have been approved for the Premier Program
    When I view and select from available offers
    Then my selection is recorded
    And the status changes to "Premier Offer Selected"

  @US-4-3-2 @domain-04
  Scenario: View Partner Financing Offers
    # As a Homeowner, I want to view alternative financing offers from partner lenders
    # so that I can choose the best option
    Given I am on the offer selection screen
    When partner financing options are available
    Then I can view and compare monthly payments, terms, and total cost
