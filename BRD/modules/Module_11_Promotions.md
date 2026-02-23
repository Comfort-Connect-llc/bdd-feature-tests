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
**Stories:** 9

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
- Referral program management

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

---

## 11.3 Referral Program

**US-11.3.1: Refer a Friend**
> As a **Homeowner**, I want to refer a friend to Comfort Connect, so that they can explore financing options and I can receive any applicable referral benefits.

**Acceptance Criteria:**
- Given I have an active account
- When I submit a referral with the friend's name and email or phone number
- Then the friend receives an invitation to explore financing options
- And the referral is tracked and associated with my account
- And any referral incentives are applied when the referred friend completes enrollment

---

**US-11.3.2: Configure Referral Program**
> As an **Administrator**, I want to configure referral program rules and incentives, so that the referral program operates according to business goals.

**Acceptance Criteria:**
- Given referral program parameters need to be defined
- When I configure the referral rules (incentive type, amount, eligibility criteria)
- Then the rules are applied to new referrals
- And existing referrals continue under their original terms

---

**US-11.3.3: Refer a Contractor**
> As a **Dealer**, I want to refer another contractor to join the Comfort Connect platform, so that they can offer financing to their customers and I can receive any applicable referral benefits.

**Acceptance Criteria:**
- Given I am an active, enrolled dealer on the platform
- When I submit a contractor referral with the contractor's business name, contact name, and email or phone number
- Then the referred contractor receives an invitation to begin the merchant application process
- And the referral is tracked and associated with my dealer account
- And any referral incentives are applied when the referred contractor completes onboarding and is approved
