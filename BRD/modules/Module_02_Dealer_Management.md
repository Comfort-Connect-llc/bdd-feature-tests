---
figma:
  file: "https://www.figma.com/file/FIGMA_FILE_ID/Comfort-Connect-Platform"
  page: "Module 02 - Dealer Management"
  frames:
    - id: "overview"
      name: "Module 02 - Dealer Management Overview"
      url: "TODO"
---

# Module 2: Dealer Management
## Dealer Onboarding & Training

**Version:** 1.0  
**Date:** February 12, 2026  
**Stories:** 48

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
- Interactive demo mode for onboarding and training

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

**US-2.4.10: Bulk Enroll Dealers in Partner Programs**
> As an **Administrator**, I want to enroll multiple dealers in one or more partner programs at once, so that I can efficiently onboard batches of dealers without processing each enrollment individually.

**Acceptance Criteria:**
- Given I have a list of approved dealers who need partner enrollment
- When I select multiple dealers and choose the partner programs to enroll them in (Premier, Momnt, Microf, Breeze, Thrive)
- Then enrollment is initiated for each selected dealer and partner combination
- And I can review the batch before confirming
- And I receive a summary of successful enrollments, pending enrollments, and any failures with reasons
- And each dealer is notified of their enrollment status individually

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

**US-2.7.4: Assign and Share Course via Deep Link (Internal)**
> As an **Internal Team Member**, I want to assign and share a direct link to a specific course with one or more individuals or groups across contractors, dealers, and internal users, so that I can ensure targeted people receive and access the right training.

**Acceptance Criteria:**
- Given a course exists in the LMS
- When I select a course and choose to assign or share it
- Then I can select one or more individual recipients across any persona (contractor, dealer, or internal user)
- And I can select one or more groups spanning multiple organizations
- And each recipient receives a notification with a deep link that takes them directly to the course
- And the assignment is tracked on the recipient's training record
- And I can view assignment status (sent, opened, in progress, completed) for each recipient

---

**US-2.7.5: Assign and Share Courses as Dealer Leadership**
> As a **Dealer Manager**, I want to assign and share specific courses or groups of courses with individual employees or groups of employees at my organization, so that I can manage my team's training and development.

**Acceptance Criteria:**
- Given I have a leadership role at my dealer organization
- When I select one or more courses or course groups to share
- Then I can assign them to individual employees or groups within my organization
- And each recipient receives a notification with a deep link to the assigned course(s)
- And I can view assignment and completion status for my team
- And I cannot assign courses to users outside my organization

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

---

**US-2.8.3: View Training Compliance Dashboard Widget**
> As an **Administrator**, I want to see a training compliance summary widget on my main dashboard, so that I can quickly identify dealers and users who are behind on required training without navigating into the LMS section.

**Acceptance Criteria:**
- Given there are dealers and users with training requirements
- When I view my administrator dashboard
- Then I see a training compliance widget showing total users, percentage compliant, and count of overdue completions
- And I can see a breakdown by dealer or company group
- And overdue items are highlighted with the number of days past the deadline
- And I can click through to the full training compliance report for details

---

## 2.9 Learning Management - Demo Mode

**US-2.9.1: Access Demo Mode as New User**
> As a **New User**, I want to walk through a simulated application experience on my own device, so that I can familiarize myself with the platform before working with real applications.

**Acceptance Criteria:**
- Given I am a registered user with access to the portal
- When I launch demo mode from the portal
- Then I can select a product type to demo (Premier Program, Installment Loan, Lease-to-Own)
- And I am guided through the full application flow using sample data
- And no real credit pulls, documents, or financial transactions are initiated
- And my demo progress is tracked separately from real activity
- And I can restart or exit the demo at any time

---

**US-2.9.2: Launch Demo Mode for Training Presentation**
> As a **Training Team Member**, I want to launch a guided demo of any product application flow, so that I can walk trainees through the experience in a live training session.

**Acceptance Criteria:**
- Given I have training team permissions
- When I launch demo mode and select a product type (Premier Program, Installment Loan, Lease-to-Own)
- Then I can step through the application flow at my own pace
- And I can demonstrate both the homeowner and dealer perspectives
- And sample data is pre-populated for realistic demonstration
- And the demo is clearly labeled so it cannot be confused with a live application

---

**US-2.9.3: Configure Demo Mode Scenarios**
> As an **Administrator**, I want to configure demo mode scenarios for each product type, so that demos remain accurate as products evolve and new financing options are launched.

**Acceptance Criteria:**
- Given a product type exists on the platform (current or newly launched)
- When I configure a demo scenario for that product
- Then I can define the sample data, flow steps, and decision outcomes used in the demo
- And I can create multiple scenarios per product (e.g., approved, declined, manual review)
- And updates to demo scenarios take effect immediately without code deployment

---

**US-2.9.4: Track Demo Mode Usage**
> As an **Administrator**, I want to track demo mode usage, so that I can measure training engagement and identify users who may need additional support.

**Acceptance Criteria:**
- Given users are accessing demo mode
- When I view demo usage reports
- Then I see which users have completed demos, which products they demoed, and completion rates
- And I can filter by user type, organization, and date range

---

## 2.10 Company Group Management

**US-2.10.1: Create Company Group**
> As an **Administrator**, I want to create company groups, so that related dealers can be managed together.

**Acceptance Criteria:**
- Given I need to organize multiple dealer locations
- When I create a company group with name, type, and contact information
- Then the company group is created
- And dealers can be assigned to this group

---

**US-2.10.2: Assign Dealer to Company Group**
> As an **Administrator**, I want to assign dealers to company groups, so that they share common settings and reporting.

**Acceptance Criteria:**
- Given a company group exists
- When I assign a dealer to the group
- Then the dealer is associated with the group
- And the dealer inherits group-level configurations

---

**US-2.10.3: Configure Group-Level Settings**
> As an **Administrator**, I want to configure settings at the group level, so that all dealers in the group share common configurations.

**Acceptance Criteria:**
- Given a company group has assigned dealers
- When I configure group-level settings (partner access, pricing, impersonation)
- Then all dealers in the group receive these settings
- And individual dealer settings can override group settings

---

**US-2.10.4: View Group-Level Reporting**
> As an **Administrator**, I want to view reports at the group level, so that I can analyze performance across related dealers.

**Acceptance Criteria:**
- Given a company group has multiple dealers with activity
- When I generate a group-level report
- Then I see aggregated metrics across all group dealers
- And can drill down to individual dealer performance

---

**US-2.10.5: Remove Dealer from Company Group**
> As an **Administrator**, I want to remove a dealer from a company group, so that they operate independently.

**Acceptance Criteria:**
- Given a dealer is assigned to a company group
- When I remove the dealer from the group
- Then the dealer is no longer associated with the group
- And group-level settings no longer apply

---

## 2.11 Merchant Risk Assessment

**US-2.11.1: Generate AI-Based Merchant Assessment**
> As an **Underwriter**, I want the system to generate an AI assessment of merchant applications, so that I have data-driven insights for approval decisions.

**Acceptance Criteria:**
- Given a merchant application has been submitted
- When the AI assessment is generated
- Then it includes risk score, recommendation, confidence level, and key factors
- And positive indicators are also identified

---

**US-2.11.2: Validate Merchant via Web Search**
> As a **System**, I want to validate merchant information via web search, so that submitted business details can be verified.

**Acceptance Criteria:**
- Given a merchant application is being processed
- When the system performs web validation
- Then it searches for business registration, BBB rating, reviews, and licensing
- And findings are included in the assessment report

---

**US-2.11.3: Review Merchant Assessment Results**
> As an **Underwriter**, I want to review AI assessment results, so that I can make informed approval decisions.

**Acceptance Criteria:**
- Given an AI assessment has been generated
- When I review the assessment
- Then I see the complete risk analysis
- And I can accept or override the recommendation

---

**US-2.11.4: Configure Contractor Scoring Criteria**
> As an **Administrator**, I want to configure scoring criteria, so that assessments reflect current business priorities.

**Acceptance Criteria:**
- Given I am configuring assessment parameters
- When I set scoring weights for various factors
- Then the scoring weights are applied to future assessments

---

**US-2.11.5: View Assessment History**
> As an **Administrator**, I want to view assessment history for a merchant, so that I can track changes over time.

**Acceptance Criteria:**
- Given a merchant has had multiple assessments
- When I view assessment history
- Then I see all assessments with dates and scores
- And can compare changes over time
