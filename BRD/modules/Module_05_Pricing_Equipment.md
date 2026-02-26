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
**Stories:** 14

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

**US-5.1.4: Generate Multi-Lease Quote**
> As a **Dealer**, I want to generate a quote for a multi-lease project type (e.g., Geothermal with Equipment + Ground Loop), so that the customer can see itemized monthly payments for each lease component and the combined total.

**Acceptance Criteria:**
- Given I am generating a quote for a project type with multiple lease components
- When I enter the project details and equipment information for each component
- Then the system calculates a separate monthly payment for each lease component (e.g., Equipment lease and Ground Loop lease)
- And I see an itemized breakdown of each component's payment amount, term, and total cost
- And I see a combined total monthly payment across all lease components
- And each component can have a different term length and pricing model as configured by the project type
- And the quote clearly labels each component for the customer

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

**US-5.2.3: Assign Rate Plans to Trades**
> As a **Sales or Service Manager**, I want to configure which rate plans are available for specific trades (HVAC, water heater, tankless water heater, water filtration, standby generator, etc.), so that dealers see only the appropriate pricing options for the type of equipment they are quoting.

**Acceptance Criteria:**
- Given rate plans and equipment trades exist on the platform
- When I assign one or more rate plans to a specific trade
- Then only the assigned rate plans are available when a dealer generates a quote for that trade
- And I can assign different rate plans to different trades independently
- And changes take effect for new quotes without affecting existing committed quotes
- And I can view a summary of which rate plans are currently assigned to each trade
- And rate plan-to-trade assignments can be overridden at the company or company group level if needed

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
