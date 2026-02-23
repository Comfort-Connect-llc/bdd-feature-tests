---
figma:
  file: "https://www.figma.com/file/FIGMA_FILE_ID/Comfort-Connect-Platform"
  page: "Module 11 - Promotions"
  frames:
    - id: "overview"
      name: "Module 11 - Promotions Overview"
      url: "TODO"
---

# Module 11: Promotions
## Promotion Management and Application

**Version:** 1.0  
**Date:** February 12, 2026  
**Stories:** 6

---

## Overview

Manages promotional offers and incentives for financing products. Supports creation, configuration, and application of promotions with eligibility rules.

**Key Capabilities:**
- Promotion creation and configuration
- Dealer-specific promotion assignment
- Date range and eligibility rules
- Promotion code application
- Promotion validation
- Promotion reporting

---

## 11.1 Promotion Management

**US-11.1.1: Create Promotion**
> As an **Administrator**, I want to create promotional offers, so that dealers can offer special terms to homeowners.

**Acceptance Criteria:**
- Given promotion parameters (discount, special terms, dates)
- When I create the promotion
- Then the promotion is active and available for use
- And has defined start and end dates

---

**US-11.1.2: Configure Promotion Eligibility**
> As an **Administrator**, I want to configure promotion eligibility rules, so that promotions are applied correctly.

**Acceptance Criteria:**
- Given a promotion
- When I configure eligibility (company, region, product, amount range)
- Then only eligible applications can use the promotion

---

**US-11.1.3: Apply Promotion to Account**
> As a **Dealer**, I want to apply a promotion to a customer's account, so that they receive special terms.

**Acceptance Criteria:**
- Given a valid promotion exists
- When I apply it to an eligible application
- Then the promotional terms are applied
- And reflected in the quote and agreement

---

**US-11.1.4: Validate Promotion**
> As a **System**, I want to validate promotions before applying, so that only valid promotions are used.

**Acceptance Criteria:**
- Given a promotion code or selection
- When validation is performed
- Then the system confirms the promotion is active and the account is eligible
- Or returns an error explaining why it cannot be applied

---

**US-11.1.5: View Active Promotions**
> As a **Dealer**, I want to view active promotions, so that I know what offers are available for customers.

**Acceptance Criteria:**
- Given promotions are configured
- When I view available promotions
- Then I see all promotions I can offer
- And their terms and expiration dates

---

## 11.2 Company-Specific Promotions

**US-11.2.1: Assign Promotion to Company**
> As an **Administrator**, I want to assign promotions to specific companies, so that custom offers can be provided.

**Acceptance Criteria:**
- Given a promotion
- When I assign it to specific companies
- Then only those companies can use the promotion
