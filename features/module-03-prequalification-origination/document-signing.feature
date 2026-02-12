# Feature file generated from BRD User Stories
# Domain 4: Premier Program Origination
# Section 4.5: Document Signing

Feature: Document Signing
  Premier Program Origination

  @US-4-5-1 @domain-04 @signature @document
  Scenario: Request Lease Document Signing
    # As a Dealer, I want to send the lease agreement to the homeowner for signing
    # so that we can formalize the Premier enrollment
    Given the work order has been saved
    When I request document signing
    Then the lease agreement is generated
    And the homeowner receives a signing link
    And the status changes to "Pending Document Sign"

  @US-4-5-2 @domain-04 @signature
  Scenario: Sign Lease Agreement Electronically
    # As a Homeowner, I want to review and sign my lease agreement electronically
    # so that I can complete enrollment conveniently
    Given I have received a signing link
    When I review and sign all required documents
    Then my signature is captured and verified
    And I receive a copy of the signed documents

  @US-4-5-3 @domain-04 @signature @document @validation
  Scenario: Verify Document Signatures
    # As a System, I want to verify that all required signatures have been obtained
    # so that the enrollment can proceed
    Given documents have been sent for signing
    When all parties (primary, co-applicant if any) have signed
    Then the application status updates accordingly
