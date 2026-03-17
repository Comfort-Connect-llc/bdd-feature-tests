# Repair Financing — Screen-by-Screen Inventory

**Application:** Comfort Connect (Premier Program)
**Environment:** https://app.starfish-dev.com (Starfish Dev)
**Date Captured:** 2026-03-16
**User Context:** Dealer portal in "Mirror Mode" (USA Hometown Experts)
**Account Created:** #2336332

---

## Flow Overview

The "Repair Financing" flow spans **three user perspectives** — the Dealer Portal (app.starfish-dev.com), the Customer Guest Application (guest.starfish-dev.com), and the Lender Consumer Portal (app-stg.momnt.com). The dealer enters the repair amount, selects loan plans, and sends an invitation; the customer completes the application and selects an offer; then the customer is handed off to the lender (Momnt) to finalize the loan.

### Stepper Progression

**Dealer-side progress bar:** Submitted → Decision → Offer Selected → Account Setup → Hard Pull Authorization

**Customer-side stepper:** 1. Info → 2. Apply → 3. Offer → 4. Complete

### Key Differences from New System Financing

| Aspect | New System Financing | Repair Financing |
|--------|---------------------|-----------------|
| **Dealer entry URL** | `/generatequote` | `/sendInvite/repair-finance` |
| **Quote step** | Multi-step: select system type → enter price → add to cart → cart drawer | Single form: state dropdown + amount + customer info on one page |
| **System selection** | 4 system types (HVAC, Water Heater, Water Filter, Generator) in 2×2 grid | No system type selection |
| **State field** | Not required on dealer side | Required dropdown (determines available plans) |
| **Loan plans available** | 8 plans (4 Deferred Interest + 4 Fixed Rate) | 6 plans (2 Deferred Interest + 4 Fixed Rate) |
| **Financing amount tested** | $15,000 | $5,000 |
| **Offers returned** | 7 offers | 5 offers |
| **Conditional offers** | 3 conditional (Income + Financials verification) | 1 conditional (Income + Financials + Customer ID Review) |
| **Dealer progress steps** | 3→4 steps (Info Received → Submitted → Decision → Offer Selected) | 5 steps (Submitted → Decision → Offer Selected → Account Setup → Hard Pull Authorization) |
| **Post-offer flow** | Not reached (readonly mirror blocked offer selection) | Reached: Offer confirmed → Momnt consumer portal → OTP verification gate |
| **Lender handoff** | Not observed | Momnt staging portal (`app-stg.momnt.com/consumer/welcome/{id}`) |

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
- **Action taken:** Clicked **"Repair Financing"**

### Screen 2: Send Invite — Repair Finance (Combined Quote + Invite)
- **URL:** `/sendInvite/repair-finance`
- **Heading:** "Send Invite to Customer"
- **Key difference from New System:** No separate Add Quote / Cart Drawer step — everything is on one page.
- **Section 1 — State & Amount:**
  - State (dropdown) — required field; determines which loan plans are available
  - Repair Amount ($ input)
- **Section 2 — Installment Loan Options:** Table with columns:
  - SELECT ALL toggle
  - OFFER (name + badge: "Deferred Interest" or "Fixed Rate")
  - TERM (months)
  - PAYMENT FACTOR (%)
  - DEALER FEE (%)
  - MONTHLY PAYMENT ($)
- **Available Plans (6 total for GA / $5,000):**

  | Offer | Term | Payment Factor | Dealer Fee | Monthly Payment |
  |-------|------|---------------|------------|-----------------|
  | 6 Month No/No (Deferred Interest) | 90 Months | 2.03% | 4.25% | $101.50 |
  | 12 Month No/No (Deferred Interest) | 96 Months | 1.97% | 5.25% | $98.50 |
  | 10-Year 10.99% (Fixed Rate) | 120 Months | 1.38% | 1.00% | $69.00 |
  | 12-Year 11.99% (Fixed Rate) | 144 Months | 1.31% | 1.00% | $65.50 |
  | 15-Year 11.99% (Fixed Rate) | 180 Months | 1.20% | 5.00% | $60.00 |
  | 10-Year 8.99% (Fixed Rate) | 120 Months | 1.27% | 6.00% | $63.50 |

- **Footnote:** *Deferred interest plans convert to an 84-month fixed-rate loan at an APR as low as 17.99% if not fully repaid during the promotional period.*
- **Section 3 — Send Invitation:**
  - First Name (text input)
  - Mobile Phone or Email (text input)
- **Actions:**
  - Navy **"Proceed to Confirmation"** button (with send icon)
  - Helper text: "We'll send them a secure link."
- **Observations:** Compared to New System's 8 plans, Repair Financing offers only 6 plans — the two "No/Yes" deferred interest variants are absent.

### Screen 3: Review and Send Invite — Confirmation
- **URL:** `/sendInvite/repair-finance` (same page, content swap)
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

### Screen 4: Application Progress — Invitation Sent
- **URL:** `/pipeline/application-progress/{applicationId}`
- **Heading:** "Application Progress"
- **Subheading:** "Account Number: #2336332"
- **Progress Bar (initial state):** Submitted (green active) → Decision (gray) → Offer Selected (gray) → Account Setup (gray) → Hard Pull Authorization (gray)
- **Note:** The Repair Financing progress bar starts with **5 steps** from the beginning (vs. New System which starts with 3 and expands to 4). The two additional steps — "Account Setup" and "Hard Pull Authorization" — reflect the Momnt lender handoff process.
- **Status:** "Application Invitation Sent"
- **Body text:** "The applicant just needs to finish and submit. You'll be notified when it's done."
- **Link:** "Back to Pipeline"
- **Right panel — "What Your Customer Sees":** Phone mockup (view-only) showing the customer-facing application in real-time.

### Screen 4b: Application Progress — Offer Selected (Final Observed State)
- **URL:** `/pipeline/application-progress/{applicationId}` (same URL, auto-refreshed)
- **Progress Bar:** Submitted ✓ → Decision ✓ → Offer Selected (green active) → Account Setup (gray) → Hard Pull Authorization (gray)
- **Status:** "Loan - Offer Selected"
- **Body text:** "Your customer has selected a financing offer and they have to setup their account and sign loan documents at our partner's site."
- **Selected Offer Card:**
  - Badge: **"Fixed Rate"**
  - Approved: $5,000.00
  - APR: 9.99%
  - Total Term: 180 Months
  - Monthly Payment: $54.52
  - Description: "Fixed APR of 9.99% amortizing loan for 180 months. Up to 5 interest-only payments of $41.64 followed by 175 amortizing payments of $54.39"
- **Link:** "Back to Pipeline"
- **Right panel:** Phone mockup shows "Your loan offer is confirmed!" with ribbon icon and Continue button

---

## CUSTOMER GUEST APPLICATION SCREENS

### Screen C1: Primary Applicant Information (Step 1: Info)
- **URL:** `guest.starfish-dev.com/prequal/{invitationId}` → redirects to `guest.starfish-dev.com/prequal/mod/`
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
- **Note:** Identical to New System Financing — the customer application form is the same regardless of transaction type.

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
- **Offer Cards (5 total):** Each card contains:
  - Offer number, type badge (Fixed Rate / Deferred Interest), "Approved" status
  - Approved amount, APR, Total Term, Monthly Payment
  - Descriptive text about the plan terms
  - **"Select Offer"** button (green, **enabled** — unlike New System where buttons were disabled in mirror view)
  - Conditional offers show pending stipulations

  **Offers Returned:**

  | # | Type | APR | Term | Monthly Payment | Conditions |
  |---|------|-----|------|-----------------|------------|
  | 1 | Fixed Rate | 9.99% | 180 mo | $54.52 | None (fully approved) |
  | 2 | Fixed Rate | 11.99% | 144 mo | $67.02 | None (fully approved) |
  | 3 | 6mo Deferred Interest w/ Payments | 17.99% | 90 mo | $105.52 | None (fully approved) |
  | 4 | 12mo Deferred Interest w/ Payments | 17.99% | 96 mo | $105.52 | None (fully approved) |
  | 5 | Fixed Rate | 10.99% | 60 mo | $108.69 | Customer ID Review + Income + Financials verification, property ownership required, min $3,001 |

- **Expandable section:** "See Additional Offers" button → "Additional Offers (2)" with offers #4–5
- **Behavior:** First 3 offers shown by default, remaining 2 behind accordion

### Screen C4b: Confirm Your Selection (Modal)
- **URL:** `guest.starfish-dev.com/prequal/mod/offers` (modal overlay)
- **Heading:** "Confirm Your Selection"
- **Subheading:** "Installment Loan"
- **Content — Selected offer summary table:**
  - Term: 180 months
  - Monthly Payment: $54.52
  - APR: 9.99%
  - Requested Amount: $5,000.00
  - Approval Amount: $5,000.00
  - Interest Only Term: 5 months
  - Interest Only Payment: $41.64
  - Interest Only APR: 9.99%
- **Disclaimer:** "Your monthly payment may vary based on your loan disbursement and the terms of the selected offer."
- **Actions:**
  - Orange **"Cancel"** button
  - Green **"Confirm"** button

### Screen C4c: Loan Offer Confirmed (Modal)
- **URL:** `guest.starfish-dev.com/prequal/mod/offers` (modal overlay, post-confirmation)
- **Icon:** Gold ribbon/medal icon in circle
- **Heading:** "Your loan offer is confirmed!"
- **Body text:** "We're now taking you to our partner to set up your account and sign your loan documents."
- **Action:** Green **"Continue"** button
- **Behavior:** Continue button is wrapped in an `<a>` tag linking to `app-stg.momnt.com/consumer/welcome/{momntApplicationId}` — redirects customer to Momnt's consumer portal.

---

## LENDER CONSUMER PORTAL SCREENS (Momnt)

### Screen M1: Welcome — Momnt Consumer Portal
- **URL:** `app-stg.momnt.com/consumer/welcome/{momntApplicationId}`
- **Header:** "24 Hour" tab indicator (top-left)
- **Card:**
  - Dark navy header band: **"Welcome!"**
  - Momnt logo (momnt with red "o")
  - Body text: "You've been pre-qualified for a loan offer through Momnt. Now, we'll guide you through the next steps to confirm your details before finalizing your application."
  - Additional text: "Once you review and confirm your information, you'll have the opportunity to accept your loan terms."
- **Action:** Blue **"Continue"** button (full-width)
- **Footer:** "Powered by momnt" | PO Box 38619, Sandy Springs, GA 30328 | Support Hours: Monday-Friday 8:00 a.m. EST to 8:00 p.m. EST | support@momnt.com | (855) 943-3485

### Screen M2: Contact Information — OTP Verification
- **URL:** `app-stg.momnt.com/consumer/loan-apply`
- **Header:** "Contact Information" (light blue/teal banner)
- **Content:**
  - Mobile Phone: +1 (480) 793-1457
  - Email Address: jason.duval@comfortconnect.com
- **Verification prompt:** "To continue your application, we will send you a **six digit security code** on your mobile device. Click below to send the one time code."
- **Action:** Blue **"Continue"** button
- **Behavior:** This is an OTP/MFA gate — requires a real mobile device to receive the 6-digit SMS code. Flow cannot proceed further in automated testing.
- **Footer:** Same Momnt footer as M1

### Screen M3+: Beyond OTP (Not Reached)
- **Expected content based on Momnt consumer flow:**
  - Identity verification
  - Loan terms review and acceptance
  - E-signature / document signing
  - First payment setup
  - Loan completion confirmation
- **Note:** These screens were not reachable due to the SMS OTP verification requirement. The Momnt consumer portal requires the actual applicant's mobile device to receive a verification code.

---

## FLOW SUMMARY DIAGRAM

```
DEALER PORTAL                          CUSTOMER GUEST APP                    MOMNT CONSUMER PORTAL
═══════════════                        ═══════════════════                   ═════════════════════

1. Home
   └─ "Repair Financing"

2. Send Invite (Repair)
   └─ Select state (GA)
   └─ Enter repair amount ($5K)
   └─ Toggle loan options (6 plans)
   └─ Enter customer contact
   └─ "Proceed to Confirmation"

3. Review & Send
   └─ "Confirm and Send Invite"

4. Application Progress                ──→  C1. Primary Applicant Info (Step 1)
   └─ "Invitation Sent"                     └─ Personal, address, financial info
   └─ Live phone mockup                     └─ "Next"
   └─ 5-step progress bar
                                        C2. Review Application (Step 2)
                                             └─ Summary + T&C checkbox
                                             └─ "Submit Application"

                                        C3. Processing (Interstitial)
                                             └─ Loading animation (~15-20 sec)

                                        C4. Offers (Step 3)
                                             └─ 5 offer cards (3 shown + 2 accordion)
                                             └─ "Select Offer" → Confirm modal

                                        C4b. Confirm Selection (Modal)
                                             └─ Offer details summary
                                             └─ "Confirm"

                                        C4c. Offer Confirmed (Modal)
                                             └─ "Your loan offer is confirmed!"
                                             └─ "Continue" → Momnt handoff

4b. Application Progress (Updated)                                          M1. Welcome (Momnt)
   └─ "Offer Selected"                                                           └─ Pre-qualification message
   └─ Selected offer card shown                                                  └─ "Continue"
   └─ Phone mockup: "Offer confirmed"
                                                                             M2. Contact Info + OTP
                                                                                  └─ Phone + email displayed
                                                                                  └─ 6-digit SMS code required
                                                                                  └─ [BLOCKED — requires real device]

                                                                             M3+. [Not reached]
                                                                                  └─ Identity verification
                                                                                  └─ Loan terms acceptance
                                                                                  └─ E-signature
                                                                                  └─ First payment setup
```

---

## KEY OBSERVATIONS

1. **Simplified dealer entry:** Repair Financing skips the Add Quote / System Selection / Cart Drawer flow entirely. The dealer goes directly to a combined state + amount + invite page at `/sendInvite/repair-finance`, whereas New System uses `/generatequote` with a multi-step system selection and cart experience.

2. **State-dependent plans:** Repair Financing requires the dealer to select a state before loan plans populate. This suggests plan availability varies by state (tested with GA).

3. **Fewer loan plans:** Repair Financing offers 6 plans vs. 8 for New System. The two "No/Yes" deferred interest variants (6 Month No/Yes and 12 Month No/Yes) are absent, leaving only "No/No" variants.

4. **5-step dealer progress bar:** The Repair Financing dealer progress bar has 5 stages (Submitted → Decision → Offer Selected → Account Setup → Hard Pull Authorization) vs. New System's 3→4 stages. The additional "Account Setup" and "Hard Pull Authorization" steps correspond to the Momnt lender handoff process.

5. **Fewer but differently structured offers:** The customer received 5 offers (vs. 7 for New System at $15K). Offer #5 included a unique condition not seen in New System: "Customer Identification Review" — a manual review of application information. It also required property ownership.

6. **Offer selection succeeded:** Unlike the New System flow (where mirror-mode readonly JWT disabled offer buttons), the Repair flow was tested with session isolation — the customer accessed the invitation URL directly, enabling fully functional "Select Offer" buttons.

7. **Two-modal confirmation flow:** After clicking "Select Offer," the customer sees two sequential modals: (1) "Confirm Your Selection" with full offer terms, then (2) "Your loan offer is confirmed!" with a Continue button linking to Momnt.

8. **Lender handoff to Momnt:** After offer confirmation, the customer is redirected to Momnt's staging consumer portal (`app-stg.momnt.com`). This is the first time the flow exits the Comfort Connect domain — the customer transitions from `guest.starfish-dev.com` to `app-stg.momnt.com`.

9. **OTP verification gate:** The Momnt consumer portal requires SMS-based OTP verification (6-digit code sent to the applicant's mobile). This prevents automated testing beyond this point and confirms that Momnt uses its own identity verification layer independent of Comfort Connect's application.

10. **Interest-only period:** The selected offer (Fixed Rate 9.99%, 180 months) includes an interest-only introductory period: 5 months at $41.64/month, followed by 175 months of full amortizing payments at $54.39/month. This structure was visible in the Confirm Selection modal.

11. **Consistent customer application:** The customer-side application form (Steps 1-2) is identical between New System and Repair Financing — same fields, same layout, same orange section labels. The differentiation happens entirely on the dealer side and in the offer/terms returned.

12. **Real-time dealer sync:** The dealer's Application Progress page auto-updated to show "Loan - Offer Selected" with the specific offer details card after the customer confirmed their selection, confirming real-time status sync between the guest app and dealer portal.

---

## TEST DATA USED

| Field | Value |
|-------|-------|
| First Name | WNDQHE |
| Last Name | TVEQZVUV |
| Email | jason.duval@comfortconnect.com |
| Phone | 4807931457 |
| Date of Birth | 05/09/1995 |
| SSN | 666-00-7690 |
| Address | 359 FJBVUP BYP |
| City | ATLANTA |
| State | GA |
| Zip | 31139 |
| Income Source | Employment |
| Annual Income | $75,000 |
| Additional Household Income | $0 |
| Monthly Household Expense | $2,000 |
| Repair Amount | $5,000 |
