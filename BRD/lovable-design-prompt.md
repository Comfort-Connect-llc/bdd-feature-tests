# Lovable Design Prompt: Comfort Connect Platform

Build a comprehensive fintech web application for **Comfort Connect** - a B2B2C platform connecting HVAC dealers/contractors with homeowners seeking financing for home comfort equipment.

## User Personas
1. **Dealers/Contractors** - HVAC companies selling and installing equipment
2. **Homeowners** - Consumers seeking equipment financing
3. **Internal Staff** - Administrators, underwriters, customer service reps

## Financing Products
- **Premier Program** - In-house all-inclusive lease program
- **Loan Partners** - Consumer loans (Momnt, Thrive)
- **LTO Partners** - Lease-to-own (Microf, Breeze/Okinus)

---

# Module 1: Identity & Access (9 stories)

**Key Capabilities:** User registration/authentication (OTP), role-based access control, permission management, profile updates, user impersonation for support, account deactivation

## User Stories
- **US-1.1.1** Register Dealer User Account - Dealer employees register via company invitation, receive OTP verification
- **US-1.1.2** Authenticate via OTP - Users login with one-time password via SMS/email
- **US-1.1.3** Register Homeowner Account - Homeowners create accounts with active financing agreements
- **US-1.2.1** Assign Role to User - Admins assign roles (Sales Rep, Manager, Admin) with inherited permissions
- **US-1.2.2** Configure Role Permissions - Admins manage entitlements per role
- **US-1.2.3** Manage Partner Access - Control which financing partners users can access
- **US-1.3.1** Update User Profile - Users update name, phone, email preferences
- **US-1.3.2** Impersonate User for Support - CSRs view platform as specific users (logged)
- **US-1.3.3** Deactivate User Account - Admins deactivate accounts while preserving history

---

# Module 2: Dealer Management (23 stories)

**Key Capabilities:** Dealer application/onboarding workflow, NDA/merchant agreement e-signing, merchant underwriting, partner enrollment (Premier, Momnt, Microf, Breeze, Thrive), training/LMS, compliance tracking

## 2.1 Merchant Application
- **US-2.1.1** Invite Dealer to Apply - Admin sends application invitation email
- **US-2.1.2** Save Application Progress - Dealers save and resume applications
- **US-2.1.3** Submit Merchant Application - Submit with business details, tax ID, banking, owner info

## 2.2 Merchant Agreement & NDA
- **US-2.2.1** Generate NDA for Signing - Auto-generate pre-populated NDA for e-signature
- **US-2.2.2** Sign Merchant Agreement - E-sign partnership agreement
- **US-2.2.3** Verify Document Signatures - Track signature completion

## 2.3 Merchant Underwriting
- **US-2.3.1** Complete Merchant Underwriting Review - Review and approve/decline/request docs
- **US-2.3.2** Request Additional Onboarding Documents
- **US-2.3.3** Upload Onboarding Documents

## 2.4 Partner Enrollment
- **US-2.4.1** Enroll in Premier Program
- **US-2.4.2** Initiate Momnt Partner Enrollment
- **US-2.4.3** Set Up Bank Account for Momnt (micro-deposit verification)
- **US-2.4.4** Verify Momnt Micro-Deposits
- **US-2.4.5** Complete Momnt Training
- **US-2.4.6** Enroll in Microf Program (LTO)
- **US-2.4.7** Enroll in Breeze Program (LTO)
- **US-2.4.8** Enroll in Thrive Program
- **US-2.4.9** Refresh Partner Enrollment Status

## 2.5 Onboarding Completion
- **US-2.5.1** Complete Merchant Onboarding - Welcome email, full access
- **US-2.5.2** Decline Merchant Application
- **US-2.5.3** Resend Onboarding Invitation
- **US-2.5.4** Configure Dealer Reimbursement Rates

## 2.6-2.8 Learning Management
- **US-2.6.1-2.6.3** Create courses, organize into lessons, add resources
- **US-2.7.1-2.7.3** Enroll in courses, complete lessons, view progress
- **US-2.8.1-2.8.2** Track training completion, require training for partner access

## 2.9 Company Group Management
- **US-2.9.1-2.9.5** Create groups, assign dealers, configure group settings, view group reports, remove dealers

## 2.10 Merchant Risk Assessment
- **US-2.10.1** Generate AI-Based Merchant Assessment (risk score, recommendation, confidence)
- **US-2.10.2** Validate Merchant via Web Search (BBB, reviews, licensing)
- **US-2.10.3** Review Merchant Assessment Results
- **US-2.10.4** Configure Contractor Scoring Criteria
- **US-2.10.5** View Assessment History

---

# Module 3: Prequalification & Origination (52 stories)

**Key Capabilities:** Prequalification invitations, soft credit checks, multi-product eligibility, Premier Program lifecycle, automated/manual underwriting, offer selection, work orders, partner loan flows (Momnt, Thrive), partner LTO flows (Microf, Breeze), first payment collection

## 3.1 Prequalification Invitation
- **US-3.1.1** Send Prequalification Invitation - Email/SMS with dealer branding
- **US-3.1.2** Access Prequalification via Link

## 3.2 Prequalification Application
- **US-3.2.1** Provide Consent for Credit Check (soft pull disclosure)
- **US-3.2.2** Submit Prequalification Information (name, DOB, SSN, address, income)
- **US-3.2.3** Add Co-Applicant to Prequalification

## 3.3 Prequalification Decision
- **US-3.3.1** Receive Prequalification Decision (Approved/Declined/Review Required)
- **US-3.3.2** View Available Financing Products (Premier, Loan, LTO with max amounts)
- **US-3.3.3** Generate Adverse Action Notice
- **US-3.3.4** Convert Prequalification to Application

## 3.4 Premier Program - Application Creation
- **US-3.4.1** Create Premier Application
- **US-3.4.2** Send Application Invitation to Homeowner
- **US-3.4.3** Submit Application for Underwriting

## 3.5 Premier Program - Underwriting Decisions
- **US-3.5.1** Receive Automatic Approval (show amount, offers)
- **US-3.5.2** Receive Approval for Less
- **US-3.5.3** Route Application for Manual Review
- **US-3.5.4** Complete Manual Underwriting Review
- **US-3.5.5** Handle Credit Freeze Detection
- **US-3.5.6** Decline Application (adverse action notice)

## 3.6 Premier Program - Offer Selection
- **US-3.6.1** Select Premier Offer
- **US-3.6.2** View Partner Financing Offers (compare payments, terms, total cost)

## 3.7 Premier Program - Work Order & Quote
- **US-3.7.1** Add Work Order Details (equipment, installation date, total)
- **US-3.7.2** Modify Quote
- **US-3.7.3** Update Tax Rate (by installation location)

## 3.8 Premier Program - Document Signing
- **US-3.8.1** Request Lease Document Signing
- **US-3.8.2** Sign Lease Agreement Electronically
- **US-3.8.3** Verify Document Signatures

## 3.9 Premier Program - First Payment
- **US-3.9.1** Make First Month Payment
- **US-3.9.2** View Payment Confirmation

## 3.10 Premier Program - Verification Requirements
- **US-3.10.1-3.10.4** Deed verification, income verification (initiate and update status)

## 3.11 Premier Program - Application Management
- **US-3.11.1** Withdraw Application (homeowner)
- **US-3.11.2** Request Application Cancellation (dealer)
- **US-3.11.3** Cancel Application (admin)

## 3.12 Loan Partners - Momnt Flow
- **US-3.12.1** Initiate Momnt Loan Application
- **US-3.12.2** Approve Momnt Hard Credit Pull
- **US-3.12.3** Receive Momnt Loan Decision
- **US-3.12.4** Submit Momnt Final Application
- **US-3.12.5** Accept Momnt Loan Offer
- **US-3.12.6** Cancel Momnt Application

## 3.13 Loan Partners - Thrive Flow
- **US-3.13.1-3.13.3** Initiate, submit final application, receive decision

## 3.14 LTO Partners - Microf Flow
- **US-3.14.1** Initiate Microf Application
- **US-3.14.2** Accept Microf Lease Offer
- **US-3.14.3** Submit Income Proof for Microf
- **US-3.14.4** Verify Microf Income Proof Status
- **US-3.14.5** Complete Microf Work Order
- **US-3.14.6** Refresh Microf Application Status

## 3.15 LTO Partners - Breeze Flow
- **US-3.15.1** Create Breeze Application
- **US-3.15.2** Initiate Breeze Checkout
- **US-3.15.3** Calculate Breeze Lease Terms
- **US-3.15.4** Process Breeze Down Payment
- **US-3.15.5** Sign Breeze Contract
- **US-3.15.6** Request Breeze Funding
- **US-3.15.7** Cancel Breeze Funding Request
- **US-3.15.8** Cancel Breeze Lease

---

# Module 4: Underwriting & Verification (20 stories)

**Key Capabilities:** Soft/hard credit pulls, credit report storage, credit freeze detection, automated underwriting rules engine, company-specific underwriting configs, manual underwriting queue, income verification, deed verification

## 4.1 Credit Bureau Integration
- **US-4.1.1** Perform Soft Credit Pull (no impact to score)
- **US-4.1.2** Perform Hard Credit Pull
- **US-4.1.3** Store Credit Report (key data + PDF)
- **US-4.1.4** Detect Credit Freeze

## 4.2 Automated Underwriting
- **US-4.2.1** Evaluate Against Underwriting Rules (FICO, DTI, charge-offs, delinquencies)
- **US-4.2.2** Apply Company-Specific Underwriting Rules
- **US-4.2.3** Calculate Debt-to-Income Ratio
- **US-4.2.4** Determine Maximum Approval Amount
- **US-4.2.5** Apply Decision Hierarchy (reject > review > approve)

## 4.3 Manual Underwriting
- **US-4.3.1** Queue Application for Manual Review
- **US-4.3.2** Review Manual Underwriting Case
- **US-4.3.3** Record Manual Underwriting Decision (with rationale)

## 4.4 Income Verification
- **US-4.4.1** Request Income Verification
- **US-4.4.2** Submit Income Documentation (pay stubs, tax returns, bank statements)
- **US-4.4.3** Review Income Documentation
- **US-4.4.4** Update Income Verification Status

## 4.5 Property/Deed Verification
- **US-4.5.1** Request Deed Verification
- **US-4.5.2** Verify Property Ownership
- **US-4.5.3** Handle Deed Verification Failure
- **US-4.5.4** Check Active Property Listings

---

# Module 5: Pricing & Equipment (12 stories)

**Key Capabilities:** Payment quote generation, bundle pricing, pricing model configuration, tax rate lookup, equipment model lookup (AHRI), equipment catalog, invoice verification

## 5.1 Quote Generation
- **US-5.1.1** Generate Payment Quote (monthly payments, terms, total cost)
- **US-5.1.2** Calculate Premier Program Payments
- **US-5.1.3** Generate Quote with Bundles

## 5.2 Pricing Configuration
- **US-5.2.1** Configure Pricing Models
- **US-5.2.2** View Pricing Metrics

## 5.3 Tax Management
- **US-5.3.1** Retrieve Tax Rate by Location
- **US-5.3.2** Handle Missing Tax Rate

## 5.4 Equipment Identification
- **US-5.4.1** Look Up Equipment by Model
- **US-5.4.2** Identify Equipment via AI (from invoice/image)
- **US-5.4.3** Capture Equipment Serial Number

## 5.5-5.6 Equipment Catalog & Invoice
- **US-5.5.1** Manage Equipment Catalog
- **US-5.6.1** Verify Equipment Invoice

---

# Module 6: Document Management (12 stories)

**Key Capabilities:** Lease/merchant/adverse action letter generation, buyout letters, e-signature sending/tracking, multi-party workflows, secure storage, download/upload

## 6.1 Document Generation
- **US-6.1.1** Generate Lease Agreement
- **US-6.1.2** Generate Merchant Agreement
- **US-6.1.3** Generate Adverse Action Letter
- **US-6.1.4** Generate Buyout Letter

## 6.2 Electronic Signatures
- **US-6.2.1** Send Document for E-Signature
- **US-6.2.2** Sign Document Electronically
- **US-6.2.3** Track Signature Status
- **US-6.2.4** Verify All Signatures Complete
- **US-6.2.5** Resend Document Signing Request

## 6.3 Document Storage & Retrieval
- **US-6.3.1** Store Signed Documents
- **US-6.3.2** Download Document
- **US-6.3.3** Upload Supporting Documents

---

# Module 7: Installation & Funding (12 stories)

**Key Capabilities:** Installation authorization, completion recording, funding paperwork submission/verification, contractor payment, funding status visibility, partner-specific funding

## 7.1 Installation Authorization
- **US-7.1.1** Authorize Installation
- **US-7.1.2** Record Installation Completion

## 7.2 Funding Documentation
- **US-7.2.1** Submit Funding Paperwork (invoice, photos, certificates)
- **US-7.2.2** Request Additional Paperwork
- **US-7.2.3** Verify Funding Documentation

## 7.3 Contractor Payment
- **US-7.3.1** Initiate Contractor Payment
- **US-7.3.2** Process Contractor Payment
- **US-7.3.3** View Funding Status

## 7.4 Partner Funding
- **US-7.4.1** Request Momnt Funding
- **US-7.4.2** Request Momnt Refund
- **US-7.4.3** Request Breeze Funding
- **US-7.4.4** Complete Microf Work Order

---

# Module 8: Billing & Payments (20 stories)

**Key Capabilities:** Billing account creation, payment method management, autopay enrollment, invoice generation, one-time/recurring payments, receipts, refunds, late fees, credits, delinquency tracking

## 8.1 Billing Account Setup
- **US-8.1.1** Create Billing Account
- **US-8.1.2** Set Up Payment Method (card, bank account)
- **US-8.1.3** Enable Autopay
- **US-8.1.4** Disable Autopay

## 8.2 Billing Cycle Management
- **US-8.2.1** Generate Monthly Invoice
- **US-8.2.2** View Billing History
- **US-8.2.3** Calculate Balance Due
- **US-8.2.4** View Current Period Summary

## 8.3 Payment Processing
- **US-8.3.1** Make One-Time Payment
- **US-8.3.2** Process Autopay Payment
- **US-8.3.3** Generate Payment Receipt
- **US-8.3.4** Process Payment Refund
- **US-8.3.5** Handle Payment Failure (retry logic)
- **US-8.3.6** Process Payment Reversal

## 8.4 Fees & Delinquency
- **US-8.4.1** Assess Late Fee
- **US-8.4.2** Calculate Days Past Due (30/60/90+)
- **US-8.4.3** Initiate Dunning Communications
- **US-8.4.4** Assess Statement Fee
- **US-8.4.5** Apply Credit to Account

## 8.5 Payment Scheduling
- **US-8.5.1** Schedule Future Payment
- **US-8.5.2** Cancel Scheduled Payment

## 8.6 Billing Reconciliation
- **US-8.6.1** Identify Billing Reconciliation Exceptions
- **US-8.6.2** Export Payment Data

---

# Module 9: Account Servicing (28 stories)

**Key Capabilities:** Service request tracking, maintenance reminders, service claim funding, customer account lookup, task management, account notes, issue escalation, status transitions, lease buyout, termination, archival

## 9.1 Maintenance Requests
- **US-9.1.1** Request Maintenance Service
- **US-9.1.2** Schedule Maintenance Appointment
- **US-9.1.3** Complete Maintenance Service

## 9.2 Maintenance Reminders
- **US-9.2.1** Send Scheduled Maintenance Reminder
- **US-9.2.2** Configure Maintenance Schedule

## 9.3 Maintenance Funding
- **US-9.3.1** Process Maintenance Invoice
- **US-9.3.2** Track Maintenance Costs

## 9.4 Worry-Free Rewards
- **US-9.4.1** Enroll in Worry-Free Rewards (benefits for on-time payments)

## 9.5 Customer Service - Account Lookup
- **US-9.5.1** Search for Customer Account
- **US-9.5.2** View Account Summary

## 9.6 Customer Service - Task Management
- **US-9.6.1** Create Service Task
- **US-9.6.2** Assign Task to Team Member
- **US-9.6.3** Complete Service Task

## 9.7 Customer Service - Notes & Comments
- **US-9.7.1** Add Note to Account
- **US-9.7.2** View Account Notes

## 9.8-9.9 Document Access & Support Requests
- **US-9.8.1** Access Account Documents
- **US-9.9.1** Submit Support Request
- **US-9.9.2** View Support Request Status

## 9.10 Account Lifecycle - Status Management
- **US-9.10.1** View Account Status History
- **US-9.10.2** Transition Account Status

## 9.11 Account Lifecycle - Buyout Process
- **US-9.11.1** Request Lease Buyout
- **US-9.11.2** Generate Buyout Quote
- **US-9.11.3** Process Buyout Payment
- **US-9.11.4** Complete Buyout Process
- **US-9.11.5** Cancel Buyout Request

## 9.12 Account Lifecycle - Termination
- **US-9.12.1** Request Account Cancellation
- **US-9.12.2** Process Account Termination
- **US-9.12.3** Terminate for Non-Payment

## 9.13 Account Lifecycle - Archiving
- **US-9.13.1** Archive Completed Account
- **US-9.13.2** Retrieve Archived Account

---

# Module 10: Communications (13 stories)

**Key Capabilities:** Application status emails, document signing emails, payment reminders, OTP via SMS, application invitations via SMS, in-app notifications, real-time status updates, notification preferences

## 10.1 Email Notifications
- **US-10.1.1** Send Application Status Email
- **US-10.1.2** Send Document Signing Request Email
- **US-10.1.3** Send Payment Reminder Email
- **US-10.1.4** Send Welcome Email
- **US-10.1.5** Send Adverse Action Letter

## 10.2 SMS Notifications
- **US-10.2.1** Send OTP via SMS
- **US-10.2.2** Send Application Invitation via SMS
- **US-10.2.3** Send Payment Confirmation via SMS

## 10.3 In-Portal Notifications
- **US-10.3.1** Display In-App Notifications
- **US-10.3.2** Mark Notification as Read

## 10.4 Real-Time Updates
- **US-10.4.1** Receive Real-Time Status Updates

## 10.5 Notification Preferences
- **US-10.5.1** Configure Notification Preferences (email, SMS, in-app)

---

# Module 11: Promotions (6 stories)

**Key Capabilities:** Promotion creation/configuration, dealer-specific assignment, date ranges, eligibility rules, promo code application, validation, reporting

## 11.1 Promotion Management
- **US-11.1.1** Create Promotion (discount, special terms, dates)
- **US-11.1.2** Configure Promotion Eligibility (company, region, product, amount)
- **US-11.1.3** Apply Promotion to Account
- **US-11.1.4** Validate Promotion
- **US-11.1.5** View Active Promotions

## 11.2 Company-Specific Promotions
- **US-11.2.1** Assign Promotion to Company

---

# Module 12: Administration (14 stories)

**Key Capabilities:** Partner integration config, underwriting rules config, system parameters, feature flags, pipeline/funding/delinquency reports, partner validation, data warehouse export, dealer dashboards

## 12.1 Partner Configuration
- **US-12.1.1** Enable Partner for Company
- **US-12.1.2** Disable Partner for Company
- **US-12.1.3** Configure Global Partner Access

## 12.2 Underwriting Configuration
- **US-12.2.1** Configure Underwriting Criteria
- **US-12.2.2** Assign Underwriting Config Type to Company
- **US-12.2.3** View Available Underwriting Config Types

## 12.3 System Configuration
- **US-12.3.1** Configure System Parameters
- **US-12.3.2** Manage Feature Flags

## 12.4 Operational Reports
- **US-12.4.1** Generate Application Pipeline Report
- **US-12.4.2** Generate Funding Report
- **US-12.4.3** Generate Delinquency Report

## 12.5 Partner Validation
- **US-12.5.1** Generate Partner Validation Report
- **US-12.5.2** Validate Partner Status

## 12.6 Data Export
- **US-12.6.1** Export Account Data to Data Warehouse
- **US-12.6.2** Export Payment Data

## 12.7 Dealer Reporting
- **US-12.7.1** View Dealer Performance Dashboard (volume, approval rates, funding)
- **US-12.7.2** View Application Status Summary

---

# Design Requirements

## UI/UX Guidelines
- Modern, clean fintech aesthetic with professional color palette
- Mobile-responsive design for all portals
- Clear visual hierarchy for complex workflows
- Progress indicators for multi-step processes
- Dashboard-centric navigation for each user type
- Real-time status updates and notifications
- Accessibility compliance (WCAG 2.1)

## Portal Structure
1. **Dealer Portal** - Application pipeline, customer management, training, funding status
2. **Homeowner Portal** - Account dashboard, payments, documents, service requests
3. **Admin Portal** - Underwriting queue, dealer management, reports, configuration
4. **Customer Service Portal** - Account lookup, task management, impersonation

## Key Screens to Design
- Login/OTP authentication flow
- Dealer onboarding wizard (multi-step)
- Prequalification flow (homeowner-facing)
- Application pipeline dashboard (dealer)
- Offer comparison/selection screen
- Document signing flow
- Payment portal
- Billing statement view
- Underwriting review queue
- Admin configuration panels
- Reporting dashboards

## Total User Stories: 221
