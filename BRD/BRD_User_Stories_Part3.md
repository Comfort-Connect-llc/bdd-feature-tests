# Comfort Connect POS Platform - BRD Part 3
## Pricing, Credit, Verification & Documents

---

## Domain 7: Pricing & Quotes

### 7.1 Quote Generation

**US-7.1.1: Generate Payment Quote**
> As a **Dealer**, I want to generate a payment quote for a customer, so that they can see estimated monthly payments.

**Acceptance Criteria:**
- Given project amount and customer information
- When I generate a quote
- Then monthly payment amounts are calculated for available financing options
- And the quote displays term length, payment amount, and total cost

---

**US-7.1.2: Calculate Premier Program Payments**
> As a **System**, I want to calculate Premier Program monthly payments, so that accurate pricing is displayed.

**Acceptance Criteria:**
- Given project amount, term, and tax rate
- When payments are calculated
- Then the monthly payment includes equipment cost, service costs, and taxes
- And the calculation uses the correct pricing model

---

**US-7.1.3: Generate Quote with Bundles**
> As a **Dealer**, I want to create a quote with bundled equipment packages, so that customers see comprehensive pricing.

**Acceptance Criteria:**
- Given a predefined equipment bundle
- When I generate a quote with the bundle
- Then all bundle components are included
- And the total price reflects any bundle discounts

---

### 7.2 Pricing Configuration

**US-7.2.1: Configure Pricing Models**
> As an **Administrator**, I want to configure pricing models, so that quotes reflect current pricing strategies.

**Acceptance Criteria:**
- Given pricing parameters need to be updated
- When I configure pricing models
- Then new quotes use the updated pricing
- And existing committed quotes are not affected

---

**US-7.2.2: View Pricing Metrics**
> As an **Administrator**, I want to view pricing metrics and analytics, so that I can understand pricing performance.

**Acceptance Criteria:**
- Given pricing has been in use
- When I view pricing metrics
- Then I see analytics on average deal size, common terms, and utilization

---

### 7.3 Tax Management

**US-7.3.1: Retrieve Tax Rate by Location**
> As a **System**, I want to retrieve the applicable tax rate for an installation location, so that quotes and billing are accurate.

**Acceptance Criteria:**
- Given an installation address
- When the tax rate is requested
- Then the correct state/local tax rate is returned

---

**US-7.3.2: Handle Missing Tax Rate**
> As a **System**, I want to alert when a tax rate cannot be found, so that the issue can be resolved.

**Acceptance Criteria:**
- Given an installation address
- When no tax rate is found for the location
- Then the application status indicates "Missing Tax Rate"
- And the dealer is prompted to verify the address

---

---

## Domain 8: Credit & Underwriting

### 8.1 Credit Bureau Integration

**US-8.1.1: Perform Soft Credit Pull**
> As a **System**, I want to perform a soft credit pull for prequalification, so that applicant creditworthiness can be evaluated without impacting their credit score.

**Acceptance Criteria:**
- Given applicant personal information and consent
- When a soft credit pull is requested
- Then credit data is retrieved from the bureau
- And the inquiry does not appear on the applicant's credit report

---

**US-8.1.2: Perform Hard Credit Pull**
> As a **System**, I want to perform a hard credit pull when required for final loan decisions, so that complete credit evaluation can occur.

**Acceptance Criteria:**
- Given applicant authorization for a hard pull
- When a hard credit pull is executed
- Then complete credit data is retrieved
- And the inquiry is recorded on the applicant's credit report

---

**US-8.1.3: Store Credit Report**
> As a **System**, I want to store credit report information, so that it's available for underwriting review.

**Acceptance Criteria:**
- Given a credit pull has been completed
- When the report is received
- Then key credit data is stored securely
- And a PDF copy is saved for reference

---

**US-8.1.4: Detect Credit Freeze**
> As a **System**, I want to detect when an applicant has a credit freeze, so that they can be appropriately informed.

**Acceptance Criteria:**
- Given a credit pull is attempted
- When a credit freeze is detected
- Then the application is flagged as "Credit Freeze Detected"
- And the applicant is informed they need to lift the freeze

---

### 8.2 Automated Underwriting

**US-8.2.1: Evaluate Application Against Underwriting Rules**
> As a **System**, I want to evaluate applications against configured underwriting rules, so that consistent decisions are made.

**Acceptance Criteria:**
- Given an application with credit data
- When underwriting evaluation runs
- Then the application is checked against criteria including FICO score, DTI, charge-offs, and delinquencies
- And a decision (approve, decline, review) is rendered

---

**US-8.2.2: Apply Company-Specific Underwriting Rules**
> As a **System**, I want to apply company-specific underwriting configurations, so that different dealers can have customized criteria.

**Acceptance Criteria:**
- Given a company has custom underwriting configuration
- When an application from that company is evaluated
- Then the company-specific rules take precedence

---

**US-8.2.3: Calculate Debt-to-Income Ratio**
> As a **System**, I want to calculate the debt-to-income ratio, so that it can be used in underwriting decisions.

**Acceptance Criteria:**
- Given applicant income and credit data showing monthly obligations
- When DTI is calculated
- Then total monthly debt / monthly income is computed
- And the result is compared against DTI thresholds

---

**US-8.2.4: Determine Maximum Approval Amount**
> As a **System**, I want to calculate the maximum approval amount, so that applicants know their spending limit.

**Acceptance Criteria:**
- Given underwriting criteria and applicant profile
- When maximum amount is calculated
- Then the amount reflects income-based and credit-based limits
- And the lowest applicable limit is used

---

**US-8.2.5: Apply Decision Hierarchy**
> As a **System**, I want to apply decision hierarchy when multiple underwriting rules match, so that the most restrictive decision prevails.

**Acceptance Criteria:**
- Given an application matches multiple underwriting criteria groups
- When decisions are evaluated
- Then "reject" takes precedence over "review"
- And "review" takes precedence over "approved"
- And if no adverse groups match, the application is approved

---

### 8.3 Manual Underwriting

**US-8.3.1: Queue Application for Manual Review**
> As a **System**, I want to queue applications requiring manual review, so that underwriters can evaluate them.

**Acceptance Criteria:**
- Given an application triggers manual review criteria
- When the application is queued
- Then it appears in the underwriting review queue
- And priority is assigned based on criteria

---

**US-8.3.2: Review Manual Underwriting Case**
> As an **Underwriter**, I want to review applications requiring manual decisions, so that I can make informed credit decisions.

**Acceptance Criteria:**
- Given an application in the manual review queue
- When I review the case
- Then I can view complete credit report, application details, and underwriting rule matches
- And I can approve, approve with conditions, or decline

---

**US-8.3.3: Record Manual Underwriting Decision**
> As an **Underwriter**, I want to record my decision with rationale, so that there is an audit trail.

**Acceptance Criteria:**
- Given I have made a manual underwriting decision
- When I record my decision
- Then the decision, conditions, and rationale are saved
- And the homeowner and dealer are notified

---

---

## Domain 9: Income & Property Verification

### 9.1 Income Verification

**US-9.1.1: Request Income Verification**
> As a **System**, I want to initiate income verification when required, so that stated income can be validated.

**Acceptance Criteria:**
- Given underwriting or policy requires income verification
- When verification is requested
- Then the verification process is initiated
- And the application status reflects verification in progress

---

**US-9.1.2: Submit Income Documentation**
> As a **Homeowner**, I want to submit income documentation, so that my income can be verified.

**Acceptance Criteria:**
- Given income verification is required
- When I upload documents (pay stubs, tax returns, bank statements)
- Then the documents are securely stored
- And verification review can proceed

---

**US-9.1.3: Review Income Documentation**
> As an **Administrator**, I want to review income documentation, so that I can verify stated income.

**Acceptance Criteria:**
- Given income documents have been submitted
- When I review the documentation
- Then I can verify or reject the income verification
- And I can record the verified income amount

---

**US-9.1.4: Update Income Verification Status**
> As an **Administrator**, I want to update income verification status, so that the application can proceed.

**Acceptance Criteria:**
- Given income verification is in progress
- When I update the status (verified, failed, needs more info)
- Then the application status is updated
- And the applicant and dealer are notified

---

### 9.2 Property/Deed Verification

**US-9.2.1: Request Deed Verification**
> As a **System**, I want to initiate deed verification for Premier leases, so that property ownership is confirmed.

**Acceptance Criteria:**
- Given a Premier enrollment requires deed verification
- When verification is requested
- Then the verification process is initiated
- And the status reflects "Deed Verification in Progress"

---

**US-9.2.2: Verify Property Ownership**
> As an **Administrator**, I want to verify property ownership, so that leases are properly secured.

**Acceptance Criteria:**
- Given deed verification is in progress
- When I confirm property ownership matches the applicant
- Then the verification status is updated to "Verified"
- And installation can be authorized

---

**US-9.2.3: Handle Deed Verification Failure**
> As a **System**, I want to handle failed deed verification, so that appropriate action can be taken.

**Acceptance Criteria:**
- Given deed verification has failed
- When the failure is recorded
- Then the applicant and dealer are notified
- And the application is held pending resolution

---

**US-9.2.4: Check Active Property Listings**
> As a **System**, I want to check for active property listings, so that leases are not made on properties being sold.

**Acceptance Criteria:**
- Given a property address
- When active listings are checked
- Then any active listings are flagged
- And additional review is triggered if found

---

---

## Domain 10: Document Management & E-Signatures

### 10.1 Document Generation

**US-10.1.1: Generate Lease Agreement**
> As a **System**, I want to generate a lease agreement based on application details, so that accurate contracts are created.

**Acceptance Criteria:**
- Given a Premier enrollment with finalized terms
- When the lease agreement is generated
- Then the document includes homeowner information, equipment details, payment terms, and all required disclosures

---

**US-10.1.2: Generate Merchant Agreement**
> As a **System**, I want to generate a merchant agreement for dealers, so that partnership terms are documented.

**Acceptance Criteria:**
- Given a dealer application has been approved
- When the merchant agreement is generated
- Then the document includes all partnership terms
- And is ready for electronic signature

---

**US-10.1.3: Generate Adverse Action Letter**
> As a **System**, I want to generate adverse action letters for declined applications, so that legal requirements are met.

**Acceptance Criteria:**
- Given an application has been declined
- When the adverse action letter is generated
- Then it includes specific reasons, credit bureau contact info, and applicant rights
- And is delivered via required channels

---

**US-10.1.4: Generate Buyout Letter**
> As a **System**, I want to generate a buyout letter when requested, so that lease buyout terms are documented.

**Acceptance Criteria:**
- Given a buyout has been requested
- When the buyout letter is generated
- Then it includes the buyout amount and terms
- And is delivered to the homeowner

---

### 10.2 Electronic Signatures

**US-10.2.1: Send Document for E-Signature**
> As a **System**, I want to send documents for electronic signature, so that agreements can be executed remotely.

**Acceptance Criteria:**
- Given a document is ready for signing
- When I send it for e-signature
- Then the recipient receives an email with a signing link
- And they can review and sign electronically

---

**US-10.2.2: Sign Document Electronically**
> As a **Signer**, I want to sign documents electronically, so that I can complete agreements conveniently.

**Acceptance Criteria:**
- Given I have received a signing link
- When I access the document and complete the signature process
- Then my electronic signature is captured
- And I receive a copy of the signed document

---

**US-10.2.3: Track Signature Status**
> As a **System**, I want to track document signature status, so that incomplete signings can be followed up.

**Acceptance Criteria:**
- Given documents have been sent for signing
- When I check signature status
- Then I know which signers have signed and which are pending

---

**US-10.2.4: Verify All Signatures Complete**
> As a **System**, I want to verify when all required signatures are complete, so that the workflow can proceed.

**Acceptance Criteria:**
- Given a document requires multiple signatures
- When all signers have signed
- Then the document status changes to "Fully Executed"
- And the next workflow step is triggered

---

**US-10.2.5: Resend Document Signing Request**
> As a **Dealer**, I want to resend the document signing request, so that homeowners who missed it can sign.

**Acceptance Criteria:**
- Given documents are pending signature
- When I resend the signing request
- Then the homeowner receives a new signing link

---

### 10.3 Document Storage & Retrieval

**US-10.3.1: Store Signed Documents**
> As a **System**, I want to store signed documents securely, so that they are available for reference and compliance.

**Acceptance Criteria:**
- Given a document has been fully executed
- When it is stored
- Then it is associated with the correct account/company
- And is retrievable by authorized users

---

**US-10.3.2: Download Document**
> As a **User**, I want to download documents associated with my account, so that I have copies for my records.

**Acceptance Criteria:**
- Given I have access to an account
- When I request to download a document
- Then the document is downloaded in PDF format

---

**US-10.3.3: Upload Supporting Documents**
> As a **User**, I want to upload supporting documents to an account, so that all relevant documentation is in one place.

**Acceptance Criteria:**
- Given I need to upload a document
- When I select and upload the file
- Then the document is attached to the account
- And is viewable by authorized users
