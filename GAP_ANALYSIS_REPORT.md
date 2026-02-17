# BDD Feature Test Gap Analysis Report

**Generated:** February 17, 2026  
**Audit Scope:** All 48 ComfortConnect repositories  
**BRD Version:** 2.0 (12 Modules, 221 User Stories)

---

## Executive Summary

This audit identified **significant gaps** between the existing BDD feature files and the business logic implemented across the ComfortConnect platform. The primary issues are:

1. **Missing business entity attributes** - Feature files lack complete data attributes for key entities
2. **Undocumented business workflows** - Several implemented features have no BDD coverage
3. **Incomplete business rules** - Edge cases and validation scenarios missing
4. **New functionality not in BRD** - Features added to codebase but not documented

---

## Gap Categories

### 1. Missing Business Entity Attributes

#### 1.1 Merchant/Company Entity (companyAPI)
**Current BRD Coverage:** Basic onboarding fields only

**Missing Attributes (discovered in codebase):**
| Attribute | Business Purpose |
|-----------|------------------|
| `warranty` | Warranty provider, amount, equipment eligibility rules |
| `contractorScoring` | AI-based merchant risk assessment scores |
| `contractorStateLicenseInfo` | State licensing and compliance data |
| `additionalLocations` | Multi-location dealer support |
| `operatingStates` | Geographic service area |
| `buyDown` | Custom buy-down pricing configurations |
| `uwritingConfigType` | Underwriting profile assignment |
| `priceType` | Flat vs low pricing mode |
| `accountManager` | Assigned account manager details |
| `systemTypes` | HVAC system types dealer services |
| `jbwOptIns` | Just Be Well program opt-ins |

#### 1.2 Billing Account Entity (billingAPInew)
**Current BRD Coverage:** Basic billing setup and payments

**Missing Attributes:**
| Attribute | Business Purpose |
|-----------|------------------|
| `autoPayConfig` | Detailed autopay settings (day, method, retry rules) |
| `customPaymentSchedule` | Non-standard payment schedules |
| `escalatorFactor` | Annual payment increase percentage |
| `pricingType` | Billing pricing model type |
| `optPaperStatement` | Paper statement preference |
| `optFeePause` | Fee pause enrollment |
| `chargeOffAmount` | Written-off balance amount |
| `previousStripeCustomerIds` | Payment method migration history |

#### 1.3 Financing Application Entity (accountAPI)
**Current BRD Coverage:** Basic application flow

**Missing Attributes:**
| Attribute | Business Purpose |
|-----------|------------------|
| `contractorOfferConfig` | Dealer-specific offer configurations |
| `autoAuthorizeInstallChecks` | Automatic installation authorization rules |
| `partnerDecision` | Partner-specific approval decisions array |
| `invoiceDetails` | Equipment invoice data |
| `property` | Property verification details |

#### 1.4 Rate Sheet Entity (partnerProAPI) - **COMPLETELY MISSING FROM BRD**
| Attribute | Business Purpose |
|-----------|------------------|
| `apr` | Annual percentage rate |
| `term` | Loan/lease term in months |
| `dealerFee` | Dealer fee percentage |
| `maxApprovalAmount` | Maximum approval limit |
| `tier` | Credit tier classification |
| `promoPeriod` | Promotional period months |
| `interestOnlyPeriod` | Interest-only period |
| `productType` | Product type code (TRD, Pmt, Def, Zil) |
| `eligibilityConfig` | Eligibility rules with resolver logic |
| `isPrime` | Prime rate indicator |
| `riskRangeLow/High` | Credit score risk range |

---

### 2. Missing Business Workflows

#### 2.1 Rate Sheet Management (Priority: HIGH)
**Source:** partnerProAPI
**Status:** No BRD coverage, no feature files

Required scenarios:
- Configure partner rate sheets with APR, terms, and fees
- Set eligibility criteria for rate availability
- Manage prime vs non-prime rate classifications
- Configure risk-based pricing tiers

#### 2.2 Company Group Management (Priority: MEDIUM)
**Source:** companyAPI
**Status:** Partial BRD coverage

Required scenarios:
- Create and manage company groups (dealer hierarchies)
- Assign companies to groups
- Configure group-level settings and permissions
- Group-level reporting and analytics

#### 2.3 Merchant Risk Assessment (Priority: MEDIUM)
**Source:** companyAPI (companyAssessment.service.js, openai.service.js)
**Status:** No BRD coverage

Required scenarios:
- AI-based merchant application evaluation
- Risk scoring and recommendation generation
- Automated web search for merchant validation
- Assessment review and override

#### 2.4 Warranty Management (Priority: MEDIUM)
**Source:** companyAPI (warranty field)
**Status:** No BRD coverage

Required scenarios:
- Configure warranty eligibility rules per dealer
- Define warranty amounts by equipment type
- Warranty claim processing integration

#### 2.5 Buy-Down Pricing (Priority: MEDIUM)
**Source:** companyAPI, pricingAPI
**Status:** Partial BRD coverage

Required scenarios:
- Configure buy-down pricing options
- Enable/disable buy-down for specific dealers
- Calculate buy-down impact on payments

---

### 3. Missing Feature Files

| Module | Missing Feature File | BRD Section | Priority |
|--------|---------------------|-------------|----------|
| Module 5 | `warranty-management.feature` | New | HIGH |
| Module 5 | `rate-sheet-management.feature` | New | HIGH |
| Module 2 | `company-groups.feature` | New | MEDIUM |
| Module 2 | `merchant-assessment.feature` | New | MEDIUM |
| Module 12 | `rate-configuration.feature` | New | HIGH |
| Module 9 | `gamification-rewards.feature` | US-9.4.1 expansion | LOW |

---

### 4. Incomplete Scenarios in Existing Feature Files

#### 4.1 module-02-dealer-management/merchant-application.feature
**Missing:**
- Scenario with complete merchant data attributes (all required fields)
- Multi-location dealer registration
- State licensing verification
- Warranty configuration during onboarding

#### 4.2 module-03-prequalification-origination/application-creation.feature
**Missing:**
- Scenario showing complete homeowner data attributes
- Co-applicant with full attribute set
- Partner-specific application variations with attributes

#### 4.3 module-08-billing-payments/billing-account-setup.feature
**Missing:**
- Custom payment schedule configuration
- Escalator factor setup
- Paper statement election
- Fee pause enrollment

#### 4.4 module-05-pricing-equipment/pricing-configuration.feature
**Missing:**
- Rate sheet configuration by partner
- Eligibility rules configuration
- Risk-based pricing setup
- Buy-down pricing configuration

---

### 5. Business Rules Not Documented

| Rule Category | Missing Documentation |
|--------------|----------------------|
| **Eligibility** | Rate sheet eligibility resolver logic |
| **Credit** | Risk range thresholds by tier |
| **Pricing** | Prime vs non-prime rate selection |
| **Warranty** | Equipment eligibility criteria |
| **Compliance** | State licensing requirements by operating state |
| **Limits** | Maximum approval amounts by credit tier |

---

## Recommended Actions

### Phase 1: Critical Additions (HIGH Priority)
1. Create `rate-sheet-management.feature` for Module 12
2. Create `warranty-management.feature` for Module 5
3. Update merchant application scenarios with complete attributes
4. Add rate configuration scenarios

### Phase 2: Complete Attribute Coverage (MEDIUM Priority)
1. Enhance all entity-creation scenarios with complete data attributes
2. Add company group management feature
3. Add merchant assessment feature
4. Update billing scenarios with all configuration options

### Phase 3: Edge Cases and Rules (LOWER Priority)
1. Add eligibility rule scenarios
2. Document risk-based pricing rules
3. Add compliance and licensing scenarios

---

## Updated Module Statistics

| Module | Current Stories | Gaps Found | New Stories Needed |
|--------|----------------|------------|-------------------|
| 1. Identity & Access | 9 | 0 | 0 |
| 2. Dealer Management | 23 | 4 | 8 |
| 3. Prequal & Origination | 52 | 2 | 3 |
| 4. Underwriting | 20 | 1 | 2 |
| 5. Pricing & Equipment | 12 | 3 | 6 |
| 6. Document Management | 12 | 0 | 0 |
| 7. Installation & Funding | 12 | 0 | 0 |
| 8. Billing & Payments | 20 | 2 | 4 |
| 9. Account Servicing | 28 | 1 | 2 |
| 10. Communications | 13 | 0 | 0 |
| 11. Promotions | 6 | 0 | 0 |
| 12. Administration | 14 | 3 | 5 |
| **TOTAL** | **221** | **16** | **30** |

---

## Next Steps

1. ✅ Gap Analysis Complete
2. 🔄 Create new feature files for missing workflows
3. 🔄 Enhance existing feature files with complete attributes
4. 🔄 Update BRD modules with new user stories
5. 📋 Update TRACEABILITY_MAP.json
