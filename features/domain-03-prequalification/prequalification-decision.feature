# Feature file generated from BRD User Stories
# Domain 3: Homeowner Prequalification
# Section 3.3: Prequalification Decision

Feature: Prequalification Decision
  Homeowner Prequalification

  @US-3-3-1 @domain-03
  Scenario: Receive Prequalification Decision
    # As a Homeowner, I want to receive my prequalification decision immediately
    # so that I know what financing options are available to me
    Given I have submitted my prequalification
    When the evaluation is complete
    Then I see my decision (Approved, Declined, or Review Required)
    And if approved, I see my estimated approval amount

  @US-3-3-2 @domain-03
  Scenario: View Available Financing Products
    # As a Homeowner, I want to see which financing products I qualify for
    # so that I can understand my options
    Given I am prequalified
    When I view my results
    Then I see all available products (Premier, Loan, LTO) I qualify for
    And I see the maximum amount available for each

  @US-3-3-3 @domain-03
  Scenario: Generate Adverse Action Notice
    # As a System, I want to generate and deliver adverse action notices when required
    # so that declined applicants receive legally required disclosures
    Given an applicant has been declined
    When the decision is rendered
    Then an adverse action letter is generated with reasons and rights information
    And the letter is delivered via email and/or mail

  @US-3-3-4 @domain-03 @application
  Scenario: Convert Prequalification to Application
    # As a Dealer, I want to convert a prequalified customer to a full application
    # so that I can proceed with their financing
    Given a customer has been prequalified
    When I initiate a full application
    Then the prequalification information auto-populates
    And I can add equipment and project details
