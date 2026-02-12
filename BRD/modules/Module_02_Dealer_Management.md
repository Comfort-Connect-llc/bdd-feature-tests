# Module 2: Dealer Management
## Dealer Onboarding & Training

**Version:** 1.0  
**Date:** February 12, 2026  
**Stories:** 23

---

## Overview

Manages the complete dealer/contractor lifecycle from initial application through ongoing training and compliance. Includes merchant onboarding, partner enrollment, and learning management.

**Key Capabilities:**
- Dealer application and onboarding workflow
- NDA and merchant agreement e-signing
- Merchant underwriting and approval
- Partner enrollment (Premier, Momnt, Microf, Breeze, Thrive)
- Training course enrollment and completion
- Compliance certification tracking

---

## 2.1 Merchant Application

**US-2.1.1: Invite Dealer to Apply**
> As an **Administrator**, I want to send an application invitation to a prospective dealer, so that they can begin the onboarding process.

**Acceptance Criteria:**
- Given a valid dealer contact email and business name
- When I send a merchant application invitation
- Then the dealer receives an email with a secure link to begin their application
- And the application record is created with status "Invitation Sent"

---

**US-2.1.2: Save Application Progress**
> As a **Dealer**, I want to save my application progress at any time, so that I can complete it later without losing my information.

**Acceptance Criteria:**
- Given I am completing my merchant application
- When I save my progress
- Then all entered information is preserved
- And I can resume from where I left off

---

**US-2.1.3: Submit Merchant Application**
> As a **Dealer**, I want to submit my completed merchant application, so that Comfort Connect can review my business for approval.

**Acceptance Criteria:**
- Given I have completed all required fields including business details, tax ID, banking information, and owner information
- When I submit my application
- Then the application status changes to "Submitted"
- And I receive confirmation that my application is under review

---

## 2.2 Merchant Agreement & NDA

**US-2.2.1: Generate NDA for Signing**
> As a **System**, I want to automatically generate an NDA when a dealer begins onboarding, so that confidential information is protected.

**Acceptance Criteria:**
- Given a dealer has started the onboarding process
- When the system generates the NDA document
- Then the NDA is pre-populated with the dealer's business information
- And the document is sent for electronic signature

---

**US-2.2.2: Sign Merchant Agreement**
> As a **Dealer**, I want to review and electronically sign the merchant agreement, so that I can formalize my partnership with Comfort Connect.

**Acceptance Criteria:**
- Given my merchant application has been approved
- When I receive the merchant agreement for signing
- Then I can review all terms and conditions
- And I can electronically sign the agreement
- And upon signing, I receive a copy of the executed agreement

---

**US-2.2.3: Verify Document Signatures**
> As a **System**, I want to verify that all required signatures have been obtained on merchant documents, so that the onboarding can proceed.

**Acceptance Criteria:**
- Given a merchant agreement or NDA has been sent for signing
- When all required parties have signed
- Then the document status is updated to "Fully Executed"
- And the onboarding workflow advances to the next step

---

## 2.3 Merchant Underwriting

**US-2.3.1: Complete Merchant Underwriting Review**
> As an **Underwriter**, I want to review a dealer's application and supporting documentation, so that I can determine their eligibility to join the platform.

**Acceptance Criteria:**
- Given a merchant application has been submitted
- When I review the application details and financial information
- Then I can approve, decline, or request additional information
- And my decision and rationale are recorded

---

**US-2.3.2: Request Additional Onboarding Documents**
> As an **Underwriter**, I want to request additional documents from a dealer, so that I can complete my review.

**Acceptance Criteria:**
- Given I am reviewing a merchant application
- When I request additional documents
- Then the dealer receives a notification specifying what is needed
- And the application status reflects "Documents Requested"

---

**US-2.3.3: Upload Onboarding Documents**
> As a **Dealer**, I want to upload requested documents, so that my application review can be completed.

**Acceptance Criteria:**
- Given I have received a request for additional documents
- When I upload the requested files
- Then the files are attached to my application
- And the underwriting team is notified

---

## 2.4 Partner Enrollment

**US-2.4.1: Enroll Dealer in Premier Program**
> As an **Administrator**, I want to enroll an approved dealer in the Premier Program, so that they can offer Premier leases to their customers.

**Acceptance Criteria:**
- Given a dealer has been approved
- When I activate their Premier enrollment
- Then the dealer can create Premier applications for homeowners
- And Premier appears as an available financing option

---

**US-2.4.2: Initiate Momnt Partner Enrollment**
> As a **Dealer**, I want to enroll in the Momnt loan program, so that I can offer consumer loans to my customers.

**Acceptance Criteria:**
- Given I am an approved Comfort Connect dealer
- When I initiate Momnt enrollment
- Then I receive an invitation to complete Momnt's enrollment process
- And my enrollment status is tracked

---

**US-2.4.3: Set Up Bank Account for Momnt**
> As a **Dealer**, I want to set up my bank account with Momnt, so that I can receive loan funding payments.

**Acceptance Criteria:**
- Given I am enrolling in the Momnt program
- When I provide my bank account details
- Then Momnt initiates micro-deposit verification
- And I can verify the deposits to complete bank verification

---

**US-2.4.4: Verify Momnt Micro-Deposits**
> As a **Dealer**, I want to verify the micro-deposit amounts sent to my bank account, so that my bank account is confirmed.

**Acceptance Criteria:**
- Given Momnt has sent micro-deposits to my bank account
- When I enter the correct deposit amounts
- Then my bank account is verified
- And my Momnt enrollment advances

---

**US-2.4.5: Complete Momnt Training**
> As a **Dealer**, I want to complete required Momnt training, so that I am certified to offer Momnt loans.

**Acceptance Criteria:**
- Given I am enrolled in the Momnt program
- When I complete the required training modules
- Then my training completion is recorded
- And my Momnt enrollment status is updated

---

**US-2.4.6: Enroll Dealer in Microf Program**
> As an **Administrator**, I want to submit a dealer's enrollment to Microf, so that they can offer LTO financing.

**Acceptance Criteria:**
- Given a dealer has requested Microf enrollment
- When I submit their enrollment information to Microf
- Then the dealer receives a Microf dealer key upon approval
- And Microf appears as an available financing option

---

**US-2.4.7: Enroll Dealer in Breeze Program**
> As an **Administrator**, I want to submit a dealer's enrollment to Breeze/Okinus, so that they can offer Breeze LTO financing.

**Acceptance Criteria:**
- Given a dealer has requested Breeze enrollment
- When I submit their enrollment to Breeze
- Then a Breeze store ID is assigned upon approval
- And Breeze appears as an available financing option

---

**US-2.4.8: Enroll Dealer in Thrive Program**
> As an **Administrator**, I want to record a dealer's Thrive enrollment, so that they can offer Thrive loans.

**Acceptance Criteria:**
- Given a dealer has completed Thrive's enrollment process
- When I record their Thrive merchant ID
- Then Thrive appears as an available financing option

---

**US-2.4.9: Refresh Partner Enrollment Status**
> As a **System**, I want to periodically refresh partner enrollment statuses, so that dealer partner access remains current.

**Acceptance Criteria:**
- Given a dealer has initiated enrollment with an external partner
- When the system checks enrollment status
- Then the dealer's enrollment status is updated
- And the dealer is notified of any status changes

---

## 2.5 Onboarding Completion

**US-2.5.1: Complete Merchant Onboarding**
> As a **Dealer**, I want to receive confirmation when my onboarding is complete, so that I know I can begin using the platform.

**Acceptance Criteria:**
- Given all onboarding steps have been completed
- When my onboarding is finalized
- Then I receive a welcome email with login instructions
- And my account is activated for full platform access

---

**US-2.5.2: Decline Merchant Application**
> As an **Underwriter**, I want to decline a merchant application, so that unqualified dealers are not enrolled.

**Acceptance Criteria:**
- Given I have reviewed a merchant application
- When I decline the application
- Then the dealer is notified of the decision
- And the application status changes to "Declined"

---

**US-2.5.3: Resend Onboarding Invitation**
> As an **Administrator**, I want to resend an onboarding invitation to a dealer, so that they can continue their application.

**Acceptance Criteria:**
- Given a dealer has an incomplete application
- When I resend the invitation
- Then the dealer receives a new email with a fresh link
- And their previous progress is preserved

---

**US-2.5.4: Configure Dealer Reimbursement Rates**
> As an **Administrator**, I want to configure reimbursement rates for a dealer, so that they are compensated correctly for installations.

**Acceptance Criteria:**
- Given an approved dealer
- When I configure their reimbursement rates
- Then the rates are saved and applied to future funding calculations

---

## 2.6 Learning Management - Course Management

**US-2.6.1: Create Training Course**
> As an **Administrator**, I want to create training courses, so that dealers can learn about products and processes.

**Acceptance Criteria:**
- Given training content
- When I create a course
- Then the course is available for enrollment
- And includes description, objectives, and duration

---

**US-2.6.2: Organize Course into Lessons**
> As an **Administrator**, I want to organize courses into lessons and segments, so that content is structured logically.

**Acceptance Criteria:**
- Given a course exists
- When I add lessons and segments
- Then the course structure is defined
- And learners can progress through sequentially

---

**US-2.6.3: Add Resources to Course**
> As an **Administrator**, I want to add resources (documents, videos) to courses, so that learners have reference materials.

**Acceptance Criteria:**
- Given a course or lesson
- When I add resources
- Then the resources are available to learners
- And can be downloaded or viewed

---

## 2.7 Learning Management - Training Enrollment

**US-2.7.1: Enroll in Training Course**
> As a **Dealer User**, I want to enroll in training courses, so that I can learn about products and processes.

**Acceptance Criteria:**
- Given available courses
- When I enroll in a course
- Then I can access the course content
- And my progress is tracked

---

**US-2.7.2: Complete Training Lesson**
> As a **Dealer User**, I want to complete lessons and mark them done, so that my progress is recorded.

**Acceptance Criteria:**
- Given I am enrolled in a course
- When I complete a lesson
- Then my completion is recorded
- And I can proceed to the next lesson

---

**US-2.7.3: View Training Progress**
> As a **Dealer User**, I want to view my training progress, so that I know what I've completed.

**Acceptance Criteria:**
- Given I am enrolled in courses
- When I view my progress
- Then I see completed and remaining lessons
- And overall completion percentage

---

## 2.8 Learning Management - Training Compliance

**US-2.8.1: Track Dealer Training Completion**
> As an **Administrator**, I want to track dealer training completion, so that compliance requirements are met.

**Acceptance Criteria:**
- Given training requirements exist
- When I view training reports
- Then I see completion status by dealer and user
- And can identify who needs to complete training

---

**US-2.8.2: Require Training for Partner Access**
> As a **System**, I want to require training completion before enabling partner access, so that dealers are properly trained.

**Acceptance Criteria:**
- Given a partner requires training
- When a dealer attempts to use the partner
- Then access is only granted if required training is complete
