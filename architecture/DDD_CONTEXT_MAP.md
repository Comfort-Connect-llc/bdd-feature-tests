# ComfortConnect POS Financing Platform
# Domain-Driven Design Context Map

**Version:** 1.0  
**Date:** February 17, 2026  
**Source of Truth:** bdd-feature-tests repository

---

## Executive Summary

This document defines the bounded contexts, domain model, and architectural boundaries for the ComfortConnect POS financing platform. All definitions are derived exclusively from BDD feature specifications (251 user stories across 12 modules).

**Platform Purpose:** B2B2C point-of-sale financing platform enabling home comfort contractors (dealers) to offer multiple financing products to homeowners.

**Core Products:**
- **Premier Program** - Comfort Connect's proprietary all-inclusive lease (~8 years)
- **Partner Loans** - Momnt, Thrive (consumer loans)
- **Partner LTO** - Microf, Breeze/Okinus (lease-to-own)

---

## Bounded Contexts Overview

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              PLATFORM CORE                                       │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                  │
│   ┌──────────────────┐    ┌──────────────────┐    ┌──────────────────┐         │
│   │    IDENTITY      │    │    MERCHANT      │    │   ORIGINATION    │         │
│   │    CONTEXT       │◄───│    CONTEXT       │───►│    CONTEXT       │         │
│   │                  │    │                  │    │                  │         │
│   │ • Authentication │    │ • Onboarding     │    │ • Applications   │         │
│   │ • Authorization  │    │ • Partner Enroll │    │ • Prequalification│        │
│   │ • User Profiles  │    │ • Training/LMS   │    │ • Offers         │         │
│   │ • Roles/Perms    │    │ • Company Groups │    │ • Work Orders    │         │
│   └────────┬─────────┘    └────────┬─────────┘    └────────┬─────────┘         │
│            │                       │                       │                    │
│            ▼                       ▼                       ▼                    │
│   ┌──────────────────┐    ┌──────────────────┐    ┌──────────────────┐         │
│   │  UNDERWRITING    │    │    PRICING       │    │    DOCUMENT      │         │
│   │    CONTEXT       │◄───│    CONTEXT       │───►│    CONTEXT       │         │
│   │                  │    │                  │    │                  │         │
│   │ • Credit Bureau  │    │ • Quote Engine   │    │ • Generation     │         │
│   │ • Decision Engine│    │ • Rate Sheets    │    │ • E-Signatures   │         │
│   │ • Verification   │    │ • Equipment      │    │ • Storage        │         │
│   │ • Manual Review  │    │ • Tax Calc       │    │ • Retrieval      │         │
│   └────────┬─────────┘    └────────┬─────────┘    └────────┬─────────┘         │
│            │                       │                       │                    │
├────────────┼───────────────────────┼───────────────────────┼────────────────────┤
│            ▼                       ▼                       ▼                    │
│   ┌──────────────────┐    ┌──────────────────┐    ┌──────────────────┐         │
│   │  FULFILLMENT     │    │    BILLING       │    │   SERVICING      │         │
│   │    CONTEXT       │───►│    CONTEXT       │◄───│    CONTEXT       │         │
│   │                  │    │                  │    │                  │         │
│   │ • Installation   │    │ • Invoicing      │    │ • Maintenance    │         │
│   │ • Funding        │    │ • Payments       │    │ • Customer Svc   │         │
│   │ • Contractor Pay │    │ • Autopay        │    │ • Buyout         │         │
│   │ • Partner Funding│    │ • Delinquency    │    │ • Termination    │         │
│   └──────────────────┘    └──────────────────┘    └──────────────────┘         │
│                                                                                  │
├─────────────────────────────────────────────────────────────────────────────────┤
│                           SUPPORTING CONTEXTS                                    │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                  │
│   ┌──────────────────┐    ┌──────────────────┐    ┌──────────────────┐         │
│   │  COMMUNICATION   │    │   PROMOTION      │    │ PARTNER GATEWAY  │         │
│   │    CONTEXT       │    │    CONTEXT       │    │    CONTEXT       │         │
│   │                  │    │                  │    │                  │         │
│   │ • Email          │    │ • Campaigns      │    │ • Momnt ACL      │         │
│   │ • SMS            │    │ • Eligibility    │    │ • Thrive ACL     │         │
│   │ • In-App         │    │ • Application    │    │ • Microf ACL     │         │
│   │ • Real-time      │    │ • Validation     │    │ • Breeze ACL     │         │
│   └──────────────────┘    └──────────────────┘    └──────────────────┘         │
│                                                                                  │
└─────────────────────────────────────────────────────────────────────────────────┘
```

---

## Context Definitions

### 1. IDENTITY CONTEXT

**Purpose:** Foundation layer managing all user authentication, authorization, and profile management across personas.

**BDD Source:** Module 1 (14 stories)

**Ubiquitous Language:**
| Term | Definition |
|------|------------|
| User | Any authenticated entity (Dealer, Homeowner, Staff) |
| Profile | User's identity attributes and preferences |
| Role | Named collection of permissions (Sales Rep, Manager, Admin) |
| Entitlement | Atomic permission to perform an action |
| Partner Access | Configuration controlling which financing partners a user can access |
| OTP | One-time password for passwordless authentication |
| Impersonation | Support feature to view platform as another user |

**Aggregate: User**
```
User (Aggregate Root)
├── UserId (Identity)
├── Profile (Entity)
│   ├── Name
│   ├── Email
│   ├── Phone
│   └── Preferences
├── Authentication (Value Object)
│   ├── AuthProviderId (sub)
│   └── LastLogin
├── Roles[] (Value Object)
├── PartnerAccess[] (Value Object)
└── Status (Active/Inactive)
```

**Domain Events:**
- `UserRegistered`
- `UserAuthenticated`
- `RoleAssigned`
- `RoleRevoked`
- `PartnerAccessGranted`
- `PartnerAccessRevoked`
- `UserDeactivated`
- `UserImpersonationStarted`
- `UserImpersonationEnded`

**Public Interface:**
```
Commands:
  - RegisterUser(email, name, invitedBy)
  - AuthenticateWithOTP(userId, otp)
  - AssignRole(userId, roleId)
  - ConfigurePartnerAccess(userId, partnerId, enabled)
  - UpdateProfile(userId, profileData)
  - DeactivateUser(userId)
  - StartImpersonation(operatorId, targetUserId)

Queries:
  - GetUserById(userId)
  - GetUserPermissions(userId)
  - GetUsersWithRole(roleId)
  - ValidateAccess(userId, resource, action)
```

---

### 2. MERCHANT CONTEXT

**Purpose:** Manages dealer/contractor lifecycle from application through ongoing compliance and training.

**BDD Source:** Module 2 (33 stories)

**Ubiquitous Language:**
| Term | Definition |
|------|------------|
| Merchant | Business entity applying to become a dealer |
| Dealer | Approved merchant actively using the platform |
| Company | Operational business unit with locations and users |
| Company Group | Collection of related companies sharing settings |
| NDA | Non-disclosure agreement required before onboarding |
| Merchant Agreement | Contract formalizing partnership terms |
| Partner Enrollment | Process to enable a specific financing partner |
| Course | Training module with lessons and resources |
| Certification | Proof of training completion |

**Aggregate: Company**
```
Company (Aggregate Root)
├── CompanyId (Identity)
├── LegalInfo (Value Object)
│   ├── LegalName
│   ├── DisplayName
│   ├── EIN
│   └── Website
├── ContactInfo (Value Object)
│   ├── Address
│   ├── Phone
│   └── Email
├── BankingInfo (Value Object)
│   ├── AccountType
│   ├── RoutingNumber
│   └── AccountNumber (encrypted)
├── Ownership[] (Entity)
│   ├── OwnerName
│   ├── Percentage
│   └── Contact
├── Locations[] (Entity)
├── Licensing[] (Value Object)
├── PartnerEnrollments[] (Entity)
│   ├── PartnerId
│   ├── Status
│   ├── ExternalId
│   └── EnrolledAt
├── OnboardingStatus (Value Object)
└── CompanyGroupId (optional)
```

**Aggregate: MerchantApplication**
```
MerchantApplication (Aggregate Root)
├── ApplicationId (Identity)
├── CompanyInfo (Value Object)
├── OwnerInfo[] (Value Object)
├── BankingInfo (Value Object)
├── Documents[] (Entity)
├── Assessment (Entity)
│   ├── RiskScore
│   ├── Recommendation
│   └── Factors[]
├── Status (Invited/InProgress/Submitted/UnderReview/Approved/Declined)
└── UnderwritingDecision (Value Object)
```

**Aggregate: Course**
```
Course (Aggregate Root)
├── CourseId (Identity)
├── Title
├── Description
├── Lessons[] (Entity)
│   ├── LessonId
│   ├── Segments[]
│   └── Resources[]
├── RequiredForPartners[] (Value Object)
└── Status (Draft/Published/Archived)
```

**Domain Events:**
- `MerchantInvitationSent`
- `MerchantApplicationSubmitted`
- `MerchantApplicationApproved`
- `MerchantApplicationDeclined`
- `NDAGenerated`
- `MerchantAgreementSigned`
- `PartnerEnrollmentInitiated`
- `PartnerEnrollmentCompleted`
- `TrainingCompleted`
- `CompanyGroupAssigned`

**Public Interface:**
```
Commands:
  - InviteMerchant(email, businessName, salesRepId)
  - SaveApplicationProgress(applicationId, data)
  - SubmitApplication(applicationId)
  - ApproveApplication(applicationId, underwriterId, rationale)
  - DeclineApplication(applicationId, underwriterId, rationale)
  - RequestDocuments(applicationId, documentTypes[])
  - InitiatePartnerEnrollment(companyId, partnerId)
  - CompletePartnerEnrollment(companyId, partnerId, externalId)
  - EnrollInCourse(userId, courseId)
  - CompleteLessson(userId, courseId, lessonId)
  - AssignToCompanyGroup(companyId, groupId)

Queries:
  - GetApplicationById(applicationId)
  - GetApplicationsByStatus(status)
  - GetCompanyById(companyId)
  - GetPartnerEnrollmentStatus(companyId, partnerId)
  - GetTrainingProgress(userId)
  - GetCompanyGroupMembers(groupId)
```

---

### 3. ORIGINATION CONTEXT

**Purpose:** Core business context managing complete application lifecycle from prequalification through offer acceptance.

**BDD Source:** Module 3 (57 stories)

**Ubiquitous Language:**
| Term | Definition |
|------|------------|
| Application | Financing request for a homeowner |
| Prequalification | Soft-pull eligibility check |
| Applicant | Primary person applying for financing |
| Co-Applicant | Secondary person on the application |
| Offer | Financing terms presented to applicant |
| Work Order | Equipment and installation details |
| Quote | Calculated payment based on work order |
| Consent | Recorded agreement to terms/disclosures |
| Adverse Action | Required notice for declined applications |

**Aggregate: Application**
```
Application (Aggregate Root)
├── ApplicationId (Identity)
├── AccountNumber (Value Object)
├── Type (Premier/Momnt/Thrive/Microf/Breeze)
├── PrimaryApplicant (Entity)
│   ├── PersonalInfo (Value Object)
│   │   ├── Name, DOB, SSN
│   │   ├── Email, Phone
│   │   └── PreferredContact
│   ├── Address (Value Object)
│   ├── Employment (Value Object)
│   │   ├── Status, Employer
│   │   ├── Title, YearsEmployed
│   │   └── Income
│   └── Consents[] (Value Object)
├── CoApplicant (Entity, optional)
├── Property (Value Object)
│   ├── InstallationAddress
│   ├── PropertyType
│   ├── OwnershipStatus
│   └── YearBuilt
├── WorkOrder (Entity)
│   ├── Equipment[] (Value Object)
│   ├── ProjectTotal
│   ├── DownPayment
│   └── InstallationDate
├── Offers[] (Entity)
│   ├── OfferId
│   ├── PartnerId
│   ├── Amount, Term, Rate
│   ├── MonthlyPayment
│   └── Status
├── SelectedOffer (Value Object)
├── Verifications (Entity)
│   ├── DeedVerification
│   └── IncomeVerification
├── PartnerData (Value Object)
│   ├── MomntData
│   ├── ThriveData
│   ├── MicrofData
│   └── BreezeData
├── Status (ApplicationStatus enum)
├── DealerId (Reference)
└── Timeline[] (Value Object)
```

**Application Status State Machine:**
```
                    ┌─────────────────┐
                    │   INVITATION    │
                    │     SENT        │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │  PREQUALIFYING  │
                    └────────┬────────┘
                             │
              ┌──────────────┼──────────────┐
              ▼              ▼              ▼
     ┌────────────┐  ┌────────────┐  ┌────────────┐
     │ PREQUALIFIED│  │  DECLINED  │  │   REVIEW   │
     └──────┬─────┘  └────────────┘  │  REQUIRED  │
            │                        └──────┬─────┘
            │                               │
            ▼                               │
     ┌────────────┐                         │
     │APPLICATION │◄────────────────────────┘
     │  STARTED   │
     └──────┬─────┘
            │
            ▼
     ┌────────────┐
     │ UNDERWRITING│──────────────────────────┐
     └──────┬─────┘                           │
            │                                 │
     ┌──────┴──────┬──────────────┐          │
     ▼             ▼              ▼          ▼
┌─────────┐  ┌──────────┐  ┌──────────┐  ┌─────────┐
│APPROVED │  │APPROVED  │  │ MANUAL   │  │DECLINED │
│         │  │FOR LESS  │  │ REVIEW   │  │         │
└────┬────┘  └────┬─────┘  └────┬─────┘  └─────────┘
     │            │             │
     └────────────┼─────────────┘
                  ▼
          ┌────────────┐
          │OFFER       │
          │SELECTION   │
          └──────┬─────┘
                 │
                 ▼
          ┌────────────┐
          │WORK ORDER  │
          │SAVED       │
          └──────┬─────┘
                 │
                 ▼
          ┌────────────┐
          │PENDING     │
          │DOC SIGN    │
          └──────┬─────┘
                 │
                 ▼
          ┌────────────┐
          │DOCS        │
          │SIGNED      │
          └──────┬─────┘
                 │
                 ▼
          ┌────────────┐
          │FIRST       │
          │PAYMENT     │
          └──────┬─────┘
                 │
                 ▼
          ┌────────────┐
          │READY FOR   │
          │INSTALLATION│
          └────────────┘
```

**Domain Events:**
- `PrequalificationInvitationSent`
- `PrequalificationSubmitted`
- `PrequalificationDecisionRendered`
- `ApplicationCreated`
- `ApplicationSubmitted`
- `UnderwritingDecisionRendered`
- `OfferSelected`
- `WorkOrderSaved`
- `DocumentSigningRequested`
- `DocumentsSigned`
- `FirstPaymentReceived`
- `ApplicationReadyForInstallation`
- `ApplicationWithdrawn`
- `ApplicationCancelled`
- `AdverseActionGenerated`

**Public Interface:**
```
Commands:
  - SendPrequalInvitation(dealerId, customerInfo)
  - SubmitPrequalification(invitationId, applicantInfo, consent)
  - CreateApplication(dealerId, applicantInfo)
  - AddCoApplicant(applicationId, coApplicantInfo)
  - SubmitForUnderwriting(applicationId)
  - SelectOffer(applicationId, offerId)
  - SaveWorkOrder(applicationId, workOrderData)
  - RequestDocumentSigning(applicationId)
  - RecordFirstPayment(applicationId, paymentInfo)
  - WithdrawApplication(applicationId, reason)
  - CancelApplication(applicationId, reason)

Queries:
  - GetApplicationById(applicationId)
  - GetApplicationsByDealer(dealerId, filters)
  - GetApplicationsByStatus(status)
  - GetAvailableOffers(applicationId)
  - GetApplicationTimeline(applicationId)
```

---

### 4. UNDERWRITING CONTEXT

**Purpose:** Manages credit evaluation, automated/manual decisions, and verification services.

**BDD Source:** Module 4 (24 stories)

**Ubiquitous Language:**
| Term | Definition |
|------|------------|
| Credit Pull | Request to credit bureau (soft or hard) |
| Credit Report | Bureau response with credit data |
| Credit Freeze | Bureau-imposed block on credit access |
| Underwriting Rules | Configurable criteria for decisions |
| Credit Band | Score range for tiered pricing |
| DTI | Debt-to-income ratio |
| Manual Review | Human evaluation of borderline cases |
| Income Verification | Process to confirm stated income |
| Deed Verification | Process to confirm property ownership |

**Aggregate: CreditEvaluation**
```
CreditEvaluation (Aggregate Root)
├── EvaluationId (Identity)
├── ApplicationId (Reference)
├── CreditPull (Entity)
│   ├── Type (Soft/Hard)
│   ├── Bureau
│   ├── RequestedAt
│   └── Response
├── CreditReport (Entity)
│   ├── Score
│   ├── Tradelines[]
│   ├── Inquiries[]
│   ├── PublicRecords[]
│   └── ReportPDF
├── UnderwritingResult (Value Object)
│   ├── Decision (Approve/Decline/Review)
│   ├── ApprovalAmount
│   ├── CreditBand
│   ├── DTI
│   └── MatchedRules[]
└── Status (Pending/Complete/Frozen)
```

**Aggregate: ManualReviewCase**
```
ManualReviewCase (Aggregate Root)
├── CaseId (Identity)
├── ApplicationId (Reference)
├── EvaluationId (Reference)
├── AssignedTo (UserId)
├── Priority
├── TriggerReasons[]
├── Decision (Value Object)
│   ├── Outcome
│   ├── ApprovalAmount
│   ├── Conditions[]
│   └── Rationale
└── Status (Queued/InReview/Decided)
```

**Aggregate: Verification**
```
Verification (Aggregate Root)
├── VerificationId (Identity)
├── ApplicationId (Reference)
├── Type (Income/Deed)
├── Documents[] (Entity)
├── Result (Value Object)
│   ├── Status
│   ├── VerifiedAmount
│   └── Notes
└── ReviewedBy (UserId)
```

**Aggregate: UnderwritingConfig**
```
UnderwritingConfig (Aggregate Root)
├── ConfigId (Identity)
├── Name
├── CriteriaGroups[] (Entity)
│   ├── GroupId
│   ├── Conditions[]
│   ├── Decision
│   └── Priority
├── CreditBands[] (Value Object)
└── DTIThresholds (Value Object)
```

**Domain Events:**
- `CreditPullRequested`
- `CreditPullCompleted`
- `CreditFreezeDetected`
- `UnderwritingDecisionRendered`
- `ManualReviewQueued`
- `ManualReviewAssigned`
- `ManualReviewCompleted`
- `IncomeVerificationRequested`
- `IncomeVerificationCompleted`
- `DeedVerificationRequested`
- `DeedVerificationCompleted`

**Public Interface:**
```
Commands:
  - RequestCreditPull(applicationId, type, applicantInfo)
  - EvaluateApplication(applicationId, companyConfigId)
  - AssignManualReview(caseId, underwriterId)
  - CompleteManualReview(caseId, decision, rationale)
  - RequestIncomeVerification(applicationId)
  - SubmitIncomeDocuments(applicationId, documents[])
  - CompleteIncomeVerification(applicationId, result)
  - RequestDeedVerification(applicationId)
  - CompleteDeedVerification(applicationId, result)

Queries:
  - GetCreditReport(applicationId)
  - GetUnderwritingResult(applicationId)
  - GetManualReviewQueue(filters)
  - GetVerificationStatus(applicationId)
  - GetUnderwritingConfig(configId)
```

---

### 5. PRICING CONTEXT

**Purpose:** Manages quote generation, pricing models, tax calculation, and equipment catalog.

**BDD Source:** Module 5 (22 stories)

**Ubiquitous Language:**
| Term | Definition |
|------|------------|
| Quote | Calculated payment terms for a project |
| Rate Sheet | Partner-specific pricing configuration |
| Pricing Model | Algorithm for payment calculation |
| Bundle | Pre-configured equipment package |
| Tax Rate | Location-specific sales tax percentage |
| AHRI | Equipment certification database |
| Dealer Fee | Partner-specific compensation rate |
| Buy-Down | Reduced rate through dealer subsidy |

**Aggregate: Quote**
```
Quote (Aggregate Root)
├── QuoteId (Identity)
├── ApplicationId (Reference)
├── ProjectAmount
├── DownPayment
├── FinancedAmount
├── TaxRate (Value Object)
├── Offers[] (Entity)
│   ├── PartnerId
│   ├── Term
│   ├── Rate
│   ├── MonthlyPayment
│   ├── TotalCost
│   └── DealerFee
└── CreatedAt
```

**Aggregate: RateSheet**
```
RateSheet (Aggregate Root)
├── RateSheetId (Identity)
├── PartnerId
├── Name
├── Products[] (Entity)
│   ├── ProductId
│   ├── Name
│   ├── APR
│   ├── Term
│   ├── DealerFee
│   ├── MaxApproval
│   ├── CreditBandEligibility
│   └── PromoTerms
├── EffectiveDate
└── Status (Active/Inactive)
```

**Aggregate: Equipment**
```
Equipment (Aggregate Root)
├── EquipmentId (Identity)
├── Brand
├── Model
├── Type (HVAC/WaterHeater/etc)
├── Specifications (Value Object)
├── AHRINumber
└── WarrantyInfo (Value Object)
```

**Domain Events:**
- `QuoteGenerated`
- `QuoteUpdated`
- `RateSheetCreated`
- `RateSheetActivated`
- `TaxRateResolved`
- `EquipmentIdentified`

**Public Interface:**
```
Commands:
  - GenerateQuote(applicationId, projectAmount, equipment[])
  - UpdateQuote(quoteId, changes)
  - CreateRateSheet(partnerId, products[])
  - ActivateRateSheet(rateSheetId)
  - AddEquipment(equipmentData)
  - IdentifyEquipmentFromInvoice(invoiceImage)

Queries:
  - GetQuote(quoteId)
  - GetRateSheet(partnerId, effectiveDate)
  - GetTaxRate(address)
  - SearchEquipment(modelNumber)
  - GetEquipmentByAHRI(ahriNumber)
```

---

### 6. DOCUMENT CONTEXT

**Purpose:** Manages document generation, e-signatures, and secure storage.

**BDD Source:** Module 6 (12 stories)

**Ubiquitous Language:**
| Term | Definition |
|------|------------|
| Document | Generated or uploaded file |
| Template | Document structure with placeholders |
| E-Signature | Electronic signature capture |
| Signing Envelope | Multi-party signature workflow |
| Fully Executed | All signatures obtained |

**Aggregate: Document**
```
Document (Aggregate Root)
├── DocumentId (Identity)
├── Type (LeaseAgreement/MerchantAgreement/NDA/AdverseAction/Buyout)
├── TemplateId
├── AssociatedEntity (Value Object)
│   ├── EntityType (Application/Company)
│   └── EntityId
├── Content (Binary)
├── Signers[] (Entity)
│   ├── SignerId
│   ├── Name
│   ├── Email
│   ├── Status (Pending/Signed)
│   └── SignedAt
├── Status (Draft/Sent/PartiallySigned/FullyExecuted)
└── StorageLocation
```

**Domain Events:**
- `DocumentGenerated`
- `SigningRequestSent`
- `DocumentSigned`
- `DocumentFullyExecuted`
- `DocumentUploaded`
- `DocumentDownloaded`

**Public Interface:**
```
Commands:
  - GenerateDocument(type, entityId, data)
  - SendForSigning(documentId, signers[])
  - RecordSignature(documentId, signerId, signatureData)
  - ResendSigningRequest(documentId, signerId)
  - UploadDocument(entityId, file, metadata)

Queries:
  - GetDocument(documentId)
  - GetDocumentsByEntity(entityType, entityId)
  - GetSigningStatus(documentId)
  - DownloadDocument(documentId)
```

---

### 7. FULFILLMENT CONTEXT

**Purpose:** Manages installation authorization, documentation verification, and contractor payments.

**BDD Source:** Module 7 (12 stories)

**Ubiquitous Language:**
| Term | Definition |
|------|------------|
| Installation | Physical equipment installation |
| Funding | Payment to contractor for completed work |
| Funding Paperwork | Documents required for payment |
| Contractor Payment | ACH transfer to dealer |
| Partner Funding | Payment request to external partner |

**Aggregate: Installation**
```
Installation (Aggregate Root)
├── InstallationId (Identity)
├── ApplicationId (Reference)
├── DealerId (Reference)
├── AuthorizationStatus (Pending/Authorized)
├── ScheduledDate
├── CompletionDate
├── Equipment[] (Value Object)
│   ├── Model
│   ├── SerialNumber
│   └── Verified
├── Documentation (Entity)
│   ├── Invoice
│   ├── Photos[]
│   ├── Certificates[]
│   └── VerificationStatus
└── FundingStatus (Pending/Submitted/Verified/Funded)
```

**Aggregate: ContractorPayment**
```
ContractorPayment (Aggregate Root)
├── PaymentId (Identity)
├── InstallationId (Reference)
├── DealerId (Reference)
├── Amount
├── BankAccount (Value Object)
├── Status (Queued/Processing/Completed/Failed)
├── ProcessedAt
└── TransactionRef
```

**Domain Events:**
- `InstallationAuthorized`
- `InstallationCompleted`
- `FundingDocumentationSubmitted`
- `FundingDocumentationVerified`
- `ContractorPaymentInitiated`
- `ContractorPaymentCompleted`
- `PartnerFundingRequested`
- `PartnerFundingReceived`

**Public Interface:**
```
Commands:
  - AuthorizeInstallation(applicationId)
  - RecordInstallationCompletion(applicationId, completionData)
  - SubmitFundingDocumentation(installationId, documents)
  - VerifyFundingDocumentation(installationId, decision)
  - RequestAdditionalDocumentation(installationId, requirements)
  - InitiateContractorPayment(installationId)
  - RequestPartnerFunding(installationId, partnerId)

Queries:
  - GetInstallation(installationId)
  - GetInstallationsByDealer(dealerId, filters)
  - GetFundingStatus(installationId)
  - GetPaymentHistory(dealerId)
```

---

### 8. BILLING CONTEXT

**Purpose:** Manages all billing and payment operations for Premier Program accounts.

**BDD Source:** Module 8 (23 stories)

**Ubiquitous Language:**
| Term | Definition |
|------|------------|
| Billing Account | Financial account for a Premier enrollment |
| Invoice | Monthly statement of charges |
| Autopay | Automatic payment enrollment |
| Payment Method | Stored card or bank account |
| Late Fee | Penalty for overdue payment |
| Dunning | Collection communication sequence |
| Days Past Due | Delinquency measurement |
| Statement Fee | Charge for paper statements |

**Aggregate: BillingAccount**
```
BillingAccount (Aggregate Root)
├── BillingAccountId (Identity)
├── ApplicationId (Reference)
├── CustomerInfo (Value Object)
├── LeaseTerms (Value Object)
│   ├── RetailPrice
│   ├── Term
│   ├── MonthlyPayment
│   └── StartDate
├── PaymentMethods[] (Entity)
│   ├── MethodId
│   ├── Type (Card/Bank)
│   ├── Last4
│   ├── ExternalId
│   └── IsDefault
├── AutopayConfig (Value Object)
│   ├── Enabled
│   ├── MethodId
│   └── ScheduleDay
├── Balance (Value Object)
│   ├── CurrentDue
│   ├── PastDue
│   ├── Fees
│   └── LastCalculated
├── DelinquencyStatus (Value Object)
│   ├── DaysPastDue
│   ├── DunningStage
│   └── LastAction
└── Preferences (Value Object)
    ├── PaperStatement
    └── CommunicationPrefs
```

**Aggregate: Invoice**
```
Invoice (Aggregate Root)
├── InvoiceId (Identity)
├── BillingAccountId (Reference)
├── BillingPeriod (Value Object)
├── LineItems[] (Value Object)
├── PreviousBalance
├── PaymentsReceived
├── NewCharges
├── Fees
├── TotalDue
├── DueDate
└── Status (Generated/Delivered/Paid/PastDue)
```

**Aggregate: Payment**
```
Payment (Aggregate Root)
├── PaymentId (Identity)
├── BillingAccountId (Reference)
├── Amount
├── PaymentMethod (Value Object)
├── Type (OneTime/Autopay/Scheduled)
├── Status (Pending/Completed/Failed/Reversed/Refunded)
├── ProcessedAt
├── TransactionRef
└── FailureReason
```

**Domain Events:**
- `BillingAccountCreated`
- `PaymentMethodAdded`
- `AutopayEnabled`
- `AutopayDisabled`
- `InvoiceGenerated`
- `PaymentProcessed`
- `PaymentFailed`
- `PaymentRefunded`
- `LateFeeAssessed`
- `DunningNotificationSent`
- `AccountDelinquent`

**Public Interface:**
```
Commands:
  - CreateBillingAccount(applicationId, leaseTerms)
  - AddPaymentMethod(billingAccountId, methodData)
  - RemovePaymentMethod(billingAccountId, methodId)
  - EnableAutopay(billingAccountId, methodId, scheduleDay)
  - DisableAutopay(billingAccountId)
  - ProcessPayment(billingAccountId, amount, methodId)
  - SchedulePayment(billingAccountId, amount, date)
  - CancelScheduledPayment(paymentId)
  - RefundPayment(paymentId, amount, reason)
  - ApplyCredit(billingAccountId, amount, reason)
  - AssessLateFee(billingAccountId)

Queries:
  - GetBillingAccount(billingAccountId)
  - GetBillingHistory(billingAccountId)
  - GetInvoice(invoiceId)
  - GetPaymentHistory(billingAccountId)
  - GetDelinquentAccounts(daysPastDue)
  - GetBalanceDue(billingAccountId)
```

---

### 9. SERVICING CONTEXT

**Purpose:** Manages post-origination account activities including maintenance, customer service, and lifecycle events.

**BDD Source:** Module 9 (34 stories)

**Ubiquitous Language:**
| Term | Definition |
|------|------------|
| Service Request | Customer maintenance/service request |
| Task | Internal action item for resolution |
| Buyout | Process to purchase leased equipment |
| Termination | Ending an active account |
| Archive | Moving completed account to cold storage |
| Worry-Free Rewards | Loyalty program for on-time payments |

**Aggregate: ServiceRequest**
```
ServiceRequest (Aggregate Root)
├── RequestId (Identity)
├── AccountId (Reference)
├── Type (Maintenance/Repair/Emergency)
├── Description
├── ScheduledDate
├── CompletionDate
├── Invoice (Entity)
│   ├── Amount
│   ├── LineItems[]
│   └── Status
└── Status (Submitted/Scheduled/Completed/Invoiced/Paid)
```

**Aggregate: ServiceTask**
```
ServiceTask (Aggregate Root)
├── TaskId (Identity)
├── AccountId (Reference)
├── Description
├── AssignedTo (UserId)
├── Priority
├── DueDate
├── Notes[] (Value Object)
└── Status (Open/InProgress/Completed)
```

**Aggregate: BuyoutRequest**
```
BuyoutRequest (Aggregate Root)
├── BuyoutId (Identity)
├── AccountId (Reference)
├── BuyoutAmount (Value Object)
│   ├── RemainingPrincipal
│   ├── Fees
│   └── Total
├── ExpirationDate
├── PaymentId (Reference, optional)
└── Status (Quoted/Accepted/Paid/Completed/Cancelled)
```

**Aggregate: AccountNote**
```
AccountNote (Aggregate Root)
├── NoteId (Identity)
├── AccountId (Reference)
├── Content
├── CreatedBy (UserId)
├── CreatedAt
└── Type (Internal/CustomerInteraction)
```

**Domain Events:**
- `ServiceRequestCreated`
- `ServiceAppointmentScheduled`
- `ServiceCompleted`
- `MaintenanceInvoiceProcessed`
- `TaskCreated`
- `TaskAssigned`
- `TaskCompleted`
- `BuyoutRequested`
- `BuyoutQuoteGenerated`
- `BuyoutCompleted`
- `AccountTerminated`
- `AccountArchived`
- `NoteAdded`

**Public Interface:**
```
Commands:
  - CreateServiceRequest(accountId, type, description)
  - ScheduleServiceAppointment(requestId, date)
  - CompleteService(requestId, completionDetails)
  - ProcessMaintenanceInvoice(requestId, invoiceData)
  - CreateTask(accountId, description, priority)
  - AssignTask(taskId, userId)
  - CompleteTask(taskId, resolution)
  - RequestBuyout(accountId)
  - AcceptBuyout(buyoutId)
  - ProcessBuyoutPayment(buyoutId, paymentInfo)
  - TerminateAccount(accountId, reason)
  - AddNote(accountId, content, type)

Queries:
  - GetServiceRequests(accountId)
  - GetTasksByAssignee(userId)
  - GetBuyoutQuote(accountId)
  - GetAccountNotes(accountId)
  - SearchAccounts(criteria)
  - GetAccountSummary(accountId)
  - GetArchivedAccount(accountId)
```

---

### 10. COMMUNICATION CONTEXT

**Purpose:** Cross-cutting context managing all notification channels.

**BDD Source:** Module 10 (13 stories)

**Ubiquitous Language:**
| Term | Definition |
|------|------------|
| Notification | Message to a user via any channel |
| Channel | Delivery method (Email/SMS/InApp) |
| Template | Message structure with placeholders |
| Preference | User's channel selections |

**Aggregate: Notification**
```
Notification (Aggregate Root)
├── NotificationId (Identity)
├── RecipientId (UserId)
├── Channel (Email/SMS/InApp)
├── TemplateId
├── Subject
├── Content
├── Metadata (Value Object)
├── SentAt
├── DeliveryStatus
└── ReadAt (for InApp)
```

**Aggregate: NotificationPreference**
```
NotificationPreference (Aggregate Root)
├── UserId (Identity)
├── ChannelPreferences[] (Value Object)
│   ├── NotificationType
│   ├── EmailEnabled
│   ├── SMSEnabled
│   └── InAppEnabled
└── UpdatedAt
```

**Domain Events:**
- `NotificationRequested`
- `NotificationSent`
- `NotificationDelivered`
- `NotificationFailed`
- `NotificationRead`
- `PreferencesUpdated`

**Public Interface:**
```
Commands:
  - SendNotification(recipientId, type, channel, data)
  - SendBulkNotification(recipientIds[], type, data)
  - MarkAsRead(notificationId)
  - UpdatePreferences(userId, preferences)

Queries:
  - GetNotifications(userId, filters)
  - GetUnreadCount(userId)
  - GetPreferences(userId)
```

---

### 11. PROMOTION CONTEXT

**Purpose:** Manages promotional offers and incentive campaigns.

**BDD Source:** Module 11 (6 stories)

**Ubiquitous Language:**
| Term | Definition |
|------|------------|
| Promotion | Special offer with defined terms |
| Eligibility Rules | Criteria for promotion access |
| Promo Code | Identifier to apply promotion |

**Aggregate: Promotion**
```
Promotion (Aggregate Root)
├── PromotionId (Identity)
├── Name
├── Description
├── Terms (Value Object)
│   ├── DiscountType
│   ├── DiscountValue
│   └── SpecialConditions
├── Eligibility (Value Object)
│   ├── CompanyIds[]
│   ├── ProductTypes[]
│   ├── AmountRange
│   └── Regions[]
├── ValidFrom
├── ValidTo
├── PromoCode (optional)
└── Status (Active/Inactive/Expired)
```

**Domain Events:**
- `PromotionCreated`
- `PromotionActivated`
- `PromotionApplied`
- `PromotionExpired`

**Public Interface:**
```
Commands:
  - CreatePromotion(promotionData)
  - UpdatePromotion(promotionId, changes)
  - ActivatePromotion(promotionId)
  - DeactivatePromotion(promotionId)
  - ApplyPromotion(applicationId, promotionId)

Queries:
  - GetPromotion(promotionId)
  - GetActivePromotions(companyId)
  - ValidatePromotion(promotionId, applicationId)
```

---

### 12. PARTNER GATEWAY CONTEXT (Anti-Corruption Layer)

**Purpose:** Isolates external partner integrations with clean internal interfaces.

**BDD Source:** Modules 2, 3, 7 (partner-related stories)

**Subcontexts:**

#### Momnt Gateway
```
MomntGateway
├── SubmitApplication(applicantData) → MomntApplicationId
├── RequestHardPull(applicationId) → Decision
├── SubmitFinalApplication(applicationId, data) → Status
├── AcceptLoan(applicationId) → Confirmation
├── CancelApplication(applicationId) → Confirmation
├── RequestFunding(applicationId, installationData) → FundingStatus
├── RequestRefund(applicationId, amount) → RefundStatus
```

#### Thrive Gateway
```
ThriveGateway
├── SubmitApplication(applicantData) → ThriveApplicationId
├── GetDecision(applicationId) → Decision
├── SubmitFinalApplication(applicationId, data) → Status
├── RequestFunding(applicationId) → FundingStatus
```

#### Microf Gateway
```
MicrofGateway
├── SubmitApplication(applicantData) → MicrofApplicationId
├── SubmitIncomeProof(applicationId, documents) → Status
├── CheckIncomeVerification(applicationId) → VerificationStatus
├── AcceptLease(applicationId) → Confirmation
├── CompleteWorkOrder(applicationId, completionData) → FundingStatus
├── RefreshStatus(applicationId) → CurrentStatus
```

#### Breeze Gateway
```
BreezeGateway
├── CreateApplication(applicantData) → BreezeApplicationId
├── CalculateTerms(cartItems, applicantInfo) → LeaseTerms
├── InitiateCheckout(applicationId) → CheckoutSession
├── ProcessDownPayment(sessionId, paymentData) → PaymentResult
├── SignContract(applicationId) → ContractStatus
├── SetDeliveryDate(applicationId, date, equipment) → FundingStatus
├── CancelFunding(applicationId, reason) → Confirmation
├── CancelLease(applicationId, reason) → Confirmation
```

**Translation Maps:**
Each gateway maintains translation between:
- Internal domain concepts ↔ Partner API schemas
- Internal statuses ↔ Partner-specific statuses
- Internal events ↔ Partner webhook payloads

---

## Context Relationships

### Context Map

```
┌────────────────────────────────────────────────────────────────────────┐
│                           CONTEXT MAP                                   │
├────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌─────────────┐                                                        │
│  │  IDENTITY   │◄──────────────[Conformist]──────────────────┐         │
│  │             │                                              │         │
│  └──────┬──────┘                                              │         │
│         │                                                     │         │
│         │[Published Language]                                 │         │
│         │                                                     │         │
│         ▼                                                     │         │
│  ┌─────────────┐     [Customer/Supplier]      ┌──────────────┴───┐    │
│  │  MERCHANT   │◄────────────────────────────►│   ORIGINATION    │    │
│  │             │                              │                  │    │
│  └──────┬──────┘                              └────────┬─────────┘    │
│         │                                              │              │
│         │                    ┌─────────────────────────┼──────────┐   │
│         │                    │                         │          │   │
│         │                    ▼                         ▼          │   │
│         │            ┌──────────────┐         ┌──────────────┐    │   │
│         │            │ UNDERWRITING │◄───────►│   PRICING    │    │   │
│         │            │              │  [SK]   │              │    │   │
│         │            └──────┬───────┘         └──────┬───────┘    │   │
│         │                   │                        │            │   │
│         │                   │                        │            │   │
│         │                   ▼                        ▼            │   │
│         │            ┌──────────────┐         ┌──────────────┐    │   │
│         │            │   DOCUMENT   │         │ FULFILLMENT  │    │   │
│         │            │              │         │              │    │   │
│         │            └──────────────┘         └──────┬───────┘    │   │
│         │                                            │            │   │
│         │                    ┌────────────────────────┘            │   │
│         │                    │                                     │   │
│         │                    ▼                                     │   │
│         │            ┌──────────────┐         ┌──────────────┐    │   │
│         └───────────►│   BILLING    │◄───────►│  SERVICING   │◄───┘   │
│                      │              │  [PL]   │              │        │
│                      └──────────────┘         └──────────────┘        │
│                                                                        │
│  ┌─────────────────────────────────────────────────────────────────┐  │
│  │                    SUPPORTING CONTEXTS                           │  │
│  │                                                                  │  │
│  │   ┌─────────────┐    ┌─────────────┐    ┌──────────────────┐   │  │
│  │   │COMMUNICATION│    │  PROMOTION  │    │ PARTNER GATEWAY  │   │  │
│  │   │             │    │             │    │       (ACL)      │   │  │
│  │   │ [OHS/PL]    │    │ [Conformist]│    │                  │   │  │
│  │   └─────────────┘    └─────────────┘    └──────────────────┘   │  │
│  │         ▲                  ▲                    ▲              │  │
│  │         │                  │                    │              │  │
│  │    [All Core Contexts] [Origination,      [Origination,       │  │
│  │                         Billing]           Fulfillment]        │  │
│  └─────────────────────────────────────────────────────────────────┘  │
│                                                                        │
│  LEGEND:                                                               │
│  ─────────────────────────────────────────────                        │
│  [SK]  = Shared Kernel                                                 │
│  [PL]  = Published Language                                            │
│  [ACL] = Anti-Corruption Layer                                         │
│  [OHS] = Open Host Service                                             │
│  [C/S] = Customer/Supplier                                             │
│                                                                        │
└────────────────────────────────────────────────────────────────────────┘
```

### Relationship Types

| Upstream | Downstream | Relationship | Notes |
|----------|------------|--------------|-------|
| Identity | All contexts | Published Language | All contexts consume user identity |
| Merchant | Origination | Customer/Supplier | Origination needs dealer info |
| Origination | Underwriting | Customer/Supplier | Underwriting evaluates applications |
| Underwriting | Pricing | Shared Kernel | Credit bands shared for pricing |
| Origination | Document | Customer/Supplier | Documents generated from application |
| Origination | Fulfillment | Customer/Supplier | Fulfillment follows origination |
| Fulfillment | Billing | Customer/Supplier | Billing starts after installation |
| Billing | Servicing | Published Language | Account balance shared |
| Communication | All contexts | Open Host Service | Any context can send notifications |
| Promotion | Origination, Billing | Conformist | Promos applied during origination |
| Partner Gateway | Origination, Fulfillment | ACL | Isolates partner complexity |

---

## Deployment Boundaries

Each bounded context is **independently deployable** with:
- Separate repository
- Independent CI/CD pipeline
- Own database (no shared schemas)
- Versioned API contracts
- Event-driven communication

### Recommended Service Boundaries

```
┌─────────────────────────────────────────────────────────────────┐
│                    DEPLOYMENT UNITS                              │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Platform Foundation Layer                                       │
│  ═══════════════════════════                                    │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ identity-service        │ Auth, Users, Roles, Permissions│    │
│  │ Port: 3001              │ DB: identity-db (PostgreSQL)   │    │
│  └─────────────────────────────────────────────────────────┘    │
│                                                                  │
│  Core Business Layer                                             │
│  ══════════════════                                             │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ merchant-service        │ Onboarding, Enrollment, LMS    │    │
│  │ Port: 3002              │ DB: merchant-db (PostgreSQL)   │    │
│  └─────────────────────────────────────────────────────────┘    │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ origination-service     │ Applications, Offers, WorkOrders│   │
│  │ Port: 3003              │ DB: origination-db (PostgreSQL)│    │
│  └─────────────────────────────────────────────────────────┘    │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ underwriting-service    │ Credit, Decisions, Verification│    │
│  │ Port: 3004              │ DB: underwriting-db (PostgreSQL)│   │
│  └─────────────────────────────────────────────────────────┘    │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ pricing-service         │ Quotes, RateSheets, Equipment  │    │
│  │ Port: 3005              │ DB: pricing-db (PostgreSQL)    │    │
│  └─────────────────────────────────────────────────────────┘    │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ document-service        │ Generation, Signatures, Storage│    │
│  │ Port: 3006              │ DB: document-db (PostgreSQL)   │    │
│  │                         │ Storage: S3                     │    │
│  └─────────────────────────────────────────────────────────┘    │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ fulfillment-service     │ Installation, Funding, Payments│    │
│  │ Port: 3007              │ DB: fulfillment-db (PostgreSQL)│    │
│  └─────────────────────────────────────────────────────────┘    │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ billing-service         │ Invoices, Payments, Delinquency│    │
│  │ Port: 3008              │ DB: billing-db (PostgreSQL)    │    │
│  └─────────────────────────────────────────────────────────┘    │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ servicing-service       │ Maintenance, Tasks, Buyout     │    │
│  │ Port: 3009              │ DB: servicing-db (PostgreSQL)  │    │
│  └─────────────────────────────────────────────────────────┘    │
│                                                                  │
│  Supporting Services Layer                                       │
│  ═════════════════════════                                      │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ communication-service   │ Email, SMS, In-App, Real-time  │    │
│  │ Port: 3010              │ DB: notification-db (PostgreSQL)│   │
│  │                         │ Queue: SQS                      │    │
│  └─────────────────────────────────────────────────────────┘    │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ promotion-service       │ Campaigns, Eligibility         │    │
│  │ Port: 3011              │ DB: promotion-db (PostgreSQL)  │    │
│  └─────────────────────────────────────────────────────────┘    │
│                                                                  │
│  Integration Layer (Anti-Corruption)                             │
│  ═══════════════════════════════════                            │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ partner-gateway-service │ Momnt, Thrive, Microf, Breeze  │    │
│  │ Port: 3012              │ DB: partner-db (PostgreSQL)    │    │
│  │                         │ Cache: Redis                    │    │
│  └─────────────────────────────────────────────────────────┘    │
│                                                                  │
│  Shared Infrastructure                                           │
│  ═════════════════════                                          │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ Event Bus: Amazon EventBridge / Kafka                    │    │
│  │ API Gateway: Kong / AWS API Gateway                      │    │
│  │ Service Mesh: (optional) Istio                           │    │
│  │ Secrets: AWS Secrets Manager                             │    │
│  │ Monitoring: CloudWatch / Datadog                         │    │
│  └─────────────────────────────────────────────────────────┘    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Cross-Context Communication

### Domain Events (Async via Event Bus)

All cross-context communication uses domain events. Each context publishes events and subscribes to relevant events from other contexts.

#### Event Schema Convention
```json
{
  "eventId": "uuid",
  "eventType": "context.aggregate.action",
  "occurredAt": "ISO8601",
  "correlationId": "uuid",
  "payload": { },
  "metadata": {
    "version": "1.0",
    "source": "context-name"
  }
}
```

#### Key Event Flows

**Application Lifecycle:**
```
Origination → PrequalificationDecisionRendered → Communication (send notification)
Origination → ApplicationSubmitted → Underwriting (evaluate)
Underwriting → UnderwritingDecisionRendered → Origination (update status)
Origination → DocumentSigningRequested → Document (generate & send)
Document → DocumentFullyExecuted → Origination (update status)
Origination → ApplicationReadyForInstallation → Fulfillment (authorize)
Fulfillment → InstallationCompleted → Billing (create account)
```

**Partner Flows:**
```
Origination → PartnerApplicationRequested → Partner Gateway (submit to partner)
Partner Gateway → PartnerDecisionReceived → Origination (update status)
Fulfillment → PartnerFundingRequested → Partner Gateway (request funding)
Partner Gateway → PartnerFundingReceived → Fulfillment (update status)
```

---

## Next Steps

1. **Iteration 1:** Implement Identity Context (foundation)
2. **Iteration 2:** Implement Merchant Context (dealer onboarding)
3. **Iteration 3:** Implement Origination Context (core business)
4. **Iteration 4:** Implement Underwriting + Pricing Contexts
5. **Iteration 5:** Implement Document + Fulfillment Contexts
6. **Iteration 6:** Implement Billing + Servicing Contexts
7. **Iteration 7:** Implement Communication + Promotion Contexts
8. **Iteration 8:** Implement Partner Gateway Context

Each iteration delivers a **vertical slice** satisfying BDD scenarios for that context.

---

## Appendix: BDD to Context Mapping

| Module | Bounded Context | Stories |
|--------|-----------------|---------|
| Module 1: Identity & Access | Identity Context | 14 |
| Module 2: Dealer Management | Merchant Context | 33 |
| Module 3: Prequalification & Origination | Origination Context | 57 |
| Module 4: Underwriting & Verification | Underwriting Context | 24 |
| Module 5: Pricing & Equipment | Pricing Context | 22 |
| Module 6: Document Management | Document Context | 12 |
| Module 7: Installation & Funding | Fulfillment Context | 12 |
| Module 8: Billing & Payments | Billing Context | 23 |
| Module 9: Account Servicing | Servicing Context | 34 |
| Module 10: Communications | Communication Context | 13 |
| Module 11: Promotions | Promotion Context | 6 |
| Module 12: Administration | Cross-cutting (Config) | 20 |
| Partner Integration (distributed) | Partner Gateway Context | ~25 |

**Total:** 251 user stories mapped to 12 bounded contexts
