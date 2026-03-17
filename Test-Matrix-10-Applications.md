# Test Application Matrix — 10 Scenarios for UX Copy Audit

**Platform:** Comfort Connect (Premier Program)
**Environment:** https://app.starfish-dev.com (Starfish Dev)
**Date Created:** 2026-03-16
**Purpose:** Systematic UX copy audit across varied financing scenarios — testing copy consistency, dynamic copy changes, edge cases, and building a comprehensive copy inventory.

---

## Fixed Applicant Data (Constant Across All 10 Tests)

| Field | Value |
|-------|-------|
| First Name | WNDQHE |
| Last Name | TVEQZVUV |
| Email | jason.duval@comfortconnect.com |
| Phone | 4807931457 |
| Date of Birth | 05/09/1995 |
| SSN | 666-00-7690 |
| Street Address | 359 FJBVUP BYP |
| City | ATLANTA |
| State | GA |
| Zip | 31139 |
| Mobile Home | No |
| System Install at Address | Yes |

---

## Variable Parameters Per Test

### Test #1 — Baseline Repair (Low Amount, Moderate Income)
| Parameter | Value |
|-----------|-------|
| **Flow Type** | Repair Financing |
| **Financing Amount** | $2,500 |
| **Income Source** | Employment |
| **Annual Income** | $45,000 |
| **Additional Household Income** | $0 |
| **Monthly Household Expense** | $1,200 |
| **Plans to Enable** | All 6 available |
| **Offer to Select** | Lowest monthly payment available |
| **Rationale** | Tests minimum viable repair amount. At $2,500, some offers may not appear (Thrive min $3,001). Tests copy for "minimum loan amount" warnings and whether conditional offer language changes at low amounts. |

---

### Test #2 — Baseline New System (Standard Amount, Standard Income)
| Parameter | Value |
|-----------|-------|
| **Flow Type** | New System Financing |
| **System Type** | HVAC |
| **Financing Amount** | $12,000 |
| **Income Source** | Employment |
| **Annual Income** | $65,000 |
| **Additional Household Income** | $10,000 |
| **Monthly Household Expense** | $1,800 |
| **Plans to Enable** | All 8 available |
| **Offer to Select** | First Fixed Rate offer (lowest APR) |
| **Rationale** | Standard mid-range scenario for New System. Establishes the "normal" UX copy baseline for comparison against edge cases. Tests whether additional household income changes any copy. |

---

### Test #3 — High Amount Repair (Stress Test)
| Parameter | Value |
|-----------|-------|
| **Flow Type** | Repair Financing |
| **Financing Amount** | $25,000 |
| **Income Source** | Self Employed |
| **Annual Income** | $120,000 |
| **Additional Household Income** | $0 |
| **Monthly Household Expense** | $3,500 |
| **Plans to Enable** | All 6 available |
| **Offer to Select** | Deferred Interest (6mo) |
| **Rationale** | High repair amount — tests whether Repair flow has an upper bound or if copy/plans change at larger amounts. Also tests "Self Employed" income source to see if different verification copy appears. Selecting deferred interest tests whether confirmation modal copy differs from fixed rate. |

---

### Test #4 — Low Income Edge Case (Potential Denial)
| Parameter | Value |
|-----------|-------|
| **Flow Type** | New System Financing |
| **System Type** | Water Heater |
| **Financing Amount** | $8,000 |
| **Income Source** | Social Security |
| **Annual Income** | $18,000 |
| **Additional Household Income** | $0 |
| **Monthly Household Expense** | $900 |
| **Plans to Enable** | All 8 available |
| **Offer to Select** | N/A — may be denied or partially approved |
| **Rationale** | Very low income with Social Security source — designed to potentially trigger a denial or fewer offers. Critical test for denial/partial approval copy: what heading, body text, and CTAs appear? Does the stepper show a different state? Tests whether income source label changes any messaging. |

---

### Test #5 — Maximum Amount New System (Large Project)
| Parameter | Value |
|-----------|-------|
| **Flow Type** | New System Financing |
| **System Type** | Generator |
| **Financing Amount** | $50,000 |
| **Income Source** | Employment |
| **Annual Income** | $150,000 |
| **Additional Household Income** | $25,000 |
| **Monthly Household Expense** | $4,000 |
| **Plans to Enable** | Fixed Rate only (deselect Deferred Interest) |
| **Offer to Select** | Longest term available (15-Year) |
| **Rationale** | Largest amount to test. Uses Generator (less common system type) to check if system type appears in any copy downstream. High income ensures approval. Only enabling Fixed Rate plans tests whether customer sees "Additional Offers" section or accordion when fewer offers returned. Selecting the longest term tests if confirmation modal copy varies by term length. |

---

### Test #6 — Selective Plans Repair (Minimal Offers)
| Parameter | Value |
|-----------|-------|
| **Flow Type** | Repair Financing |
| **Financing Amount** | $7,500 |
| **Income Source** | Retirement |
| **Annual Income** | $55,000 |
| **Additional Household Income** | $12,000 |
| **Monthly Household Expense** | $1,500 |
| **Plans to Enable** | Only 1 plan (15-Year 11.99% Fixed Rate) |
| **Offer to Select** | The only offer available |
| **Rationale** | Tests what the Offers screen looks like with minimal offers. Does "Congratulations" heading still appear? Does the "See Additional Offers" accordion show/hide? Does any copy change when there's only 1 offer (e.g., "Please Select an Offer" vs "Your Offer")? Tests Retirement income source. |

---

### Test #7 — Two Plans Only New System
| Parameter | Value |
|-----------|-------|
| **Flow Type** | New System Financing |
| **System Type** | Water Filter/Softener |
| **Financing Amount** | $6,000 |
| **Income Source** | Disability Pay |
| **Annual Income** | $32,000 |
| **Additional Household Income** | $0 |
| **Monthly Household Expense** | $1,100 |
| **Plans to Enable** | 2 plans (6 Month No/No Deferred + 10-Year 10.99% Fixed) |
| **Offer to Select** | Deferred Interest offer |
| **Rationale** | Tests with exactly 2 plans enabled — does the "See Additional Offers" accordion still appear? With lower income and Disability Pay, tests whether different conditions/stipulations appear. Using Water Filter/Softener as system type. |

---

### Test #8 — High Expense Ratio (Potential Stress)
| Parameter | Value |
|-----------|-------|
| **Flow Type** | Repair Financing |
| **Financing Amount** | $15,000 |
| **Income Source** | Employment |
| **Annual Income** | $48,000 |
| **Additional Household Income** | $0 |
| **Monthly Household Expense** | $3,200 |
| **Plans to Enable** | All 6 available |
| **Offer to Select** | Highest APR offer available |
| **Rationale** | High debt-to-income ratio (expense/income ~80%). May trigger fewer offers, conditional approvals, or different approval copy. Tests whether expense ratio affects messaging, stipulation text, or offer count. Selecting the highest APR tests if any "cost warning" copy exists. |

---

### Test #9 — Ultra-Low Ticket Repair (Minimum Amount Edge Case)
| Parameter | Value |
|-----------|-------|
| **Flow Type** | Repair Financing |
| **Financing Amount** | $750 |
| **Income Source** | Military E3/E4 |
| **Annual Income** | $38,000 |
| **Additional Household Income** | $0 |
| **Monthly Household Expense** | $1,400 |
| **Plans to Enable** | All 6 available |
| **Offer to Select** | Whatever is available (if any) |
| **Rationale** | Ultra-low repair ticket — $750 is well below Thrive's $3,001 minimum and may be below other lender minimums. Tests whether the platform even allows submission at this amount, or if validation/error copy appears on the dealer side. If it does go through, tests what offers come back (if any), whether denial copy is triggered, and whether "minimum loan amount" warnings appear on all or most offers. Also keeps Military E3/E4 income source to test for SCRA disclosures. This is the most aggressive edge case in the matrix. |

---

### Test #10 — Pension + Multi-System New System
| Parameter | Value |
|-----------|-------|
| **Flow Type** | New System Financing |
| **System Type** | HVAC + Water Heater (multi-system cart) |
| **Financing Amount** | $10,000 (HVAC) + $5,000 (Water Heater) = $15,000 total |
| **Income Source** | Pension |
| **Annual Income** | $62,000 |
| **Additional Household Income** | $0 |
| **Monthly Household Expense** | $1,600 |
| **Plans to Enable** | Deferred Interest only (deselect Fixed Rate) |
| **Offer to Select** | 12-Month Deferred Interest |
| **Rationale** | Tests multi-system cart to check if cart drawer copy changes with 2 items. Same total ($15K) as Test #2's original flow but split across 2 systems — does any downstream copy reference individual systems or just the total? Only enabling Deferred Interest plans tests the customer offer screen with only deferred offers (different badge types). Tests Pension income source. |

---

## Test Matrix Summary

| Test | Flow | Amount | Income | Income Source | Expense | Plans Enabled | Offer Target | Edge Case Tested |
|------|------|--------|--------|---------------|---------|---------------|-------------|-----------------|
| #1 | Repair | $2,500 | $45K | Employment | $1,200 | All 6 | Lowest payment | Min amount, Thrive $3K min |
| #2 | New System | $12,000 | $65K | Employment | $1,800 | All 8 | Lowest APR Fixed | Baseline standard |
| #3 | Repair | $25,000 | $120K | Self Employed | $3,500 | All 6 | Deferred 6mo | High repair amount, self-employed |
| #4 | New System | $8,000 | $18K | Social Security | $900 | All 8 | (may be denied) | Low income denial/partial |
| #5 | New System | $50,000 | $150K | Employment | $4,000 | Fixed only | Longest term | Max amount, selective plans |
| #6 | Repair | $7,500 | $55K | Retirement | $1,500 | Only 1 plan | Only option | Single offer screen |
| #7 | New System | $6,000 | $32K | Disability Pay | $1,100 | 2 plans | Deferred | Minimal plans, lower income |
| #8 | Repair | $15,000 | $48K | Employment | $3,200 | All 6 | Highest APR | High DTI ratio stress |
| #9 | Repair | $750 | $38K | Military E3/E4 | $1,400 | All 6 | Whatever available | Ultra-low amount, SCRA copy |
| #10 | New System | $15,000 | $62K | Pension | $1,600 | Deferred only | 12mo Deferred | Multi-system cart, deferred only |

**Split:** 4 New System + 6 Repair
**Income sources covered:** Employment (3), Self Employed (1), Social Security (1), Retirement (1), Disability Pay (1), Military E3/E4 (1), Pension (1) — 7 of 8 available sources
**Amount range:** $750 → $50,000
**Income range:** $18,000 → $150,000

---

## UX Copy Audit Framework

For each test run, the following copy elements will be captured and compared:

### Dealer Portal Copy Points (per screen)

| # | Screen | Copy Elements to Capture |
|---|--------|------------------------|
| D1 | Home | Button labels, heading text |
| D2 | Quote/Invite | Section headers, plan table headers, footnote text, helper text, button labels, error messages (if any) |
| D3 | Review & Confirm | Section headers, summary labels, button labels, subtext |
| D4 | Application Progress | Progress step labels, status heading, body text, metadata text, link text, selected offer card labels |
| D5 | Progress Updates | Status heading changes, body text changes, new link text that appears |

### Customer App Copy Points (per screen)

| # | Screen | Copy Elements to Capture |
|---|--------|------------------------|
| C1 | Applicant Info | Section labels (orange), field labels, field placeholders, helper text, checkbox labels, button labels |
| C2 | Review | Section headers, field labels (read-only), T&C checkbox text, T&C link text, button label |
| C3 | Processing | Loading text, any animated text |
| C4 | Offers | Page heading, offer card labels (Approved/APR/Term/Payment), badge text, plan description text, stipulation text, accordion button text, offer count text |
| C5 | Confirm Modal | Modal heading, subheading, table row labels, disclaimer text, button labels |
| C6 | Confirmed Modal | Icon, heading, body text, button label |
| C7 | Denial/Partial | (If applicable) Heading, body text, CTA, next steps, support contact info |

### Lender Portal Copy Points

| # | Screen | Copy Elements to Capture |
|---|--------|------------------------|
| M1 | Welcome | Header, body paragraphs, button label, footer text |
| M2 | Contact/OTP | Section header, field labels, verification prompt text, button label |

### Cross-Test Comparison Categories

For the final audit report, copy will be compared across these dimensions:

1. **Static copy** — Text that never changes regardless of scenario (headings, labels, footers)
2. **Amount-dynamic copy** — Text that changes based on financing amount (monthly payments, plan descriptions, offer cards)
3. **Approval-dynamic copy** — Text that changes based on approval outcome (approved vs. conditional vs. denied headings, stipulation text)
4. **Offer-count-dynamic copy** — Text that changes based on how many offers are returned (accordion visibility, count labels)
5. **Flow-type copy** — Differences between New System vs. Repair flows (dealer screens, progress steps)
6. **Income-source copy** — Any copy that changes based on income source selection
7. **Lender-specific copy** — Copy from the Momnt portal vs. Comfort Connect copy
8. **Error/validation copy** — Any error messages, warnings, or validation text encountered
9. **Terminology consistency** — Same concepts referred to with different words (e.g., "financing" vs. "loan" vs. "offer")
10. **Tone consistency** — Shifts in voice across the flow (formal ↔ casual, celebratory ↔ neutral)

---

## Execution Instructions

### Pre-Test Setup
1. Log into dealer portal at `app.starfish-dev.com` as Jason Duval
2. Confirm Mirror Mode is active for USA Hometown Experts
3. For customer-side steps, open the invitation URL in a **separate browser session** (incognito or different browser) to avoid the readonly JWT issue

### Per-Test Workflow
1. **Dealer:** Navigate to `/home` → Select flow type → Enter amount/system → Configure plans → Send invite
2. **Customer:** Open invitation link → Fill applicant info (using fixed data + test-specific income fields) → Submit → Review offers
3. **Capture:** Screenshot + full page text at every screen transition
4. **Log:** Record all copy in the audit spreadsheet row for this test
5. **Select offer:** Choose the specified offer → Capture confirmation modals → Proceed to Momnt portal if applicable
6. **Dealer check:** Return to dealer tab → Capture updated Application Progress state

### SSN Entry Note
The SSN field (`666-00-7690`) requires **manual keyboard entry** — the masked input component does not accept programmatic value setting. The user will need to type this on each of the 10 customer-side runs.

---

## Expected UX Copy Variations to Watch For

Based on our two prior test runs, here are specific hypotheses about copy that may change:

| Hypothesis | Test(s) That Will Verify |
|-----------|--------------------------|
| "Congratulations! You're Approved" heading changes to denial text at low income | #4 |
| Stipulation copy varies by offer type and amount | #1, #3, #4, #8 |
| "See Additional Offers" accordion disappears when ≤3 offers | #1, #6, #7 |
| Confirmation modal "Installment Loan" subheading changes for Deferred Interest | #3, #7, #10 |
| "Your loan offer is confirmed!" text is static regardless of offer type | #3, #5, #7 |
| Momnt welcome copy is identical across all loan amounts | #1 vs #3 vs #5 |
| Military income source triggers SCRA disclosure copy | #9 |
| Platform rejects or warns on ultra-low amounts ($750) | #9 |
| Dealer-side validation copy appears for below-minimum amounts | #9 |
| Multi-system cart copy differs from single-system | #10 vs #2 |
| "Minimum loan amount" warning appears/disappears based on amount | #1 ($2,500) vs #3 ($25,000) |
| Dealer progress bar step count differs between New System and Repair | All (5 for Repair, 3→4 for New System) |
| Plan description text dynamically recalculates based on financing amount | All (payment amounts should scale) |
| "Application Invitation Sent" status text is identical across both flows | All |
| T&C copy on customer review screen is static across all scenarios | All |
| Error validation messages appear for boundary amounts | #1, #5 |

---

*This matrix is ready for review before execution. Each test should take approximately 10-15 minutes to run (including manual SSN entry), for a total estimated execution time of 100-150 minutes.*
