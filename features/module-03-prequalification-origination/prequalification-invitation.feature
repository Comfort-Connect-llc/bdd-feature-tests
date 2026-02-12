# Feature file generated from BRD User Stories
# Domain 3: Homeowner Prequalification
# Section 3.1: Prequalification Invitation

Feature: Prequalification Invitation
  Homeowner Prequalification

  @US-3-1-1 @domain-03
  Scenario: Send Prequalification Invitation
    # As a Dealer, I want to send a prequalification invitation to a prospective customer
    # so that they can check their financing eligibility
    Given I have a customer's name, email, and/or phone number
    When I send a prequalification invitation
    Then the customer receives a link via email and/or SMS
    And the invitation is tracked in my pipeline

  @US-3-1-2 @domain-03
  Scenario: Access Prequalification via Link
    # As a Homeowner, I want to access the prequalification form via the link I received
    # so that I can check my financing eligibility
    Given I received a prequalification invitation
    When I click the link
    Then I am taken to a secure prequalification form
    And I see the dealer's branding
