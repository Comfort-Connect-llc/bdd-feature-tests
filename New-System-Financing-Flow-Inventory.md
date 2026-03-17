# New System Financing — Screen-by-Screen Inventory

**Application:** Comfort Connect (Premier Program)
**Environment:** https://app.starfish-dev.com (Starfish Dev)
**Date Captured:** 2026-03-16
**User Context:** Dealer portal in "Mirror Mode" (USA Hometown Experts)
**Account Created:** #2336327

---

## Flow Overview

The "New System Financing" flow spans **two user perspectives** — the Dealer Portal (app.starfish-dev.com) and the Customer Guest Application (guest.starfish-dev.com). The dealer initiates the quote and sends an invitation; the customer completes the application and selects an offer.

### Stepper Progression

**Dealer-side progress bar:** Info Received → Submitted → Decision → Offer Selected

**Customer-side stepper:** 1. Info → 2. Apply → 3. Offer → 4. Complete

---

## DEALER PORTAL SCREENS

### Screen 1: Home — Transaction Type Selection
- **URL:** `/home`
- **Heading:** "What Transaction Can We Help You With?"
- **Elements:**
  - Green CTA button: **"New System Financing"**
  - White outline button: **"Repair Financing"**
- **Layout:** Centered card on light gray background, dark navy sidebar (icon-only) on left, navy top bar with user dropdown (Jason Duval), MIRROR MODE banner
- **Chat widget:** "Hi, I'm Theo!" (bottom-right)

### Screen 2: Add Quote — System & Price Entry
- **URL:** `/generatequote`
- **Heading:** "Add Quote"
- **Step 1 — Select Your System:** Four selectable cards in a 2×2 grid:
  - HVAC (with icon)
  - Water Heater (with icon)
  - Water Filter/Softener (with icon)
  - Generator (with icon)
- **Step 2 — Enter System Details:**
  - Total Retail Price ($ input)
  - System Label (Optional) — placeholder: "Example: Upstairs Unit"
- **Actions:**
  - Orange **"+ Add to Cart"** button
- **Footer:** Cart icon with "System(s)" label at bottom
- **Behavior:** Selecting a system type highlights the card in dark navy. After entering price and clicking Add to Cart, a cart drawer slides up.

### Screen 2b: Cart Drawer (Overlay on Add Quote)
- **URL:** `/generatequote` (same page, modal overlay)
- **Heading:** "Systems Selected For Installation"
- **Content:** Line items showing system type + price (e.g., "HVAC — $15,000.00") with delete/edit icons
- **Actions:**
  - Orange **"Add Add'l System"** button
  - Green **"Send Invite"** button

### Screen 3: Send Invite to Customer — Loan Options & Contact
- **URL:** `/sendInvite`
- **Heading:** "Send Invite to Customer"
- **Subheading:** "Total Retail Price: $15,000.00" (with edit icon)
- **Section 1 — Installment Loan Options:** Table with columns:
  - SELECT ALL toggle
  - OFFER (name + badge: "Deferred Interest" or "Fixed Rate")
  - TERM (months)
  - PAYMENT FACTOR (%)
  - DEALER FEE (%)
  - MONTHLY PAYMENT ($)
- **Available Plans (8 total):**

  | Offer | Term | Payment Factor | Dealer Fee | Monthly Payment |
  |-------|------|---------------|------------|-----------------|
  | 6 Month No/No (Deferred Interest) | 90 Months | 2.03% | 4.25% | $304.50 |
  | 6 Month No/Yes (Deferred Interest) | 90 Months | 2.03% | 4.00% | $304.50 |
  | 12 Month No/No (Deferred Interest) | 96 Months | 1.97% | 5.25% | $295.50 |
  | 12 Month No/Yes (Deferred Interest) | 96 Months | 1.97% | 5.00% | $295.50 |
  | 10-Year 10.99% (Fixed Rate) | 120 Months | 1.38% | 1.00% | $207.00 |
  | 12-Year 11.99% (Fixed Rate) | 144 Months | 1.31% | 1.00% | $196.50 |
  | 15-Year 11.99% (Fixed Rate) | 180 Months | 1.20% | 5.00% | $180.00 |
  | 10-Year 8.99% (Fixed Rate) | 120 Months | 1.27% | 6.00% | $190.50 |

- **Footnote:** *Deferred interest plans convert to an 84-month fixed-rate loan at an APR as low as 17.99% if not fully repaid during the promotional period.*
- **Section 2 — Send Invitation:**
  - First Name (text input)
  - Mobile Phone or Email (text input)
- **Actions:**
  - Navy **"Proceed to Confirmation"** button (with send icon)
  - Helper text: "We'll send them a secure link."

### Screen 4: Review and Send Invite — Confirmation
- **URL:** `/sendInvite` (same page, content swap)
- **Heading:** "Review and Send Invite"
- **Subtext:** "Make sure everything looks right before sending."
- **Section 1 — Customer Contact Details** (with Edit link):
  - FIRST NAME | CONTACT columns
- **Section 2 — Selected Installment Loan Rate Plans** (with Edit link):
  - All toggled-on plans shown with green checkmarks
  - Same columns: OFFER, TERM, PAYMENT FACTOR, DEALER FEE, MONTHLY PAYMENT
- **Actions:**
  - White **"Back"** button
  - Navy **"Confirm and Send Invite"** button (with send icon)

### Screen 5: Application Progress — Invitation Sent
- **URL:** `/pipeline/application-progress/{applicationId}`
- **Heading:** "Application Progress"
- **Subheading:** "Account Number: #2336327"
- **Progress Bar (3-step):** Info Received (green active) → Submitted (gray) → Decision (gray)
- **Status:** "Application Invitation Sent"
- **Metadata:** Last Updated timestamp, "This page updates automatically."
- **Body text:** "The applicant just needs to finish and submit. You'll be notified when it's done."
- **Link:** "Back to Pipeline"
- **Right panel — "What Your Customer Sees":** Phone mockup (view-only) showing the customer-facing application in real-time. Initially loads with Comfort Connect logo, then renders the customer's current step.

### Screen 5b: Application Progress — Loan Approved (Updated)
- **URL:** `/pipeline/application-progress/{applicationId}` (same URL, auto-refreshed)
- **Progress Bar (expanded to 4-step):** Info Received ✓ → Submitted ✓ → Decision (green active) → Offer Selected (gray)
- **Status:** "Loan Approved"
- **Body text:** "Your customer has been approved. They can now select a loan offer to move forward."
- **Link:** "Need to enable more plans? View approved plans →"
- **Link:** "Back to Pipeline"
- **Right panel:** Phone mockup now shows the Offers screen with offer cards

---

## CUSTOMER GUEST APPLICATION SCREENS

### Screen C1: Primary Applicant Information (Step 1: Info)
- **URL:** `guest.starfish-dev.com/prequal/mod/`
- **Header:** "Comfort Connect Application" with Comfort Connect logo
- **Stepper:** 1 Info (green active) → 2 Apply → 3 Offer → 4 Complete
- **Heading:** "Primary Applicant Information"
- **Left column — Personal Info:**
  - **Applicant Name** (orange label): First Name, Last Name
  - **Contact Info** (orange label): Mobile Number, Email Address
  - **Date of Birth** (orange label): MM/DD/YYYY
  - **Social Security Number** (orange label): XXX-XX-XXXX (masked input)
  - **Address** (orange label): Street Address, Street Address 2, City, State (dropdown), Zip Code
  - Checkbox: "Is this where the system will be installed?" (Yes/No)
  - Checkbox: "Is this a mobile home?" (Yes/No)
- **Right column — Financial Info:**
  - **Income Source** (orange label): Dropdown (Employment, Disability Pay, Self Employed, Social Security, Retirement, Pension, Military E3/E4, Other)
  - **Individual Pre-Tax Annual Income** (orange label): $ input
  - **Additional Annual Household Income** (orange label): $ input
  - Note about alimony/child support disclosure
  - **Household Expense (Monthly)** (orange label): $ input
  - Help text about what to include
- **Actions:**
  - Outline **"Add Co-Applicant"** button (with person+ icon)
  - Green **"Next"** button (with arrow icon)

### Screen C2: Review Your Application (Step 2: Apply)
- **URL:** `guest.starfish-dev.com/prequal/mod/` (same base, different step)
- **Stepper:** 1 Info ✓ → 2 Apply (green active) → 3 Offer → 4 Complete
- **Heading:** "Review Your Application"
- **Content — Read-only summary of all entered data:**
  - Installation Address
  - Primary Applicant Information: Name, Phone Number, Email Address, Date of Birth, Address, Mobile Home status
  - Applicant Income (Annual)
  - Additional Household Income (Annual)
  - Household Expense (Monthly)
  - Income Source
  - SSN (masked: ***-**-7690)
- **Terms & Conditions:**
  - Checkbox: "By checking this box, I acknowledge that I have read, understood, and agree to all terms and conditions..."
  - Link: "Complete Terms and Conditions Document" (navigates to `/consent`)
- **Action:** Navy **"Submit Application"** button

### Screen C3: Processing Your Application (Interstitial)
- **URL:** `guest.starfish-dev.com/decision`
- **Stepper:** Steps 1-2 complete, between Apply and Offer
- **Content:** Comfort Connect logo with loading animation
- **Text:** "Processing Your Application"
- **Behavior:** Auto-advances to Offers screen after underwriting decision (~15-20 seconds)

### Screen C4: Congratulations — Select an Offer (Step 3: Offer)
- **URL:** `guest.starfish-dev.com/prequal/mod/offers`
- **Stepper:** 1 Info ✓ → 2 Apply ✓ → 3 Offer (green active) → 4 Complete
- **Heading:** "Congratulations! You're Approved. Please Select an Offer."
- **Offer Cards (7 total):** Each card contains:
  - Offer number, type badge (Fixed Rate / Deferred Interest), "Approved" status
  - Approved amount, APR, Total Term, Monthly Payment
  - Descriptive text about the plan terms
  - **"Select Offer"** button (green)
  - Conditional offers show pending stipulations:
    - "Applicant Income Verification — Submit two most recent Paystubs."
    - "Borrower Financials Verification — Submit previous two months of bank statements."
    - Minimum loan amount notices

  **Offers Returned:**

  | # | Type | APR | Term | Monthly Payment | Conditions |
  |---|------|-----|------|-----------------|------------|
  | 1 | Fixed Rate | 9.99% | 180 mo | $163.52 | None (fully approved) |
  | 2 | Fixed Rate | 8.99% | 120 mo | $189.93 | Income + Financials verification, min $3,001 |
  | 3 | Fixed Rate | 11.99% | 144 mo | $196.92 | Income + Financials verification, min $3,001 |
  | 4 | Fixed Rate | 11.99% | 144 mo | $201.02 | None (fully approved) |
  | 5 | Fixed Rate | 10.99% | 120 mo | $206.54 | Income + Financials verification, min $3,001 |
  | 6 | 6mo Deferred Interest w/ Payments | 17.99% | 90 mo | $316.52 | None (fully approved) |
  | 7 | 12mo Deferred Interest w/ Payments | 17.99% | 96 mo | $316.52 | None (fully approved) |

- **Expandable section:** "See Additional Offers" button → "Additional Offers (4)" with offers #4–7
- **Behavior:** First 3 offers shown by default, remaining 4 behind accordion

### Screen C5: Step 4 — Complete (Not Reached)
- **Stepper position:** 4. Complete
- **Expected content:** Offer confirmation, document signing (e-signature), first payment setup, completion confirmation
- **Note:** This step was not reachable in the mirror/read-only view. The customer must access the actual invitation link sent via email to select an offer and complete the process.

---

## FLOW SUMMARY DIAGRAM

```
DEALER PORTAL                          CUSTOMER GUEST APP
═══════════════                        ═══════════════════

1. Home
   └─ "New System Financing"

2. Add Quote
   └─ Select system + price
   └─ Add to Cart

2b. Cart Drawer
   └─ "Send Invite"

3. Send Invite
   └─ Toggle loan options
   └─ Enter customer contact
   └─ "Proceed to Confirmation"

4. Review & Send
   └─ "Confirm and Send Invite"

5. Application Progress                ──→  C1. Primary Applicant Info (Step 1)
   └─ "Invitation Sent"                     └─ Personal, address, financial info
   └─ Live phone mockup                     └─ "Next"

                                        C2. Review Application (Step 2)
                                             └─ Summary + T&C checkbox
                                             └─ "Submit Application"

                                        C3. Processing (Interstitial)
                                             └─ Loading animation

5b. Application Progress (Updated)     C4. Offers (Step 3)
   └─ "Loan Approved"                       └─ 7 offer cards
   └─ Live phone mockup                     └─ "Select Offer"

                                        C5. Complete (Step 4)
                                             └─ [Not reached — requires real invite link]
```

---

## KEY OBSERVATIONS

1. **Dual-view architecture:** The dealer sees a real-time phone mockup ("What Your Customer Sees") that mirrors the customer's actual application state via an embedded iframe from `guest.starfish-dev.com`.

2. **Progress bar expansion:** The dealer-side progress bar dynamically expands from 3 steps to 4 steps as the application advances (adding "Offer Selected" after approval).

3. **Loan option pre-selection:** The dealer controls which installment plans are available to the customer via toggles on the Send Invite screen. All 8 plans were enabled by default.

4. **Conditional vs. unconditional offers:** Some offers (e.g., #1, #4, #6, #7) are fully approved, while others (#2, #3, #5) are conditionally approved requiring income/financial verification documents.

5. **Offer grouping:** The first 3 offers are shown prominently; 4 additional offers are hidden behind a "See Additional Offers" accordion.

6. **Orange section labels:** The customer application uses orange (#e87722) uppercase labels for form sections (Applicant Name, Contact Info, Date of Birth, etc.) — consistent with the Portal 2.0 design system.

7. **Mobile-first guest app:** The customer application renders at 430px viewport width, indicating a mobile-first responsive design.

8. **Auto-updating dealer view:** The Application Progress page states "This page updates automatically" — real-time status sync without manual refresh.

9. **Mirror mode:** The dealer is operating in "MIRROR MODE" for USA Hometown Experts, indicating white-label/multi-tenant dealer access.

10. **Masked SSN handling:** The SSN field uses an input mask (xxx-xx-xxxx) and shows masked in the review step (***-**-7690).
