# Feature file generated from BRD User Stories
# Domain 1: Dealer/Contractor Onboarding
# Section 1.3: Merchant Underwriting

Feature: Merchant Underwriting
  Dealer/Contractor Onboarding

  @US-1-3-1 @domain-01
  Scenario: Complete Merchant Underwriting Review
    # As a Underwriter, I want to review a dealer's application and supporting documentation
    # so that I can determine their eligibility to join the platform
    Given a merchant application has been submitted
    When I review the application details and financial information
    Then I can approve, decline, or request additional information
    And my decision and rationale are recorded

  @US-1-3-2 @domain-01 @document
  Scenario: Request Additional Onboarding Documents
    # As a Underwriter, I want to request additional documents from a dealer
    # so that I can complete my review
    Given I am reviewing a merchant application
    When I request additional documents
    Then the dealer receives a notification specifying what is needed
    And the application status reflects "Documents Requested"

  @US-1-3-3 @domain-01 @document
  Scenario: Upload Onboarding Documents
    # As a Dealer, I want to upload requested documents
    # so that my application review can be completed
    Given I have received a request for additional documents
    When I upload the requested files
    Then the files are attached to my application
    And the underwriting team is notified
