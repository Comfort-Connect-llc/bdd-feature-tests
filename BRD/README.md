# Comfort Connect POS Platform
# Business Requirements Document (BRD)

**Version:** 2.0  
**Date:** February 12, 2026  
**Structure:** Functional Modules

---

## Overview

Comfort Connect is a B2B2C consumer finance company providing a point-of-sale (POS) financing platform for home comfort contractors. The platform enables dealers/contractors to offer multiple financing options to homeowners purchasing home comfort systems.

**Key Differentiator:** The **Premier Program** is Comfort Connect's proprietary all-inclusive home comfort solution—a single monthly payment (typically ~8 years) that includes the system, parts, service, and maintenance.

---

## Financing Products

| Product | Type | Provider |
|---------|------|----------|
| **Premier Program** | Lease | Comfort Connect (In-house) |
| **Momnt** | Consumer Loan | External Partner |
| **Thrive** | Consumer Loan | External Partner |
| **Microf** | Lease-to-Own | External Partner |
| **Breeze** | Lease-to-Own | External Partner (Okinus) |

---

## Module Structure

All BRD user stories are organized into **12 functional modules** located in the `modules/` directory:

| Module | File | Stories | Description |
|--------|------|---------|-------------|
| **1. Identity & Access** | [Module_01_Identity_Access.md](modules/Module_01_Identity_Access.md) | 9 | Authentication, roles, permissions, profiles |
| **2. Dealer Management** | [Module_02_Dealer_Management.md](modules/Module_02_Dealer_Management.md) | 23 | Dealer onboarding, partner enrollment, training |
| **3. Prequalification & Origination** | [Module_03_Prequalification_Origination.md](modules/Module_03_Prequalification_Origination.md) | 52 | Full application lifecycle for all products |
| **4. Underwriting & Verification** | [Module_04_Underwriting_Verification.md](modules/Module_04_Underwriting_Verification.md) | 20 | Credit decisions, income/property verification |
| **5. Pricing & Equipment** | [Module_05_Pricing_Equipment.md](modules/Module_05_Pricing_Equipment.md) | 12 | Quotes, pricing models, equipment catalog |
| **6. Document Management** | [Module_06_Document_Management.md](modules/Module_06_Document_Management.md) | 12 | Document generation, e-signatures, storage |
| **7. Installation & Funding** | [Module_07_Installation_Funding.md](modules/Module_07_Installation_Funding.md) | 12 | Installation authorization, contractor payments |
| **8. Billing & Payments** | [Module_08_Billing_Payments.md](modules/Module_08_Billing_Payments.md) | 20 | Invoicing, payments, fees, delinquency |
| **9. Account Servicing** | [Module_09_Account_Servicing.md](modules/Module_09_Account_Servicing.md) | 28 | Maintenance, customer service, lifecycle |
| **10. Communications** | [Module_10_Communications.md](modules/Module_10_Communications.md) | 13 | Email, SMS, in-app, real-time notifications |
| **11. Promotions** | [Module_11_Promotions.md](modules/Module_11_Promotions.md) | 6 | Promotion management and application |
| **12. Administration** | [Module_12_Administration.md](modules/Module_12_Administration.md) | 14 | Configuration, feature flags, reporting |

**Total: 221 User Stories**

---

## User Personas

| Persona | Description |
|---------|-------------|
| **Dealer/Contractor** | Home comfort contractor who uses the platform to offer financing to homeowners |
| **Homeowner (Primary Applicant)** | Consumer seeking financing for a home comfort system |
| **Co-Applicant** | Secondary applicant on a financing application |
| **Customer Service Representative** | Internal staff servicing accounts |
| **Underwriter** | Internal staff reviewing manual underwriting cases |
| **Administrator** | Internal staff managing platform configuration |

---

## Module Dependencies

```
┌─────────────────────────────────────────────────────────────────────────┐
│                      Module 1: Identity & Access                         │
│                          (Foundation Layer)                              │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
        ┌───────────────────────────┼───────────────────────────┐
        │                           │                           │
        ▼                           ▼                           ▼
┌───────────────┐         ┌─────────────────────┐      ┌───────────────┐
│ Module 2:     │         │ Module 3:           │      │ Module 12:    │
│ Dealer Mgmt   │────────▶│ Prequal/Origination │      │ Administration│
└───────────────┘         └─────────────────────┘      └───────────────┘
                                    │
        ┌───────────────────────────┼───────────────────────────┐
        │                           │                           │
        ▼                           ▼                           ▼
┌───────────────┐         ┌─────────────────────┐      ┌───────────────┐
│ Module 4:     │         │ Module 5:           │      │ Module 6:     │
│ Underwriting  │         │ Pricing/Equipment   │      │ Documents     │
└───────────────┘         └─────────────────────┘      └───────────────┘
                                    │
                                    ▼
                          ┌─────────────────────┐
                          │ Module 7:           │
                          │ Install & Funding   │
                          └─────────────────────┘
                                    │
        ┌───────────────────────────┼───────────────────────────┐
        │                           │                           │
        ▼                           ▼                           ▼
┌───────────────┐         ┌─────────────────────┐      ┌───────────────┐
│ Module 8:     │         │ Module 9:           │      │ Module 11:    │
│ Billing       │         │ Account Servicing   │      │ Promotions    │
└───────────────┘         └─────────────────────┘      └───────────────┘
                                    │
                                    ▼
                          ┌─────────────────────┐
                          │ Module 10:          │
                          │ Communications      │
                          │ (Cross-Cutting)     │
                          └─────────────────────┘
```

---

## User Story Format

All user stories follow this format:

```
**US-[Section].[Number]: [Title]**
> As a **[Role]**, I want [capability], so that [business value].

**Acceptance Criteria:**
- Given [precondition]
- When [action]
- Then [expected outcome]

🎨 **Design:** [Screen Name](figma-url-with-node-id)
```

---

## 🎨 Figma Design Linking

Each user story with a UI component includes a **design link** to the relevant Figma frame. This eliminates the need to go to Figma separately.

**Convention:**
- **Module-level:** YAML front matter at top of module file with overview frames
- **Story-level:** Inline `🎨 **Design:**` annotation after acceptance criteria
- **Index:** `designs/figma-index.json` for programmatic access

**See:** [FIGMA_DESIGN_LINKING.md](../FIGMA_DESIGN_LINKING.md) for full documentation.

**Quick Start for POs:**
1. In Figma, select the frame for the screen
2. Right-click → "Copy link to selection"
3. Paste into the markdown: `🎨 **Design:** [Screen Name](paste-url-here)`

---

## Notes for Test Framework Development

- All acceptance criteria are written in Given/When/Then format for BDD compatibility
- User stories are atomic and testable
- Stories avoid implementation details (no APIs, tables, services mentioned)
- Each story describes observable business behavior
- Stories can be mapped to automated test scenarios
