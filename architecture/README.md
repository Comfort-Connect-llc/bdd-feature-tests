# ComfortConnect Platform Architecture

**Clean-Slate DDD Implementation**  
**Source of Truth:** BDD Feature Tests (251 User Stories)

---

## Architecture Documents

| Document | Purpose |
|----------|---------|
| [DDD_CONTEXT_MAP.md](./DDD_CONTEXT_MAP.md) | Complete bounded context definitions, aggregates, domain events, and context relationships |
| [IMPLEMENTATION_ROADMAP.md](./IMPLEMENTATION_ROADMAP.md) | Phased implementation plan with vertical slices aligned to BDD features |

---

## Bounded Contexts Summary

| # | Context | Purpose | Stories |
|---|---------|---------|---------|
| 1 | **Identity** | Authentication, authorization, user profiles | 14 |
| 2 | **Merchant** | Dealer onboarding, partner enrollment, LMS | 33 |
| 3 | **Origination** | Applications, prequalification, offers, work orders | 57 |
| 4 | **Underwriting** | Credit evaluation, decisions, verifications | 24 |
| 5 | **Pricing** | Quotes, rate sheets, equipment catalog | 22 |
| 6 | **Document** | Generation, e-signatures, storage | 12 |
| 7 | **Fulfillment** | Installation, funding, contractor payments | 12 |
| 8 | **Billing** | Invoicing, payments, autopay, delinquency | 23 |
| 9 | **Servicing** | Maintenance, customer service, buyout, termination | 34 |
| 10 | **Communication** | Email, SMS, in-app notifications | 13 |
| 11 | **Promotion** | Promotional campaigns and eligibility | 6 |
| 12 | **Partner Gateway** | Anti-corruption layer for external partners | ~25 |

---

## Key Architectural Decisions

### 1. Independent Deployability
Each bounded context is a separately deployable service with:
- Own repository
- Own database (no shared schemas)
- Independent CI/CD pipeline
- Versioned API contracts

### 2. Event-Driven Communication
- Contexts communicate via domain events only
- Amazon EventBridge as event bus
- No synchronous cross-context calls for state changes
- Event schema registry for contract management

### 3. Anti-Corruption Layer for Partners
Partner integrations (Momnt, Thrive, Microf, Breeze) isolated in Partner Gateway context:
- Internal domain model protected from partner API changes
- Translation layers for each partner
- Centralized webhook handling

### 4. BDD-Aligned Vertical Slices
Implementation follows BDD features:
- Each iteration delivers complete functionality
- Acceptance tests from Gherkin scenarios
- No partial implementations

---

## Financing Products

| Product | Type | Provider | Flow |
|---------|------|----------|------|
| **Premier Program** | Lease | Comfort Connect | Full internal origination + servicing |
| **Momnt** | Consumer Loan | External | Partner Gateway integration |
| **Thrive** | Consumer Loan | External | Partner Gateway integration |
| **Microf** | Lease-to-Own | External | Partner Gateway integration |
| **Breeze/Okinus** | Lease-to-Own | External | Partner Gateway integration |

---

## Getting Started

1. Review [DDD_CONTEXT_MAP.md](./DDD_CONTEXT_MAP.md) for complete domain model
2. Review [IMPLEMENTATION_ROADMAP.md](./IMPLEMENTATION_ROADMAP.md) for implementation phases
3. Start with Identity Context (foundation layer)
4. Proceed through phases in order, delivering vertical slices

---

## Constraints (Non-Negotiable)

- ✅ All requirements derived from BDD features only
- ✅ No reference to legacy repositories
- ✅ Strict DDD principles enforced
- ✅ Each context independently deployable
- ✅ No shared databases between contexts
- ✅ Event-driven cross-context communication
- ✅ Clean-slate implementation (no legacy patterns)
