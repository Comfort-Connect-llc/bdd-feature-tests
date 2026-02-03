# Feature file generated from BRD User Stories
# Domain 10: Document Management & E-Signatures
# Section 10.2: Electronic Signatures

Feature: Electronic Signatures
  Document Management & E-Signatures

  @US-10-2-1 @domain-10 @signature @document
  Scenario: Send Document for E-Signature
    # As a System, I want to send documents for electronic signature
    # so that agreements can be executed remotely
    Given a document is ready for signing
    When I send it for e-signature
    Then the recipient receives an email with a signing link
    And they can review and sign electronically

  @US-10-2-2 @domain-10 @signature @document
  Scenario: Sign Document Electronically
    # As a Signer, I want to sign documents electronically
    # so that I can complete agreements conveniently
    Given I have received a signing link
    When I access the document and complete the signature process
    Then my electronic signature is captured
    And I receive a copy of the signed document

  @US-10-2-3 @domain-10 @signature
  Scenario: Track Signature Status
    # As a System, I want to track document signature status
    # so that incomplete signings can be followed up
    Given documents have been sent for signing
    When I check signature status
    Then I know which signers have signed and which are pending

  @US-10-2-4 @domain-10 @signature @validation
  Scenario: Verify All Signatures Complete
    # As a System, I want to verify when all required signatures are complete
    # so that the workflow can proceed
    Given a document requires multiple signatures
    When all signers have signed
    Then the document status changes to "Fully Executed"
    And the next workflow step is triggered

  @US-10-2-5 @domain-10 @signature @document
  Scenario: Resend Document Signing Request
    # As a Dealer, I want to resend the document signing request
    # so that homeowners who missed it can sign
    Given documents are pending signature
    When I resend the signing request
    Then the homeowner receives a new signing link
