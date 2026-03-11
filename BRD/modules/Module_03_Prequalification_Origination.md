---
figma:
  file: "https://www.figma.com/file/FIGMA_FILE_ID/Comfort-Connect-Platform"
  page: "Module 03 - Prequalification & Origination"
  frames:
    - id: "overview"
      name: "Module 03 - Prequalification & Origination Overview"
      url: "TODO"
---

# Module 3: Prequalification & Origination
## Application Lifecycle for All Financing Products

**Version:** 1.0  
**Date:** February 12, 2026  
**Stories:** 68

---

## Overview

Core business module managing the complete application lifecycle from prequalification through offer acceptance. Supports all financing products: Premier Program (in-house), Loan Partners (Momnt, Thrive), and LTO Partners (Microf, Breeze).

**Key Capabilities:**
- Prequalification invitations and soft credit checks
- Multi-product eligibility display
- Premier Program full application lifecycle
- Automated and manual underwriting decisions
- Offer selection and comparison
- Work order and equipment configuration
- Partner loan flows (Momnt, Thrive)
- Partner LTO flows (Microf, Breeze)
- First payment collection
- Dealer-branded customer application rendering

---

## 3.1 Prequalification Invitation

**US-3.1.1: Send Prequalification Invitation**
> As a **Dealer**, I want to send a prequalification invitation to a prospective customer, so that they can check their financing eligibility.

**Acceptance Criteria:**
- Given I have a customer's name, email, and/or phone number
- When I send a prequalification invitation
- Then the customer receives a link via email and/or SMS
- And the invitation is tracked in my pipeline

---

**US-3.1.2: Access Prequalification via Link**
> As a **Homeowner**, I want to access the prequalification form via the link I received, so that I can check my financing eligibility.

**Acceptance Criteria:**
- Given I received a prequalification invitation
- When I click the link
- Then I am taken to a secure prequalification form
- And I see the dealer's approved branding (logo, tagline, and brand colors per US-3.1.8) or the default Comfort Connect branding if no approved brand profile exists

---

**US-3.1.3: Request Authorization for Assisted Application**
> As a **Dealer**, I want to request a homeowner's authorization to complete the application on their behalf, so that I can assist customers who need help navigating the application process.

**Acceptance Criteria:**
- Given I am sending or have sent a prequalification invitation to a homeowner
- When I request assisted application authorization
- Then the homeowner receives an authorization request via SMS and/or email
- And the request clearly explains that the dealer will be able to fill out and submit the application on their behalf
- And the request specifies that the homeowner will still be required to sign all documents themselves

---

**US-3.1.4: Verify and Grant Assisted Application Authorization**
> As a **Homeowner**, I want to verify my identity and grant my dealer authorization to complete the application on my behalf, so that they can help me through the process.

**Acceptance Criteria:**
- Given I have received an assisted application authorization request
- When I verify my identity via OTP sent to my registered phone number and/or email
- Then my authorization is recorded with a timestamp and verification method
- And the dealer is notified that they can now complete the application on my behalf
- And I receive confirmation that authorization has been granted
- And I can revoke this authorization at any time before document signing

---

**US-3.1.5: Complete Application on Behalf of Homeowner**
> As a **Dealer**, I want to fill out and submit the application on behalf of an authorized homeowner, so that I can help them complete the process efficiently.

**Acceptance Criteria:**
- Given the homeowner has granted me assisted application authorization
- When I access the application in assisted mode
- Then I can enter and submit all application information on the homeowner's behalf
- And the application is clearly flagged as dealer-assisted for audit purposes
- And the homeowner is notified at each major step (submission, decision)
- And document signing requests are sent directly to the homeowner — I cannot sign on their behalf

---

**US-3.1.6: Send Bulk Prequalification Invitations**
> As a **Dealer**, I want to send prequalification invitations to multiple prospective customers at once, so that I can efficiently reach a group of leads without sending each invitation individually.

**Acceptance Criteria:**
- Given I have a list of prospective customers with names and email addresses and/or phone numbers
- When I upload or enter multiple contacts and send bulk invitations
- Then each customer receives an individual prequalification link via email and/or SMS
- And each invitation is tracked separately in my pipeline
- And I can view a summary of sent, delivered, opened, and completed invitations from the batch
- And duplicate contacts (same email or phone) are flagged before sending

---

**US-3.1.7: Auto-Save Application Progress for Dealer**
> As a **Dealer**, I want my in-progress application work to be automatically saved as I enter information, so that I don't lose data if I navigate away, lose connectivity, or need to pause and return later.

**Acceptance Criteria:**
- Given I am creating or editing a Premier, Loan, or LTO application on behalf of a customer
- When I enter information into any application field
- Then my progress is automatically saved at regular intervals (e.g., every 30 seconds) and on any field change
- And if I navigate away from the application or my session is interrupted, I can resume from where I left off
- And auto-saved applications are clearly marked as "Draft" in my pipeline
- And drafts that have not been submitted within a configurable period are flagged for follow-up

---

**US-3.1.8: Render Dealer-Branded Customer Application Experience**
> As a **Homeowner**, I want the prequalification and application screens to display my contractor's branding (logo, tagline, and colors), so that the experience feels connected to the company I'm working with and builds my confidence that I'm in the right place.

**Acceptance Criteria:**
- Given I have accessed the prequalification or application flow through a dealer-specific invitation link
- When the application screens load
- Then the dealer's approved logo is displayed in the header area of every step in the flow (Step 1: Get Pre-Qualified, Step 2: Add Project Details, and any subsequent screens)
- And the dealer's tagline is displayed below the logo
- And the dealer's primary brand color is applied to: the primary action button (e.g., "Next," "Submit"), the progress stepper/indicator, and section headers
- And the dealer's accent color is applied to: hyperlinks, secondary highlights, and hover states
- And all other UI elements (form fields, labels, layout, fonts, content, and field ordering) remain standard across the platform and are not dealer-customizable
- And if the dealer does not have an approved brand profile, the default Comfort Connect platform branding is rendered (Comfort Connect logo, standard colors)
- And the branding is consistent across desktop and mobile views — the logo scales appropriately and colors render correctly on both
- And branding assets (logo, colors) are cached for performance so they do not delay page load
- And the Comfort Connect footer attribution ("Powered by Comfort Connect" or equivalent) remains visible on all branded screens regardless of dealer customization

---

## 3.2 Prequalification Application

**US-3.2.1: Provide Consent for Credit Check**
> As a **Homeowner**, I want to provide consent for a soft credit check, so that my financing eligibility can be determined without impacting my credit score.

**Acceptance Criteria:**
- Given I am completing a prequalification
- When I review and accept the credit check disclosure
- Then my consent is recorded with a timestamp

---

**US-3.2.2: Submit Prequalification Information**
> As a **Homeowner**, I want to submit my personal and financial information, so that my financing eligibility can be evaluated.

**Acceptance Criteria:**
- Given I have consented to a credit check
- When I provide my information (name, DOB, SSN, address, income)
- Then my prequalification is submitted for evaluation

---

**US-3.2.3: Add Co-Applicant to Prequalification**
> As a **Homeowner**, I want to add a co-applicant to my prequalification, so that our combined financial profile can be evaluated.

**Acceptance Criteria:**
- Given I am completing a prequalification
- When I choose to add a co-applicant and provide their information
- Then both applicants' information is submitted together

---

**US-3.2.4: Preserve Primary Applicant Data During Co-Applicant Submission**
> As the **System**, I want to ensure that when a co-applicant is added during the application submission process, the primary applicant's data (name, SSN, DOB, address, income, and contact information) is never overwritten or replaced by co-applicant data, so that both applicant records remain accurate and distinct throughout the application lifecycle.

**Acceptance Criteria:**
- Given a primary applicant has completed their portion of the application
- When a co-applicant's information is submitted (via the same session or a separate co-applicant flow)
- Then the primary applicant's data remains unchanged in all system fields (name, SSN, DOB, address, income, contact info)
- And the co-applicant's data is stored in distinct co-applicant fields, never mapped to or merged with primary applicant fields
- And the correct applicant data (primary vs. co-applicant) is transmitted in the appropriate fields for any partner API submissions (Momnt, Breeze, Microf)
- And both applicant records are independently viewable on the account by CSRs
- And the application submission process includes server-side validation that rejects any payload where the primary applicant ID would be overwritten
- And an audit log entry is created if any data correction is made to either applicant record
- And existing affected accounts are identified and flagged for manual data review

---

## 3.3 Prequalification Decision

**US-3.3.1: Receive Prequalification Decision**
> As a **Homeowner**, I want to receive my prequalification decision immediately, so that I know what financing options are available to me.

**Acceptance Criteria:**
- Given I have submitted my prequalification
- When the evaluation is complete
- Then I see my decision (Approved, Declined, or Review Required)
- And if approved, I see my estimated approval amount

---

**US-3.3.2: View Available Financing Products**
> As a **Homeowner**, I want to see which financing products I qualify for, so that I can understand my options.

**Acceptance Criteria:**
- Given I am prequalified
- When I view my results
- Then I see all available products (Premier, Loan, LTO) I qualify for
- And I see the maximum amount available for each

---

**US-3.3.3: Generate Adverse Action Notice**
> As a **System**, I want to generate and deliver adverse action notices when required, so that declined applicants receive legally required disclosures.

**Acceptance Criteria:**
- Given an applicant has been declined
- When the decision is rendered
- Then an adverse action letter is generated with reasons and rights information
- And the letter is delivered via email and/or mail

---

**US-3.3.4: Convert Prequalification to Application**
> As a **Dealer**, I want to convert a prequalified customer to a full application, so that I can proceed with their financing.

**Acceptance Criteria:**
- Given a customer has been prequalified
- When I initiate a full application
- Then the prequalification information auto-populates
- And I can add equipment and project details

---

## 3.4 Premier Program - Application Creation

**US-3.4.1: Create Premier Application**
> As a **Dealer**, I want to create a new Premier Program application for a homeowner, so that I can offer them Comfort Connect's all-inclusive home comfort solution.

**Acceptance Criteria:**
- Given I am an enrolled Premier dealer
- When I create a new application
- Then an application record is created
- And I can enter homeowner information

---

**US-3.4.2: Send Application Invitation to Homeowner**
> As a **Dealer**, I want to send an application invitation to the homeowner, so that they can complete their portion of the application.

**Acceptance Criteria:**
- Given I have created an application with homeowner contact info
- When I send the invitation
- Then the homeowner receives a link via email/SMS
- And the application status changes to "Invitation Sent"

---

**US-3.4.3: Submit Application for Underwriting**
> As a **Homeowner**, I want to submit my application, so that Comfort Connect can evaluate my eligibility for the Premier Program.

**Acceptance Criteria:**
- Given I have completed all required application fields
- When I submit my application
- Then my credit is evaluated (soft pull)
- And I receive a decision within seconds

---

**US-3.4.4: Apply for Additional System**
> As a **Homeowner**, I want to apply for an additional system from my account portal, so that I can finance new equipment without going through a separate dealer invitation process.

**Acceptance Criteria:**
- Given I have an active Premier account in good standing
- When I initiate a new application for an additional system
- Then my existing profile information is pre-populated
- And I can select a dealer or be matched with my existing contractor
- And the application follows the standard prequalification and origination flow

---

**US-3.4.5: Select Project Type for Premier Application**
> As a **Dealer**, I want to select a project type (e.g., Standard, Geothermal) when creating a Premier application, so that the application flow, lease structure, and document requirements automatically adjust based on the type of installation.

**Acceptance Criteria:**
- Given I am creating a new Premier Program application
- When I select a project type from the available options
- Then the application flow adjusts to collect information specific to that project type
- And the work order section reflects the required lease components (e.g., Geothermal shows separate Equipment and Ground Loop sections)
- And pricing and quote generation use the correct lease structure for the selected project type
- And only project types I am authorized to offer (based on my dealer enrollment) are available for selection

---

## 3.5 Premier Program - Underwriting Decisions

**US-3.5.1: Receive Automatic Approval**
> As a **Homeowner**, I want to receive automatic approval when I qualify, so that I can proceed immediately with my home comfort purchase.

**Acceptance Criteria:**
- Given my application has been submitted
- When the automated underwriting approves my application
- Then I see my approval amount and available offers
- And the dealer is notified of my approval
- And the application status changes to "Underwriting Approved"

---

**US-3.5.2: Receive Approval for Less**
> As a **Homeowner**, I want to be informed when I am approved for less than requested, so that I can adjust my equipment selection.

**Acceptance Criteria:**
- Given my application has been submitted
- When I am approved for an amount less than the project total
- Then I see my maximum approval amount
- And I am informed I need to reduce my project cost or add down payment
- And the status changes to "Underwriting Approved for Less"

---

**US-3.5.3: Route Application for Manual Review**
> As a **System**, I want to route applications that don't meet automatic approval criteria to manual review, so that borderline cases get human evaluation.

**Acceptance Criteria:**
- Given an application has been submitted
- When automated underwriting determines manual review is required
- Then the application is queued for underwriter review
- And the homeowner and dealer are informed
- And the status changes to "In Manual Review"

---

**US-3.5.4: Complete Manual Underwriting Review**
> As an **Underwriter**, I want to review applications requiring manual underwriting, so that I can make informed decisions.

**Acceptance Criteria:**
- Given an application is in manual review
- When I review the credit report, income, and other factors
- Then I can approve, approve for less, or decline
- And my decision and rationale are recorded

---

**US-3.5.5: Handle Credit Freeze Detection**
> As a **System**, I want to detect when an applicant has a credit freeze, so that they can be informed to lift it.

**Acceptance Criteria:**
- Given an application has been submitted
- When a credit freeze is detected during credit pull
- Then the application status changes to "Credit Freeze Detected"
- And the applicant is provided instructions on how to proceed

---

**US-3.5.6: Decline Application**
> As a **System**, I want to decline applications that don't meet approval criteria, so that applicants receive adverse action notices.

**Acceptance Criteria:**
- Given an application has been evaluated
- When it does not meet approval criteria
- Then the status changes to "Premier Program Declined"
- And an adverse action notice is generated and sent

---

## 3.6 Premier Program - Offer Selection

**US-3.6.1: Select Premier Offer**
> As a **Homeowner**, I want to select my preferred Premier Program offer, so that I can proceed with enrollment.

**Acceptance Criteria:**
- Given I have been approved for the Premier Program
- When I view and select from available offers
- Then my selection is recorded
- And the status changes to "Premier Offer Selected"

---

**US-3.6.2: View Partner Financing Offers**
> As a **Homeowner**, I want to view alternative financing offers from partner lenders, so that I can choose the best option.

**Acceptance Criteria:**
- Given I am on the offer selection screen
- When partner financing options are available
- Then I can view and compare monthly payments, terms, and total cost

---

## 3.7 Premier Program - Work Order & Quote

**US-3.7.1: Add Work Order Details**
> As a **Dealer**, I want to add work order details including equipment and installation information, so that the lease agreement reflects the actual project.

**Acceptance Criteria:**
- Given the homeowner has selected a Premier offer
- When I enter work order details (equipment, installation date, total)
- Then the work order is saved
- And the status changes to "Work Order Saved"

---

**US-3.7.2: Modify Quote**
> As a **Dealer**, I want to modify the quote if equipment or pricing changes, so that the agreement reflects the actual project.

**Acceptance Criteria:**
- Given a work order has been saved
- When I modify the quote details
- Then the payment amounts are recalculated
- And the homeowner sees updated terms

---

**US-3.7.3: Update Tax Rate**
> As a **System**, I want to apply the correct tax rate based on installation location, so that billing amounts are accurate.

**Acceptance Criteria:**
- Given an installation address has been provided
- When the system looks up the applicable tax rate
- Then the correct tax rate is applied to calculations

---

## 3.8 Premier Program - Document Signing

**US-3.8.1: Request Lease Document Signing**
> As a **Dealer**, I want to send the lease agreement to the homeowner for signing, so that we can formalize the Premier enrollment.

**Acceptance Criteria:**
- Given the work order has been saved
- When I request document signing
- Then the lease agreement is generated
- And the homeowner receives a signing link
- And the status changes to "Pending Document Sign"

---

**US-3.8.2: Sign Lease Agreement Electronically**
> As a **Homeowner**, I want to review and sign my lease agreement electronically, so that I can complete enrollment conveniently.

**Acceptance Criteria:**
- Given I have received a signing link
- When I review and sign all required documents
- Then my signature is captured and verified
- And I receive a copy of the signed documents

---

**US-3.8.3: Verify Document Signatures**
> As a **System**, I want to verify that all required signatures have been obtained, so that the enrollment can proceed.

**Acceptance Criteria:**
- Given documents have been sent for signing
- When all parties (primary, co-applicant if any) have signed
- Then the application status updates accordingly

---

## 3.9 Premier Program - First Payment

**US-3.9.1: Make First Month Payment**
> As a **Homeowner**, I want to make my first month's payment, so that my Premier enrollment is activated.

**Acceptance Criteria:**
- Given I have signed my lease agreement
- When I provide payment via the payment portal
- Then my first payment is processed
- And I receive a receipt
- And the status changes to "Ready for Installation"

---

**US-3.9.2: View Payment Confirmation**
> As a **Dealer**, I want to see confirmation that the homeowner's first payment was received, so that I can proceed with installation.

**Acceptance Criteria:**
- Given the homeowner has made their first payment
- When I view the application
- Then I see payment confirmation

---

## 3.10 Premier Program - Verification Requirements

**US-3.10.1: Initiate Deed Verification**
> As a **System**, I want to verify property ownership before installation authorization, so that lease agreements are properly secured.

**Acceptance Criteria:**
- Given an enrollment requires deed verification
- When the verification is initiated
- Then the status shows "Deed Verification in Progress"
- And installation authorization is held pending verification

---

**US-3.10.2: Update Deed Verification Status**
> As an **Administrator**, I want to update the deed verification status, so that enrollment can proceed once verified.

**Acceptance Criteria:**
- Given deed verification is in progress
- When I update the verification status
- Then if verified, installation authorization can proceed

---

**US-3.10.3: Initiate Income Verification**
> As a **System**, I want to verify income when required by underwriting, so that approval decisions are supported.

**Acceptance Criteria:**
- Given an enrollment requires income verification
- When the verification is initiated
- Then the status shows "Income Verification in Progress"

---

**US-3.10.4: Update Income Verification Status**
> As an **Administrator**, I want to update income verification status, so that enrollment can proceed once verified.

**Acceptance Criteria:**
- Given income verification is in progress
- When I update the verification status with results
- Then the application can proceed

---

## 3.11 Premier Program - Application Management

**US-3.11.1: Withdraw Application**
> As a **Homeowner**, I want to withdraw my application, so that I am not obligated to proceed if I change my mind.

**Acceptance Criteria:**
- Given I have an active application that has not been funded
- When I request to withdraw
- Then my application status changes to "Application Withdrawn"
- And the dealer is notified

---

**US-3.11.2: Request Application Cancellation**
> As a **Dealer**, I want to request cancellation of an application, so that I can close out deals that won't proceed.

**Acceptance Criteria:**
- Given I have an active application
- When I request cancellation
- Then the status changes to "Cancellation Requested"

---

**US-3.11.3: Cancel Application**
> As an **Administrator**, I want to cancel an application, so that it is properly closed in the system.

**Acceptance Criteria:**
- Given a cancellation is appropriate
- When I cancel the application
- Then the status changes to "Application Cancelled"
- And all parties are notified

---

## 3.12 Loan Partners - Momnt Loan Flow

**US-3.12.1: Initiate Momnt Loan Application**
> As a **System**, I want to submit an application to Momnt when the homeowner selects a Momnt loan offer, so that they can obtain consumer financing.

**Acceptance Criteria:**
- Given a homeowner has selected a Momnt loan offer
- When the Momnt application is initiated
- Then the applicant information is submitted to Momnt
- And the application status reflects the Momnt flow

---

**US-3.12.2: Approve Momnt Hard Credit Pull**
> As a **Homeowner**, I want to authorize a hard credit pull for my loan application, so that I can receive a final loan decision.

**Acceptance Criteria:**
- Given I am applying for a Momnt loan
- When I authorize the hard credit pull
- Then the hard pull is executed
- And I receive a final loan decision

---

**US-3.12.3: Receive Momnt Loan Decision**
> As a **Homeowner**, I want to receive my Momnt loan decision, so that I know if I can proceed with financing.

**Acceptance Criteria:**
- Given a hard pull has been authorized
- When Momnt returns a decision
- Then the decision (approved, declined, review) is displayed

---

**US-3.12.4: Submit Momnt Final Application**
> As a **Homeowner**, I want to complete my Momnt loan application, so that my loan can be processed.

**Acceptance Criteria:**
- Given I have been approved for a Momnt loan
- When I complete the final application
- Then my application is submitted for final review

---

**US-3.12.5: Accept Momnt Loan Offer**
> As a **Homeowner**, I want to accept my Momnt loan offer, so that I can finalize my financing.

**Acceptance Criteria:**
- Given my Momnt application has been approved
- When I accept the loan terms
- Then my acceptance is recorded
- And the loan proceeds to funding preparation

---

**US-3.12.6: Cancel Momnt Application**
> As a **Homeowner**, I want to cancel my Momnt application, so that I can pursue other financing options.

**Acceptance Criteria:**
- Given I have an active Momnt application
- When I cancel the application
- Then the cancellation is submitted to Momnt
- And the status changes to "Loan Application Cancelled"

---

**US-3.12.7: Capture Planned Installation Date for Momnt Loan**
> As a **Dealer**, I want to enter the planned installation date after a homeowner accepts a Momnt loan offer, so that the platform can determine the appropriate charge request timing and set expectations for all parties.

**Acceptance Criteria:**
- Given a homeowner has accepted a Momnt loan offer (US-3.12.5)
- When the dealer views the application post-acceptance
- Then the dealer is prompted to enter the planned installation date
- And the date must be today or a future date
- And the dealer can update the planned installation date until the charge request has been initiated
- And the planned installation date is stored on the application record and visible to administrators
- And the platform uses the planned installation date in conjunction with charge timing rules (US-12.3.6) to determine whether to recommend immediate charge initiation or scheduled charge

---

## 3.13 Loan Partners - Thrive Loan Flow

**US-3.13.1: Initiate Thrive Loan Application**
> As a **System**, I want to submit an application to Thrive when selected, so that the homeowner can obtain Thrive financing.

**Acceptance Criteria:**
- Given a homeowner has selected a Thrive loan offer
- When the Thrive application is initiated
- Then the applicant information is submitted to Thrive

---

**US-3.13.2: Submit Thrive Final Application**
> As a **Homeowner**, I want to complete my Thrive loan application, so that my loan can be processed.

**Acceptance Criteria:**
- Given I am in the Thrive application flow
- When I complete the required steps
- Then my application is submitted for review

---

**US-3.13.3: Receive Thrive Loan Decision**
> As a **Homeowner**, I want to receive my Thrive loan decision, so that I can proceed with installation.

**Acceptance Criteria:**
- Given my Thrive application has been reviewed
- When a decision is rendered
- Then I see my approval status and terms

---

## 3.14 LTO Partners - Microf LTO Flow

**US-3.14.1: Initiate Microf Application**
> As a **System**, I want to submit an application to Microf when selected, so that the homeowner can obtain LTO financing.

**Acceptance Criteria:**
- Given a homeowner has selected a Microf LTO offer
- When the Microf application is initiated
- Then an application ID is returned
- And the status reflects the Microf flow

---

**US-3.14.2: Accept Microf Lease Offer**
> As a **Homeowner**, I want to accept my Microf lease offer and sign the agreement, so that my LTO is finalized.

**Acceptance Criteria:**
- Given I have been approved by Microf
- When I accept the lease terms and complete signing
- Then my acceptance is recorded

---

**US-3.14.3: Submit Income Proof for Microf**
> As a **Homeowner**, I want to submit income verification documents, so that my Microf application can be approved.

**Acceptance Criteria:**
- Given Microf requires income verification
- When I upload proof of income documents
- Then the documents are submitted to Microf

---

**US-3.14.4: Verify Microf Income Proof Status**
> As a **System**, I want to check the status of income verification with Microf, so that the application can proceed when verified.

**Acceptance Criteria:**
- Given income proof has been submitted
- When I check verification status
- Then the application status is updated accordingly

---

**US-3.14.5: Complete Microf Work Order**
> As a **Dealer**, I want to notify Microf that installation is complete, so that funding can be requested.

**Acceptance Criteria:**
- Given installation has been completed
- When I submit the completion notification
- Then Microf is notified
- And the funding process is initiated

---

**US-3.14.6: Refresh Microf Application Status**
> As a **System**, I want to periodically refresh application status from Microf, so that the platform reflects current state.

**Acceptance Criteria:**
- Given an active Microf application
- When the status is refreshed
- Then any status changes from Microf are captured

---

## 3.15 LTO Partners - Breeze LTO Flow

**US-3.15.1: Create Breeze Application**
> As a **System**, I want to submit an application to Breeze/Okinus when selected, so that the homeowner can obtain Breeze LTO financing.

**Acceptance Criteria:**
- Given a homeowner has selected a Breeze LTO offer
- When the Breeze application is submitted
- Then an application is created with Breeze

---

**US-3.15.2: Initiate Breeze Checkout**
> As a **System**, I want to create a checkout session with Breeze, so that the homeowner can complete their LTO agreement.

**Acceptance Criteria:**
- Given a Breeze application has been approved
- When checkout is initiated
- Then a checkout session is created

---

**US-3.15.3: Calculate Breeze Lease Terms**
> As a **System**, I want to calculate Breeze lease terms, so that accurate payment information is displayed.

**Acceptance Criteria:**
- Given cart items and applicant information
- When lease terms are calculated
- Then payment amount, term, and down payment are returned

---

**US-3.15.4: Process Breeze Down Payment**
> As a **Homeowner**, I want to make my Breeze down payment, so that my LTO can be finalized.

**Acceptance Criteria:**
- Given I have accepted Breeze terms
- When I complete the down payment
- Then my payment is processed
- And the LTO agreement is executed

---

**US-3.15.5: Sign Breeze Contract**
> As a **Homeowner**, I want to sign my Breeze LTO contract, so that my agreement is finalized.

**Acceptance Criteria:**
- Given I have made my down payment
- When I complete the e-signature process
- Then my contract is executed

---

**US-3.15.6: Request Breeze Funding**
> As a **Dealer**, I want to request funding from Breeze after installation, so that I receive payment.

**Acceptance Criteria:**
- Given installation has been completed
- When I submit the delivery date and equipment details
- Then Breeze initiates the funding process

---

**US-3.15.7: Cancel Breeze Funding Request**
> As a **Dealer**, I want to cancel a Breeze funding request, so that I can make corrections if needed.

**Acceptance Criteria:**
- Given a funding request has been submitted
- When I cancel the request with a reason
- Then the funding request is cancelled

---

**US-3.15.8: Cancel Breeze Lease**
> As an **Administrator**, I want to cancel a Breeze lease, so that agreements that won't proceed are closed.

**Acceptance Criteria:**
- Given an active Breeze application
- When I cancel the lease with a reason
- Then the lease is cancelled with Breeze
