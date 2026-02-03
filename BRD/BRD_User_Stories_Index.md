# Comfort Connect POS Origination Platform
# Business Requirements Document (BRD) - Index

**Version:** 1.0  
**Date:** February 3, 2026  
**Document Type:** Business Requirements Document expressed as User Stories

---

## Document Structure

This BRD is organized into 5 parts for manageability:

| File | Domains Covered |
|------|-----------------|
| **BRD_User_Stories_Part1.md** | Domains 1-3: Dealer Onboarding, User Management, Prequalification |
| **BRD_User_Stories_Part2.md** | Domains 4-6: Application Origination (Premier, Loans, LTO) |
| **BRD_User_Stories_Part3.md** | Domains 7-10: Pricing, Credit/Underwriting, Verification, Documents |
| **BRD_User_Stories_Part4.md** | Domains 11-14: Billing, Maintenance, Equipment, Installation/Funding |
| **BRD_User_Stories_Part5.md** | Domains 15-21: Notifications, Customer Service, Promotions, LMS, Lifecycle, Config, Reporting |

---

## Executive Summary

Comfort Connect is a B2B2C consumer finance company providing a point-of-sale (POS) financing platform for home comfort contractors. The platform enables dealers/contractors to offer multiple financing options to homeowners purchasing home comfort systems.

### Key Differentiator
The **Premier Program** is Comfort Connect's proprietary all-inclusive home comfort solution—a single monthly payment (typically ~8 years) that includes the system, parts, service, and maintenance.

### Financing Products

| Product | Type | Provider |
|---------|------|----------|
| **Premier Program** | Lease | Comfort Connect (In-house) |
| **Momnt** | Consumer Loan | External Partner |
| **Thrive** | Consumer Loan | External Partner |
| **Microf** | Lease-to-Own | External Partner |
| **Breeze** | Lease-to-Own | External Partner (Okinus) |

---

## Domain Summary

### Part 1: Foundation
1. **Dealer/Contractor Onboarding** (16 user stories) - Enrolling contractors onto the platform
2. **User & Profile Management** (9 user stories) - Users, roles, permissions, profiles
3. **Homeowner Prequalification** (7 user stories) - Initial eligibility checks

### Part 2: Application Origination
4. **Premier Program Origination** (22 user stories) - Full Premier application lifecycle
5. **Loan Partner Origination** (9 user stories) - Momnt and Thrive flows
6. **LTO Partner Origination** (14 user stories) - Microf and Breeze flows

### Part 3: Evaluation & Documents
7. **Pricing & Quotes** (7 user stories) - Quote generation and tax management
8. **Credit & Underwriting** (12 user stories) - Credit bureau, automated/manual underwriting
9. **Income & Property Verification** (8 user stories) - Verification requirements
10. **Document Management & E-Signatures** (12 user stories) - Document generation, signing, storage

### Part 4: Operations
11. **Billing & Payments** (20 user stories) - Billing cycles, payments, fees, delinquency
12. **Maintenance & Servicing** (8 user stories) - Service requests, reminders, funding
13. **Equipment Management** (5 user stories) - Equipment lookup, catalog, verification
14. **Installation & Funding** (12 user stories) - Authorization, documentation, contractor payment

### Part 5: Support & Administration
15. **Notifications & Communications** (13 user stories) - Email, SMS, in-app, real-time
16. **Customer Service & Support** (10 user stories) - Account lookup, tasks, notes
17. **Promotions & Incentives** (6 user stories) - Promotion management and application
18. **Learning Management** (7 user stories) - Courses, enrollment, compliance
19. **Account Lifecycle Management** (10 user stories) - Status, buyout, termination, archive
20. **Configuration & Administration** (6 user stories) - Partner, underwriting, system config
21. **Reporting & Analytics** (8 user stories) - Operational reports, data export

---

## Total User Stories: 211

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

## User Story Format

All user stories follow this format:

```
**US-[Domain].[Section].[Number]: [Title]**
> As a **[Role]**, I want [capability], so that [business value].

**Acceptance Criteria:**
- Given [precondition]
- When [action]
- Then [expected outcome]
```

---

## Assumptions

1. **Premier** is the core in-house differentiator product (not a legacy offering)
2. **Momnt** and **Thrive** are loan partners (consumer loans)
3. **Microf** and **Breeze** are LTO (lease-to-own) partners
4. The platform supports multiple concurrent financing options per application
5. "Modular" pipeline refers to the architecture supporting multiple partner flows
6. The platform handles both origination and ongoing servicing of Premier accounts

---

## Notes for Test Framework Development

- All acceptance criteria are written in Given/When/Then format for BDD compatibility
- User stories are atomic and testable
- Stories avoid implementation details (no APIs, tables, services mentioned)
- Each story describes observable business behavior
- Stories can be mapped to automated test scenarios
