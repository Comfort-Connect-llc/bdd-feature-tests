---
figma:
  file: "https://www.figma.com/file/FIGMA_FILE_ID/Comfort-Connect-Platform"
  page: "Module 05 - Pricing & Equipment"
  frames:
    - id: "quote-calculator-overview"
      name: "Quote Calculator Overview"
      url: "TODO"
    - id: "pricing-config-admin"
      name: "Pricing Configuration Admin"
      url: "TODO"
    - id: "equipment-search-flow"
      name: "Equipment Search Flow"
      url: "TODO"
---

# Module 5: Pricing & Equipment
## Quote Generation and Equipment Management

**Version:** 1.0  
**Date:** February 12, 2026  
**Stories:** 12

---

## Overview

Manages payment quote generation, pricing models, tax calculation, and equipment catalog management. Provides accurate pricing for all financing products and supports equipment identification for work orders.

**Key Capabilities:**
- Payment quote generation
- Bundle pricing
- Pricing model configuration
- Tax rate lookup by location
- Equipment model lookup (AHRI)
- Equipment catalog management
- Invoice verification for funding

---

## 5.1 Quote Generation

**US-5.1.1: Generate Payment Quote**
> As a **Dealer**, I want to generate a payment quote for a customer, so that they can see estimated monthly payments.

**Acceptance Criteria:**
- Given project amount and customer information
- When I generate a quote
- Then monthly payment amounts are calculated for available financing options
- And the quote displays term length, payment amount, and total cost

🎨 **Design:** [Quote Calculator Screen](TODO)

---

**US-5.1.2: Calculate Premier Program Payments**
> As a **System**, I want to calculate Premier Program monthly payments, so that accurate pricing is displayed.

**Acceptance Criteria:**
- Given project amount, term, and tax rate
- When payments are calculated
- Then the monthly payment includes equipment cost, service costs, and taxes
- And the calculation uses the correct pricing model

---

**US-5.1.3: Generate Quote with Bundles**
> As a **Dealer**, I want to create a quote with bundled equipment packages, so that customers see comprehensive pricing.

**Acceptance Criteria:**
- Given a predefined equipment bundle
- When I generate a quote with the bundle
- Then all bundle components are included
- And the total price reflects any bundle discounts

🎨 **Design:** [Bundle Selection UI](TODO)

---

## 5.2 Pricing Configuration

**US-5.2.1: Configure Pricing Models**
> As an **Administrator**, I want to configure pricing models, so that quotes reflect current pricing strategies.

**Acceptance Criteria:**
- Given pricing parameters need to be updated
- When I configure pricing models
- Then new quotes use the updated pricing
- And existing committed quotes are not affected

🎨 **Design:** [Pricing Configuration Panel](TODO)

---

**US-5.2.2: View Pricing Metrics**
> As an **Administrator**, I want to view pricing metrics and analytics, so that I can understand pricing performance.

**Acceptance Criteria:**
- Given pricing has been in use
- When I view pricing metrics
- Then I see analytics on average deal size, common terms, and utilization

🎨 **Design:** [Pricing Metrics Dashboard](TODO)

---

## 5.3 Tax Management

**US-5.3.1: Retrieve Tax Rate by Location**
> As a **System**, I want to retrieve the applicable tax rate for an installation location, so that quotes and billing are accurate.

**Acceptance Criteria:**
- Given an installation address
- When the tax rate is requested
- Then the correct state/local tax rate is returned

---

**US-5.3.2: Handle Missing Tax Rate**
> As a **System**, I want to alert when a tax rate cannot be found, so that the issue can be resolved.

**Acceptance Criteria:**
- Given an installation address
- When no tax rate is found for the location
- Then the application status indicates "Missing Tax Rate"
- And the dealer is prompted to verify the address

---

## 5.4 Equipment Identification

**US-5.4.1: Look Up Equipment by Model**
> As a **Dealer**, I want to look up equipment by model number, so that I can find the correct specifications.

**Acceptance Criteria:**
- Given a model number
- When I search for equipment
- Then matching equipment details are returned
- And specifications are displayed

🎨 **Design:** [Equipment Search Screen](TODO)

---

**US-5.4.2: Identify Equipment via AI**
> As a **Dealer**, I want to identify equipment from an invoice or image, so that I can quickly capture equipment details.

**Acceptance Criteria:**
- Given an equipment invoice or image
- When AI analysis is performed
- Then equipment make, model, and specifications are extracted
- And can be added to the work order

🎨 **Design:** [AI Equipment Scanner](TODO)

---

**US-5.4.3: Capture Equipment Serial Number**
> As a **Dealer**, I want to capture the equipment serial number during installation, so that the installed equipment is tracked.

**Acceptance Criteria:**
- Given equipment is being installed
- When I enter the serial number
- Then the serial is associated with the account
- And is available for warranty and service purposes

---

## 5.5 Equipment Catalog

**US-5.5.1: Manage Equipment Catalog**
> As an **Administrator**, I want to manage the equipment catalog, so that dealers have accurate equipment information.

**Acceptance Criteria:**
- Given equipment data
- When I add or update the catalog
- Then the equipment is available for lookup
- And specifications are accurate

🎨 **Design:** [Equipment Catalog Admin](TODO)

---

## 5.6 Invoice Verification

**US-5.6.1: Verify Equipment Invoice**
> As an **Administrator**, I want to verify equipment invoices, so that funding is based on actual equipment installed.

**Acceptance Criteria:**
- Given an equipment invoice has been submitted
- When I verify the invoice
- Then I confirm the equipment matches the work order
- And the invoice is approved for funding

🎨 **Design:** [Invoice Verification Panel](TODO)
