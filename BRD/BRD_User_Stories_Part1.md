# Comfort Connect POS Origination Platform
# Business Requirements Document (BRD) - Part 1
## Expressed as User Stories

**Version:** 1.0  
**Date:** February 3, 2026  

---

## Executive Summary

Comfort Connect is a B2B2C consumer finance company providing a point-of-sale (POS) financing platform for home comfort contractors. The platform enables dealers/contractors to offer multiple financing options to homeowners purchasing home comfort systems.

**Key Differentiator:** The **Premier Program** is Comfort Connect's proprietary all-inclusive home comfort solution—a single monthly payment (typically ~8 years) that includes the system, parts, service, and maintenance.

**Financing Products:**
| Product | Type | Provider |
|---------|------|----------|
| Premier Program | Lease | Comfort Connect (In-house) |
| Momnt | Consumer Loan | External Partner |
| Thrive | Consumer Loan | External Partner |
| Microf | Lease-to-Own | External Partner |
| Breeze | Lease-to-Own | External Partner (Okinus) |

**User Personas:**
- **Dealer/Contractor** - Uses platform to offer financing to homeowners
- **Homeowner** - Consumer seeking financing
- **Co-Applicant** - Secondary applicant on application
- **Customer Service Representative** - Internal staff servicing accounts
- **Underwriter** - Reviews manual underwriting cases
- **Administrator** - Platform configuration and management

---

## Domain 1: Dealer/Contractor Onboarding

### 1.1 Merchant Application

**US-1.1.1: Invite Dealer to Apply**
> As an **Administrator**, I want to send an application invitation to a prospective dealer, so that they can begin the onboarding process.

**Acceptance Criteria:**
- Given a valid dealer contact email and business name
- When I send a merchant application invitation
- Then the dealer receives an email with a secure link to begin their application
- And the application record is created with status "Invitation Sent"

---

**US-1.1.2: Save Application Progress**
> As a **Dealer**, I want to save my application progress at any time, so that I can complete it later without losing my information.

**Acceptance Criteria:**
- Given I am completing my merchant application
- When I save my progress
- Then all entered information is preserved
- And I can resume from where I left off

---

**US-1.1.3: Submit Merchant Application**
> As a **Dealer**, I want to submit my completed merchant application, so that Comfort Connect can review my business for approval.

**Acceptance Criteria:**
- Given I have completed all required fields including business details, tax ID, banking information, and owner information
- When I submit my application
- Then the application status changes to "Submitted"
- And I receive confirmation that my application is under review

---

### 1.2 Merchant Agreement & NDA

**US-1.2.1: Generate NDA for Signing**
> As a **System**, I want to automatically generate an NDA when a dealer begins onboarding, so that confidential information is protected.

**Acceptance Criteria:**
- Given a dealer has started the onboarding process
- When the system generates the NDA document
- Then the NDA is pre-populated with the dealer's business information
- And the document is sent for electronic signature

---

**US-1.2.2: Sign Merchant Agreement**
> As a **Dealer**, I want to review and electronically sign the merchant agreement, so that I can formalize my partnership with Comfort Connect.

**Acceptance Criteria:**
- Given my merchant application has been approved
- When I receive the merchant agreement for signing
- Then I can review all terms and conditions
- And I can electronically sign the agreement
- And upon signing, I receive a copy of the executed agreement

---

**US-1.2.3: Verify Document Signatures**
> As a **System**, I want to verify that all required signatures have been obtained on merchant documents, so that the onboarding can proceed.

**Acceptance Criteria:**
- Given a merchant agreement or NDA has been sent for signing
- When all required parties have signed
- Then the document status is updated to "Fully Executed"
- And the onboarding workflow advances to the next step

---

### 1.3 Merchant Underwriting

**US-1.3.1: Complete Merchant Underwriting Review**
> As an **Underwriter**, I want to review a dealer's application and supporting documentation, so that I can determine their eligibility to join the platform.

**Acceptance Criteria:**
- Given a merchant application has been submitted
- When I review the application details and financial information
- Then I can approve, decline, or request additional information
- And my decision and rationale are recorded

---

**US-1.3.2: Request Additional Onboarding Documents**
> As an **Underwriter**, I want to request additional documents from a dealer, so that I can complete my review.

**Acceptance Criteria:**
- Given I am reviewing a merchant application
- When I request additional documents
- Then the dealer receives a notification specifying what is needed
- And the application status reflects "Documents Requested"

---

**US-1.3.3: Upload Onboarding Documents**
> As a **Dealer**, I want to upload requested documents, so that my application review can be completed.

**Acceptance Criteria:**
- Given I have received a request for additional documents
- When I upload the requested files
- Then the files are attached to my application
- And the underwriting team is notified

---

### 1.4 Partner Enrollment

**US-1.4.1: Enroll Dealer in Premier Program**
> As an **Administrator**, I want to enroll an approved dealer in the Premier Program, so that they can offer Premier leases to their customers.

**Acceptance Criteria:**
- Given a dealer has been approved
- When I activate their Premier enrollment
- Then the dealer can create Premier applications for homeowners
- And Premier appears as an available financing option

---

**US-1.4.2: Initiate Momnt Partner Enrollment**
> As a **Dealer**, I want to enroll in the Momnt loan program, so that I can offer consumer loans to my customers.

**Acceptance Criteria:**
- Given I am an approved Comfort Connect dealer
- When I initiate Momnt enrollment
- Then I receive an invitation to complete Momnt's enrollment process
- And my enrollment status is tracked

---

**US-1.4.3: Set Up Bank Account for Momnt**
> As a **Dealer**, I want to set up my bank account with Momnt, so that I can receive loan funding payments.

**Acceptance Criteria:**
- Given I am enrolling in the Momnt program
- When I provide my bank account details
- Then Momnt initiates micro-deposit verification
- And I can verify the deposits to complete bank verification

---

**US-1.4.4: Verify Momnt Micro-Deposits**
> As a **Dealer**, I want to verify the micro-deposit amounts sent to my bank account, so that my bank account is confirmed.

**Acceptance Criteria:**
- Given Momnt has sent micro-deposits to my bank account
- When I enter the correct deposit amounts
- Then my bank account is verified
- And my Momnt enrollment advances

---

**US-1.4.5: Complete Momnt Training**
> As a **Dealer**, I want to complete required Momnt training, so that I am certified to offer Momnt loans.

**Acceptance Criteria:**
- Given I am enrolled in the Momnt program
- When I complete the required training modules
- Then my training completion is recorded
- And my Momnt enrollment status is updated

---

**US-1.4.6: Enroll Dealer in Microf Program**
> As an **Administrator**, I want to submit a dealer's enrollment to Microf, so that they can offer LTO financing.

**Acceptance Criteria:**
- Given a dealer has requested Microf enrollment
- When I submit their enrollment information to Microf
- Then the dealer receives a Microf dealer key upon approval
- And Microf appears as an available financing option

---

**US-1.4.7: Enroll Dealer in Breeze Program**
> As an **Administrator**, I want to submit a dealer's enrollment to Breeze/Okinus, so that they can offer Breeze LTO financing.

**Acceptance Criteria:**
- Given a dealer has requested Breeze enrollment
- When I submit their enrollment to Breeze
- Then a Breeze store ID is assigned upon approval
- And Breeze appears as an available financing option

---

**US-1.4.8: Enroll Dealer in Thrive Program**
> As an **Administrator**, I want to record a dealer's Thrive enrollment, so that they can offer Thrive loans.

**Acceptance Criteria:**
- Given a dealer has completed Thrive's enrollment process
- When I record their Thrive merchant ID
- Then Thrive appears as an available financing option

---

**US-1.4.9: Refresh Partner Enrollment Status**
> As a **System**, I want to periodically refresh partner enrollment statuses, so that dealer partner access remains current.

**Acceptance Criteria:**
- Given a dealer has initiated enrollment with an external partner
- When the system checks enrollment status
- Then the dealer's enrollment status is updated
- And the dealer is notified of any status changes

---

### 1.5 Onboarding Completion

**US-1.5.1: Complete Merchant Onboarding**
> As a **Dealer**, I want to receive confirmation when my onboarding is complete, so that I know I can begin using the platform.

**Acceptance Criteria:**
- Given all onboarding steps have been completed
- When my onboarding is finalized
- Then I receive a welcome email with login instructions
- And my account is activated for full platform access

---

**US-1.5.2: Decline Merchant Application**
> As an **Underwriter**, I want to decline a merchant application, so that unqualified dealers are not enrolled.

**Acceptance Criteria:**
- Given I have reviewed a merchant application
- When I decline the application
- Then the dealer is notified of the decision
- And the application status changes to "Declined"

---

**US-1.5.3: Resend Onboarding Invitation**
> As an **Administrator**, I want to resend an onboarding invitation to a dealer, so that they can continue their application.

**Acceptance Criteria:**
- Given a dealer has an incomplete application
- When I resend the invitation
- Then the dealer receives a new email with a fresh link
- And their previous progress is preserved

---

**US-1.5.4: Configure Dealer Reimbursement Rates**
> As an **Administrator**, I want to configure reimbursement rates for a dealer, so that they are compensated correctly for installations.

**Acceptance Criteria:**
- Given an approved dealer
- When I configure their reimbursement rates
- Then the rates are saved and applied to future funding calculations

---

---

## Domain 2: User & Profile Management

### 2.1 User Registration & Authentication

**US-2.1.1: Register Dealer User Account**
> As a **Dealer Employee**, I want to register for an account on the platform, so that I can access dealer portal features.

**Acceptance Criteria:**
- Given I have been invited by my company's administrator
- When I complete the registration process
- Then my account is created
- And I receive a one-time password (OTP) to verify my identity

---

**US-2.1.2: Authenticate via OTP**
> As a **User**, I want to authenticate using a one-time password, so that I can securely access my account.

**Acceptance Criteria:**
- Given I am attempting to log in
- When I request an OTP
- Then I receive a code via SMS or email
- And when I enter the correct code, I am granted access

---

**US-2.1.3: Register Homeowner Account**
> As a **Homeowner**, I want to create an account, so that I can view my financing details and manage my account.

**Acceptance Criteria:**
- Given I have an active financing agreement
- When I register using my email and account information
- Then my account is created
- And I can access my homeowner portal

---

### 2.2 Role & Permission Management

**US-2.2.1: Assign Role to User**
> As an **Administrator**, I want to assign roles to users, so that they have appropriate access to platform features.

**Acceptance Criteria:**
- Given a registered user
- When I assign a role (e.g., Sales Rep, Manager, Admin)
- Then the user inherits the permissions associated with that role

---

**US-2.2.2: Configure Role Permissions**
> As an **Administrator**, I want to configure what permissions are associated with each role, so that access control is properly managed.

**Acceptance Criteria:**
- Given a defined role
- When I add or remove entitlements from the role
- Then all users with that role immediately reflect the permission changes

---

**US-2.2.3: Manage Partner Access for User**
> As an **Administrator**, I want to control which financing partners a user can access, so that they only see relevant options.

**Acceptance Criteria:**
- Given a dealer user
- When I configure their partner access
- Then the user only sees applications and options for their enabled partners

---

### 2.3 Profile Management

**US-2.3.1: Update User Profile**
> As a **User**, I want to update my profile information, so that my contact details remain current.

**Acceptance Criteria:**
- Given I am logged in
- When I update my profile (name, phone, email preferences)
- Then my changes are saved

---

**US-2.3.2: Impersonate User for Support**
> As a **Customer Service Representative**, I want to view the platform as a specific user sees it, so that I can assist them.

**Acceptance Criteria:**
- Given I have impersonation privileges
- When I impersonate a user
- Then I see the platform exactly as they see it
- And my actions are logged as impersonation

---

**US-2.3.3: Deactivate User Account**
> As an **Administrator**, I want to deactivate a user account, so that former employees no longer have platform access.

**Acceptance Criteria:**
- Given an active user account
- When I deactivate the account
- Then the user can no longer log in
- And their historical activity is preserved

---

---

## Domain 3: Homeowner Prequalification

### 3.1 Prequalification Invitation

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
- And I see the dealer's branding

---

### 3.2 Prequalification Application

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

### 3.3 Prequalification Decision

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
