# ComfortConnect Platform Implementation Roadmap

**Version:** 1.0  
**Date:** February 17, 2026  
**Approach:** Vertical Slices aligned with BDD Features

---

## Implementation Strategy

### Guiding Principles

1. **BDD-First Development** - Each feature implemented must satisfy corresponding BDD scenarios
2. **Vertical Slices** - Deliver complete functionality from API to database per iteration
3. **Independent Deployability** - Each context deployable without other contexts
4. **Event-Driven Integration** - Contexts communicate via domain events only
5. **Contract-First APIs** - Define API contracts before implementation
6. **Test Coverage** - Unit tests, integration tests, and BDD acceptance tests required

### Technology Stack (Recommended)

| Layer | Technology | Rationale |
|-------|------------|-----------|
| **Language** | TypeScript/Node.js | Strong typing, modern async, ecosystem |
| **Framework** | NestJS | DDD-friendly, modular, enterprise-ready |
| **Database** | PostgreSQL | ACID compliance, JSON support, mature |
| **Event Bus** | Amazon EventBridge | Managed, serverless, schema registry |
| **API Gateway** | AWS API Gateway / Kong | Rate limiting, auth, routing |
| **Auth** | Auth0 | Managed identity, OTP support |
| **E-Signature** | DocuSign / HelloSign | Industry standard |
| **Payments** | Stripe | ACH, cards, comprehensive API |
| **Storage** | AWS S3 | Document storage |
| **Queue** | AWS SQS | Async processing |
| **Cache** | Redis | Session, rate limiting |

---

## Iteration Plan

### Phase 1: Foundation (Weeks 1-4)

#### Iteration 1.1: Identity Context - Core Authentication
**BDD Features:** `user-registration-authentication.feature`

**Deliverables:**
```
identity-service/
├── src/
│   ├── domain/
│   │   ├── aggregates/
│   │   │   └── User.ts
│   │   ├── entities/
│   │   │   └── Profile.ts
│   │   ├── value-objects/
│   │   │   ├── UserId.ts
│   │   │   ├── Email.ts
│   │   │   ├── PhoneNumber.ts
│   │   │   └── Authentication.ts
│   │   ├── events/
│   │   │   ├── UserRegistered.ts
│   │   │   └── UserAuthenticated.ts
│   │   └── repositories/
│   │       └── IUserRepository.ts
│   ├── application/
│   │   ├── commands/
│   │   │   ├── RegisterUser.ts
│   │   │   └── AuthenticateWithOTP.ts
│   │   ├── queries/
│   │   │   └── GetUserById.ts
│   │   └── services/
│   │       └── AuthenticationService.ts
│   ├── infrastructure/
│   │   ├── persistence/
│   │   │   └── PostgresUserRepository.ts
│   │   ├── auth/
│   │   │   └── Auth0Provider.ts
│   │   └── messaging/
│   │       └── EventBridgePublisher.ts
│   └── interface/
│       ├── http/
│       │   └── UserController.ts
│       └── events/
│           └── EventHandlers.ts
├── test/
│   ├── unit/
│   ├── integration/
│   └── acceptance/
│       └── user-registration-authentication.steps.ts
└── package.json
```

**Acceptance Criteria (from BDD):**
- [ ] Dealer employee can register with invitation
- [ ] OTP delivered via SMS/email
- [ ] OTP authentication grants access
- [ ] Homeowner can register with active financing agreement

---

#### Iteration 1.2: Identity Context - Roles & Permissions
**BDD Features:** `role-permission-management.feature`, `partner-access-management.feature`

**Deliverables:**
- Role aggregate with entitlements
- Permission evaluation service
- Partner access configuration
- RBAC middleware

**Acceptance Criteria:**
- [ ] Administrator can assign roles to users
- [ ] Role permissions immediately reflect on users
- [ ] Partner access restricts visible options
- [ ] Permission changes propagate immediately

---

#### Iteration 1.3: Identity Context - Profile Management
**BDD Features:** `profile-management.feature`

**Deliverables:**
- Profile entity with preferences
- Impersonation capability
- User deactivation workflow

**Acceptance Criteria:**
- [ ] User can update profile information
- [ ] CSR can impersonate users (logged)
- [ ] Administrator can deactivate accounts
- [ ] Historical activity preserved on deactivation

---

### Phase 2: Merchant Onboarding (Weeks 5-8)

#### Iteration 2.1: Merchant Context - Application Flow
**BDD Features:** `merchant-application.feature`

**Deliverables:**
```
merchant-service/
├── src/
│   ├── domain/
│   │   ├── aggregates/
│   │   │   ├── MerchantApplication.ts
│   │   │   └── Company.ts
│   │   ├── entities/
│   │   │   ├── Owner.ts
│   │   │   ├── Location.ts
│   │   │   └── License.ts
│   │   ├── value-objects/
│   │   │   ├── LegalInfo.ts
│   │   │   ├── BankingInfo.ts
│   │   │   ├── ContactInfo.ts
│   │   │   └── OnboardingStatus.ts
│   │   ├── events/
│   │   │   ├── MerchantInvitationSent.ts
│   │   │   ├── ApplicationSubmitted.ts
│   │   │   ├── ApplicationApproved.ts
│   │   │   └── ApplicationDeclined.ts
│   │   └── services/
│   │       └── OnboardingWorkflow.ts
│   ├── application/
│   │   ├── commands/
│   │   │   ├── InviteMerchant.ts
│   │   │   ├── SaveApplicationProgress.ts
│   │   │   └── SubmitApplication.ts
│   │   └── queries/
│   │       └── GetApplicationStatus.ts
│   └── ...
```

**Acceptance Criteria:**
- [ ] Admin can send merchant invitation
- [ ] Dealer can save partial application
- [ ] Dealer can submit complete application
- [ ] Multiple locations supported
- [ ] Licensing information captured

---

#### Iteration 2.2: Merchant Context - Agreements & Underwriting
**BDD Features:** `merchant-agreement-nda.feature`, `merchant-underwriting.feature`

**Deliverables:**
- NDA generation workflow
- Merchant agreement workflow
- Underwriting review queue
- Document request capability

**Integration Points:**
- Document Context (NDA/Agreement generation)
- Communication Context (notifications)

**Acceptance Criteria:**
- [ ] NDA auto-generated at onboarding start
- [ ] Merchant agreement sent after approval
- [ ] Underwriter can approve/decline/request docs
- [ ] Dealer notified of document requests

---

#### Iteration 2.3: Merchant Context - Partner Enrollment
**BDD Features:** `partner-enrollment.feature`

**Deliverables:**
- Partner enrollment state machine
- Momnt enrollment flow (bank verification)
- Microf/Breeze/Thrive enrollment flows
- Status synchronization

**Integration Points:**
- Partner Gateway Context (external APIs)
- Communication Context (status updates)

**Acceptance Criteria:**
- [ ] Premier enrollment by admin
- [ ] Momnt bank account setup with micro-deposits
- [ ] Partner enrollment status tracked
- [ ] Dealers notified of enrollment changes

---

#### Iteration 2.4: Merchant Context - Training/LMS
**BDD Features:** `course-management.feature`, `training-enrollment.feature`, `training-compliance.feature`

**Deliverables:**
- Course aggregate with lessons
- Training enrollment tracking
- Compliance reporting
- Partner-required training gates

**Acceptance Criteria:**
- [ ] Admin can create courses with lessons
- [ ] Dealers can enroll and track progress
- [ ] Training completion gates partner access
- [ ] Compliance reporting available

---

### Phase 3: Core Origination (Weeks 9-14)

#### Iteration 3.1: Origination Context - Prequalification
**BDD Features:** `prequalification-invitation.feature`, `prequalification-application.feature`, `prequalification-decision.feature`

**Deliverables:**
```
origination-service/
├── src/
│   ├── domain/
│   │   ├── aggregates/
│   │   │   └── Application.ts
│   │   ├── entities/
│   │   │   ├── Applicant.ts
│   │   │   ├── CoApplicant.ts
│   │   │   ├── Property.ts
│   │   │   ├── WorkOrder.ts
│   │   │   └── Offer.ts
│   │   ├── value-objects/
│   │   │   ├── ApplicationId.ts
│   │   │   ├── PersonalInfo.ts
│   │   │   ├── Employment.ts
│   │   │   ├── Address.ts
│   │   │   ├── Consent.ts
│   │   │   └── ApplicationStatus.ts
│   │   ├── events/
│   │   │   ├── PrequalInvitationSent.ts
│   │   │   ├── PrequalSubmitted.ts
│   │   │   ├── PrequalDecisionRendered.ts
│   │   │   └── ...
│   │   └── state-machine/
│   │       └── ApplicationStateMachine.ts
│   └── ...
```

**Integration Points:**
- Underwriting Context (credit evaluation)
- Communication Context (invitations, decisions)

**Acceptance Criteria:**
- [ ] Dealer can send prequal invitation (email/SMS)
- [ ] Homeowner can access via secure link
- [ ] Consent captured with timestamp
- [ ] Decision rendered with product eligibility
- [ ] Adverse action notice for declines

---

#### Iteration 3.2: Origination Context - Premier Application
**BDD Features:** `application-creation.feature`, `homeowner-application-attributes.feature`, `underwriting-decisions.feature`

**Deliverables:**
- Full application workflow
- Applicant/co-applicant capture
- Underwriting submission
- Decision handling (approve/decline/review)

**Integration Points:**
- Underwriting Context (decisions)
- Merchant Context (dealer info)

**Acceptance Criteria:**
- [ ] Dealer creates Premier application
- [ ] Homeowner completes application
- [ ] Co-applicant supported
- [ ] Auto/manual underwriting decisions
- [ ] Credit freeze handling

---

#### Iteration 3.3: Origination Context - Offers & Work Orders
**BDD Features:** `offer-selection.feature`, `work-order-quote.feature`

**Deliverables:**
- Offer generation from pricing
- Offer selection flow
- Work order capture
- Quote modification

**Integration Points:**
- Pricing Context (quote calculation)
- Underwriting Context (approval amounts)

**Acceptance Criteria:**
- [ ] Multiple offers displayed
- [ ] Homeowner selects preferred offer
- [ ] Dealer enters work order details
- [ ] Quote recalculates on changes
- [ ] Tax rate applied correctly

---

#### Iteration 3.4: Origination Context - Document Signing & First Payment
**BDD Features:** `document-signing.feature`, `first-payment.feature`, `verification-requirements.feature`

**Deliverables:**
- Document signing workflow
- First payment processing
- Verification tracking
- Ready for installation status

**Integration Points:**
- Document Context (lease generation, signing)
- Billing Context (first payment)
- Underwriting Context (verifications)

**Acceptance Criteria:**
- [ ] Lease sent for signing
- [ ] Multi-party signatures tracked
- [ ] First payment processed
- [ ] Deed/income verification tracked
- [ ] Status changes to ready for installation

---

#### Iteration 3.5: Origination Context - Partner Flows
**BDD Features:** `momnt-loan-flow.feature`, `thrive-loan-flow.feature`, `microf-lto-flow.feature`, `breeze-lto-flow.feature`

**Deliverables:**
- Momnt application flow
- Thrive application flow
- Microf LTO flow
- Breeze LTO flow
- Status synchronization

**Integration Points:**
- Partner Gateway Context (all partner APIs)

**Acceptance Criteria:**
- [ ] Momnt hard pull authorization
- [ ] Momnt loan acceptance
- [ ] Thrive application submission
- [ ] Microf income proof submission
- [ ] Breeze checkout and down payment
- [ ] All partner statuses synchronized

---

### Phase 4: Underwriting & Pricing (Weeks 15-18)

#### Iteration 4.1: Underwriting Context - Credit Bureau
**BDD Features:** `credit-bureau-integration.feature`

**Deliverables:**
```
underwriting-service/
├── src/
│   ├── domain/
│   │   ├── aggregates/
│   │   │   ├── CreditEvaluation.ts
│   │   │   ├── ManualReviewCase.ts
│   │   │   └── UnderwritingConfig.ts
│   │   ├── entities/
│   │   │   ├── CreditPull.ts
│   │   │   ├── CreditReport.ts
│   │   │   └── Verification.ts
│   │   └── value-objects/
│   │       ├── CreditScore.ts
│   │       ├── CreditBand.ts
│   │       ├── DTI.ts
│   │       └── UnderwritingResult.ts
│   └── ...
```

**Acceptance Criteria:**
- [ ] Soft pull for prequalification
- [ ] Hard pull when authorized
- [ ] Credit report stored securely
- [ ] Credit freeze detection

---

#### Iteration 4.2: Underwriting Context - Decision Engine
**BDD Features:** `automated-underwriting.feature`, `manual-underwriting.feature`

**Deliverables:**
- Rules engine for automated decisions
- Company-specific configurations
- DTI calculation
- Manual review queue
- Decision recording

**Acceptance Criteria:**
- [ ] Automated evaluation against rules
- [ ] Company-specific rules applied
- [ ] DTI calculated correctly
- [ ] Maximum amount determined
- [ ] Manual review queue managed
- [ ] Decision rationale recorded

---

#### Iteration 4.3: Underwriting Context - Verifications
**BDD Features:** `income-verification.feature`, `propertydeed-verification.feature`

**Deliverables:**
- Income verification workflow
- Document upload for income
- Deed verification workflow
- Property listing check

**Acceptance Criteria:**
- [ ] Income verification initiated
- [ ] Documents uploaded and reviewed
- [ ] Deed verification workflow
- [ ] Active listing detection
- [ ] Verification status updates

---

#### Iteration 4.4: Pricing Context - Quotes & Rate Sheets
**BDD Features:** `quote-generation.feature`, `pricing-configuration.feature`, `rate-sheet-configuration.feature`

**Deliverables:**
```
pricing-service/
├── src/
│   ├── domain/
│   │   ├── aggregates/
│   │   │   ├── Quote.ts
│   │   │   ├── RateSheet.ts
│   │   │   └── Equipment.ts
│   │   ├── value-objects/
│   │   │   ├── TaxRate.ts
│   │   │   ├── PaymentCalculation.ts
│   │   │   └── DealerFee.ts
│   │   └── services/
│   │       └── PricingEngine.ts
│   └── ...
```

**Acceptance Criteria:**
- [ ] Quote generation for all products
- [ ] Bundle pricing supported
- [ ] Rate sheets configurable
- [ ] Tax rate lookup by location
- [ ] Missing tax rate handling

---

#### Iteration 4.5: Pricing Context - Equipment
**BDD Features:** `equipment-identification.feature`, `equipment-catalog.feature`, `invoice-verification.feature`

**Deliverables:**
- Equipment catalog management
- Model number lookup
- AI invoice identification
- Serial number capture
- Invoice verification

**Acceptance Criteria:**
- [ ] Equipment lookup by model
- [ ] AHRI database integration
- [ ] AI-based invoice parsing
- [ ] Serial number capture
- [ ] Invoice verification for funding

---

### Phase 5: Documents & Fulfillment (Weeks 19-22)

#### Iteration 5.1: Document Context - Generation
**BDD Features:** `document-generation.feature`

**Deliverables:**
```
document-service/
├── src/
│   ├── domain/
│   │   ├── aggregates/
│   │   │   └── Document.ts
│   │   ├── entities/
│   │   │   └── Signer.ts
│   │   ├── value-objects/
│   │   │   ├── DocumentType.ts
│   │   │   └── SigningStatus.ts
│   │   └── services/
│   │       └── DocumentGenerator.ts
│   └── ...
```

**Acceptance Criteria:**
- [ ] Lease agreement generation
- [ ] Merchant agreement generation
- [ ] Adverse action letter generation
- [ ] Buyout letter generation

---

#### Iteration 5.2: Document Context - E-Signatures
**BDD Features:** `electronic-signatures.feature`

**Deliverables:**
- E-signature integration (DocuSign/HelloSign)
- Multi-party signing flows
- Signature tracking
- Completion webhooks

**Acceptance Criteria:**
- [ ] Document sent for signing
- [ ] Signers receive email links
- [ ] Multi-party tracking
- [ ] Fully executed status detection
- [ ] Resend capability

---

#### Iteration 5.3: Document Context - Storage
**BDD Features:** `document-storage-retrieval.feature`

**Deliverables:**
- S3 storage integration
- Secure access controls
- Download capability
- Upload capability

**Acceptance Criteria:**
- [ ] Signed documents stored securely
- [ ] Documents downloadable by authorized users
- [ ] Supporting documents uploadable
- [ ] Access logging

---

#### Iteration 5.4: Fulfillment Context - Installation
**BDD Features:** `installation-authorization.feature`

**Deliverables:**
```
fulfillment-service/
├── src/
│   ├── domain/
│   │   ├── aggregates/
│   │   │   ├── Installation.ts
│   │   │   └── ContractorPayment.ts
│   │   ├── value-objects/
│   │   │   ├── Equipment.ts
│   │   │   └── FundingStatus.ts
│   │   └── services/
│   │       └── FundingWorkflow.ts
│   └── ...
```

**Acceptance Criteria:**
- [ ] Installation authorized when ready
- [ ] Completion recorded with details
- [ ] Equipment serial numbers captured

---

#### Iteration 5.5: Fulfillment Context - Funding
**BDD Features:** `funding-documentation.feature`, `contractor-payment.feature`, `partner-funding.feature`

**Deliverables:**
- Funding documentation workflow
- Document verification
- Contractor payment processing
- Partner funding requests

**Acceptance Criteria:**
- [ ] Funding paperwork submitted
- [ ] Additional docs requested if needed
- [ ] Documentation verified
- [ ] Contractor payments initiated
- [ ] Partner funding requested/received

---

### Phase 6: Billing & Servicing (Weeks 23-28)

#### Iteration 6.1: Billing Context - Account Setup
**BDD Features:** `billing-account-setup.feature`

**Deliverables:**
```
billing-service/
├── src/
│   ├── domain/
│   │   ├── aggregates/
│   │   │   ├── BillingAccount.ts
│   │   │   ├── Invoice.ts
│   │   │   └── Payment.ts
│   │   ├── value-objects/
│   │   │   ├── PaymentMethod.ts
│   │   │   ├── AutopayConfig.ts
│   │   │   ├── Balance.ts
│   │   │   └── DelinquencyStatus.ts
│   │   └── services/
│   │       ├── PaymentProcessor.ts
│   │       └── InvoiceGenerator.ts
│   └── ...
```

**Acceptance Criteria:**
- [ ] Billing account created from enrollment
- [ ] Payment methods added securely
- [ ] Autopay enabled/disabled
- [ ] Billing schedule established

---

#### Iteration 6.2: Billing Context - Invoicing & Payments
**BDD Features:** `billing-cycle-management.feature`, `payment-processing.feature`

**Deliverables:**
- Invoice generation
- Payment processing (Stripe)
- Receipt generation
- Refund processing
- Failure handling

**Acceptance Criteria:**
- [ ] Monthly invoices generated
- [ ] One-time payments processed
- [ ] Autopay payments processed
- [ ] Receipts generated
- [ ] Failures handled with retry
- [ ] Refunds processed

---

#### Iteration 6.3: Billing Context - Fees & Delinquency
**BDD Features:** `fees-delinquency.feature`, `payment-scheduling.feature`

**Deliverables:**
- Late fee assessment
- Dunning communications
- Days past due calculation
- Statement fees
- Payment scheduling

**Acceptance Criteria:**
- [ ] Late fees assessed correctly
- [ ] Dunning sequence triggered
- [ ] DPD calculated accurately
- [ ] Statement fees applied
- [ ] Scheduled payments supported

---

#### Iteration 6.4: Servicing Context - Maintenance
**BDD Features:** `maintenance-requests.feature`, `maintenance-reminders.feature`, `maintenance-funding.feature`

**Deliverables:**
```
servicing-service/
├── src/
│   ├── domain/
│   │   ├── aggregates/
│   │   │   ├── ServiceRequest.ts
│   │   │   ├── ServiceTask.ts
│   │   │   ├── BuyoutRequest.ts
│   │   │   └── AccountNote.ts
│   │   └── services/
│   │       └── AccountLifecycle.ts
│   └── ...
```

**Acceptance Criteria:**
- [ ] Service requests created
- [ ] Appointments scheduled
- [ ] Service completed and documented
- [ ] Maintenance reminders sent
- [ ] Maintenance invoices processed

---

#### Iteration 6.5: Servicing Context - Customer Service
**BDD Features:** `account-lookup.feature`, `task-management.feature`, `notes-comments.feature`, `support-requests.feature`

**Deliverables:**
- Account search capability
- Task management
- Notes/comments
- Support request tracking

**Acceptance Criteria:**
- [ ] Accounts searchable by various criteria
- [ ] Tasks created and assigned
- [ ] Notes added with audit trail
- [ ] Support requests tracked

---

#### Iteration 6.6: Servicing Context - Lifecycle
**BDD Features:** `buyout-process.feature`, `account-termination.feature`, `account-archiving.feature`

**Deliverables:**
- Buyout quote and processing
- Account termination workflow
- Account archival
- Historical retrieval

**Acceptance Criteria:**
- [ ] Buyout quotes generated
- [ ] Buyout payments processed
- [ ] Accounts terminated properly
- [ ] Accounts archived
- [ ] Archived data retrievable

---

### Phase 7: Supporting Contexts (Weeks 29-32)

#### Iteration 7.1: Communication Context
**BDD Features:** All `module-10-communications/` features

**Deliverables:**
```
communication-service/
├── src/
│   ├── domain/
│   │   ├── aggregates/
│   │   │   ├── Notification.ts
│   │   │   └── NotificationPreference.ts
│   │   └── services/
│   │       ├── EmailSender.ts
│   │       ├── SMSSender.ts
│   │       └── InAppNotifier.ts
│   └── ...
```

**Acceptance Criteria:**
- [ ] Email notifications sent
- [ ] SMS notifications sent
- [ ] In-app notifications displayed
- [ ] Real-time updates via WebSocket
- [ ] Preferences configurable

---

#### Iteration 7.2: Promotion Context
**BDD Features:** All `module-11-promotions/` features

**Deliverables:**
- Promotion CRUD
- Eligibility rules
- Application to accounts
- Validation

**Acceptance Criteria:**
- [ ] Promotions created with terms
- [ ] Eligibility rules enforced
- [ ] Promotions applied to applications
- [ ] Validation prevents invalid usage

---

### Phase 8: Partner Integration (Weeks 33-36)

#### Iteration 8.1: Partner Gateway - Momnt & Thrive
**BDD Features:** Partner-related scenarios from Module 3

**Deliverables:**
```
partner-gateway-service/
├── src/
│   ├── gateways/
│   │   ├── momnt/
│   │   │   ├── MomntClient.ts
│   │   │   ├── MomntTranslator.ts
│   │   │   └── MomntWebhooks.ts
│   │   ├── thrive/
│   │   │   ├── ThriveClient.ts
│   │   │   ├── ThriveTranslator.ts
│   │   │   └── ThriveWebhooks.ts
│   │   └── ...
│   └── ...
```

**Acceptance Criteria:**
- [ ] Momnt application submission
- [ ] Momnt decision receipt
- [ ] Momnt funding requests
- [ ] Thrive application flow
- [ ] Status synchronization

---

#### Iteration 8.2: Partner Gateway - Microf & Breeze
**BDD Features:** Partner-related scenarios from Module 3

**Deliverables:**
- Microf integration
- Breeze integration
- Income proof handling
- Checkout flows

**Acceptance Criteria:**
- [ ] Microf application submission
- [ ] Microf income proof upload
- [ ] Microf work order completion
- [ ] Breeze checkout session
- [ ] Breeze down payment
- [ ] Breeze contract signing
- [ ] Breeze funding request

---

## Summary

| Phase | Context(s) | Weeks | Stories Covered |
|-------|------------|-------|-----------------|
| 1 | Identity | 1-4 | 14 |
| 2 | Merchant | 5-8 | 33 |
| 3 | Origination | 9-14 | 57 |
| 4 | Underwriting, Pricing | 15-18 | 46 |
| 5 | Document, Fulfillment | 19-22 | 24 |
| 6 | Billing, Servicing | 23-28 | 57 |
| 7 | Communication, Promotion | 29-32 | 19 |
| 8 | Partner Gateway | 33-36 | ~25 |

**Total:** 36 weeks for complete platform implementation covering all 251 BDD scenarios.

---

## Definition of Done (Per Iteration)

- [ ] All BDD scenarios pass
- [ ] Unit test coverage > 80%
- [ ] Integration tests pass
- [ ] API documentation complete
- [ ] Domain events published correctly
- [ ] Event handlers working
- [ ] Performance acceptable
- [ ] Security review complete
- [ ] Independently deployable
- [ ] CI/CD pipeline green
