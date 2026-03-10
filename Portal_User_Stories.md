# Integrated Portal — User Stories to Address Gaps & Issues

**Date:** March 10, 2026
**Audience:** Product Leadership
**Source:** 64 issues identified across Integrated Portal Support chat (Aug 2025 – Feb 2026)

User stories are grouped into **10 product initiatives**, ranked by a composite score of **prevalence** (how often it occurred), **persistence** (one-time vs. chronic), and **business impact** (deal risk, support burden, scale blocker). Every story includes source chat references and fix status.

Priority indicators use MoSCoW: **Must Have (P0)**, **Should Have (P1)**, **Could Have (P2)**.

### Fix Status Legend

Throughout this document, each initiative and individual issue is tagged with a fix status:

- 🟢 **FIXED** — A fix was deployed and confirmed working in the chat
- 🟡 **IN PROGRESS** — A fix was acknowledged and committed to but not yet confirmed deployed
- 🔴 **OPEN** — No fix identified or committed to in the chat

---

## Priority Ranking Summary

Initiatives are now ordered by composite impact score (prevalence × persistence × business impact), not by theme.

| Rank | Initiative | Incidents | Recurrence | Urgency | Fix Status |
|---|---|---|---|---|---|
| 1 | **Status Sync with Lenders** | 6 | Chronic | High | 🔴 Mostly open |
| 2 | **Charge Request & Payment** | 5+ | Chronic | High | 🔴 Open |
| 3 | **Notifications Infrastructure** | 6 | Chronic | Medium-High | 🟡 Partial |
| 4 | **Customer-Facing Errors** | 6 | Sporadic | High | 🟡 Partial |
| 5 | **Offer Clarity & Display** | 5 | Recurring | High | 🟡 In progress |
| 6 | **App Lifecycle (Withdraw)** | 5 | Recurring | Medium | 🟡 In progress |
| 7 | **Form Validation** | 6 | One-time each | Medium | 🔴 Open |
| 8 | **Onboarding Automation** | 7 | Sporadic | Medium | 🔴 Mostly open |
| 9 | **Admin Portal Enhancements** | 5 | Chronic | Low | 🟡 Partial |
| 10 | **Partner Integration** | 13 | Mixed | High (Momnt) | 🟡 Partial |

---

## Initiative 1 (Rank #1): Real-Time Status Sync with Lending Partners

**Prevalence:** 6 incidents across 4 months (Aug–Nov) | **Persistence:** Chronic — affects all lender integrations | **Urgency:** High — directly causes deal confusion and delays funding

**Problem:** Portal status frequently lags behind or contradicts the lender's system (Thrive, Momnt, Breeze, Microf). Apps show as "funded" when the lender says otherwise. Approvals done directly with Breeze don't sync back. Status changes at Microf (like a conditional approval moving to declined) happen silently. The current workaround — a manual "Refresh Status" button — puts the burden on users who don't know they need to refresh.

**Business Impact:** Status mismatches create confusion for CAs and homeowners, generate unnecessary support calls, and can delay funding. This is the most *systemic* issue — it touches every lender and every app type.

**Resolves Issues:** Internal #13, #30, #31; Partner #1, #7, #9, #10, #13

**Fix Status:**
- 🔴 Webhook integration with Microf — **OPEN** (raised 8/4, no fix committed)
- 🔴 Auto-sync with Thrive/Breeze — **OPEN** (manual "Mirror Company" still required)
- 🟢 Breeze/Myers approval manually synced — **ONE-OFF FIX** (11/26, Sriram manually updated offers in ~1 hour)

| # | User Story | Priority | Category |
|---|---|---|---|
| 1.1 | As an **Account Manager**, I want application status to automatically sync with lender portals (Thrive, Momnt, Breeze, Microf) within 5 minutes of any status change so that I always see the current state without manually refreshing. | P0 | Internal |
| 1.2 | As an **Account Manager**, I want to receive an email or in-portal notification whenever an application's status changes at any lender (especially declines, conditional approval changes, and funding updates) so that I don't have to discover changes manually. | P0 | Internal |
| 1.3 | As a **Comfort Advisor**, I want to see a "last synced" timestamp on each application so that I know whether the status I'm looking at is current. | P1 | Internal |
| 1.4 | As a **portal admin**, I want a dashboard showing applications where the portal status and lender status are out of sync so that the support team can proactively resolve mismatches before they impact customers. | P2 | Internal |
| 1.5 | As the **engineering team**, I want webhook integrations with all lending partners to receive real-time event updates so that the portal reflects status changes without polling or manual intervention. | P0 | Partner / Internal |

**Source Chat References:**
- 8/4/25, Jason Duval / Sanjay Venkatesh, App #2219548 Watts — "are we getting webhooks from Microf for event updates like this? I don't see any email updates"
- 11/26/25, Sriram Venkatesan / Cody Compton, App #2239521 James Myers — Breeze approval "not in sync with our flow"; manually updated ~1 hr later
- App #2290255 — manual "Refresh Status" / "Mirror Company" required
- App #2261859 Apex — portal showed funded, Breeze said not paid
- App #2280121 — moved "Approved For Less" to "Declined" silently

---

## Initiative 2 (Rank #2): Charge Request & Payment Flow Improvements

**Prevalence:** 5+ incidents across Nov–Dec | **Persistence:** Chronic — same root causes recur | **Urgency:** High — directly blocks funding and risks losing deals

**Problem:** Momnt charge request texts aren't being received by customers, requests expire after 48 hours with no reminder, and the system blocks new requests while a stalled one is pending. Contractors have no way to verify delivery or override a stuck request. Wrong-amount contracts can be sent with no confirmation step.

**Business Impact:** Each missed or expired charge request delays funding and risks the customer walking away from the deal.

**Resolves Issues:** Partner #4, #5; Internal #17; User Error #8

**Fix Status:**
- 🔴 SMS delivery verification — **OPEN** (no fix committed)
- 🔴 48-hour expiry auto-reminder — **OPEN** (Momnt-side limitation, no workaround committed)
- 🔴 Override stalled pending charge request — **OPEN** (no fix committed)
- 🔴 Contract amount confirmation step — **OPEN** (no fix committed)

| # | User Story | Priority | Category |
|---|---|---|---|
| 2.1 | As a **Comfort Advisor**, I want to see a delivery status for charge request texts (sent, delivered, failed) so that I know whether the customer actually received it. | P0 | Partner / Internal |
| 2.2 | As a **Comfort Advisor**, when a charge request is about to expire (e.g., at 24 hours), I want the system to automatically send the customer a reminder so that deals don't fall through due to the 48-hour window. | P1 | Partner |
| 2.3 | As a **Comfort Advisor**, I want the ability to cancel a stalled charge request and send a new one so that I'm not blocked by a "pending" request the customer never received. | P0 | Internal |
| 2.4 | As a **Comfort Advisor**, before sending a contract for signature, I want to see a confirmation screen showing the contract amount alongside the approved loan amount so that I can catch discrepancies before the customer signs. | P0 | Internal |

**Source Chat References:**
- App #2305831 — customers not receiving charge request SMS; no way to verify from portal
- Apps #2290809, #2305831, #2280373 — 48-hour expiry, no auto-resend
- Apps #2280373, #2274662 — cannot send new charge request while one pending
- App #2267674, Darrell Helms — wrong amount ($9,000 vs $7,110.75) sent and signed

---

## Initiative 3 (Rank #3): Notification & Communication Infrastructure

**Prevalence:** 6 incidents across 5 months (Aug–Dec) | **Persistence:** Chronic — structural gaps in notification pipeline | **Urgency:** Medium-High — every silent failure is a potential lost deal

**Problem:** The portal has significant notification gaps — no email alerts for non-Premier apps, no webhooks from Microf, no notification when a conditional approval moves to declined, no alert when a CA isn't set up in Momnt. Support staff discover problems manually or not at all.

**Business Impact:** Every silent failure is a potential lost deal and a reactive support ticket that could have been a proactive fix.

**Resolves Issues:** Internal #12, #13, #19, #20, #31, #32

**Fix Status:**
- 🟢 Non-Premier email notifications — **FIXED** (11/19, Sphoorthi: "we'll push it today")
- 🟡 CA Momnt setup detection script — **IN PROGRESS** (script being built, not yet real-time portal alert)
- 🔴 Microf webhook notifications — **OPEN** (raised 8/4, no fix committed)
- 🔴 Credit bureau-specific freeze messaging — **OPEN**
- 🔴 In-portal FAQ/help content — **OPEN**

| # | User Story | Priority | Category |
|---|---|---|---|
| 3.1 | As an **Account Manager**, I want to receive email notifications for all application status changes (not just Premier Program apps) so that I have visibility into every deal in my pipeline. | P0 | Internal |
| 3.2 | As a **Comfort Advisor**, I want to see a clear in-portal alert if my Momnt setup is incomplete (missing check marks, registration not finalized) so that I can fix it before trying to send an invite that will fail. | P0 | Internal |
| 3.3 | As a **homeowner**, when the portal detects a credit freeze, I want to be told specifically which credit bureau is frozen so that I only need to call one bureau instead of all three. | P1 | Internal |
| 3.4 | As a **homeowner**, I want to be able to find answers to common questions (e.g., "Are statements paper or electronic?") in an FAQ or help section within the portal so that I don't need to call support. | P2 | Internal |

**Source Chat References:**
- 11/19/25, Cody Compton / Sphoorthi Keshannagari — "How fast can we set up the email notifications for acct mgmt?" → 🟢 pushed same day
- 8/4/25, Jason Duval / Sanjay Venkatesh, App #2219548 — "are we getting webhooks from Microf?"
- 8/19/25, Sanjay Venkatesh — Momnt rep registration gap; toggle fix documented but no proactive alert
- Kay Parramore (2/24 thread) — credit freeze shows all 3 bureaus, not the specific one
- Jordan Madrigal / Metro — customers asking about paper statements, no FAQ exists

---

## Initiative 4 (Rank #4): Customer-Facing Error Handling & Recovery Paths

**Prevalence:** 6 incidents across Sep–Dec | **Persistence:** Sporadic but high-impact when they occur | **Urgency:** High — each one is a potential lost deal with a customer in-hand

**Problem:** Customers hit dead ends with no guidance — "Access Denied" screens with just "Contact Admin," blank screens after approval, invalid link errors, and expired links with no way to self-recover.

**Business Impact:** Silent failures and dead-end screens directly impact deal close rates. CAs lose credibility with homeowners when the system appears broken.

**Resolves Issues:** Internal #6, #8, #9, #18, #33; User Error #13

**Fix Status:**
- 🟢 Dealer dashboard white screen — **FIXED** (9/10, Vipin: "this is working now" — ~20 min fix)
- 🔴 "Access Denied" recovery path — **OPEN** (workaround documented but no UI fix)
- 🔴 Invalid link on refresh — **OPEN**
- 🔴 Self-serve link re-request — **OPEN**
- 🔴 Mobile "Finish" button bug — **OPEN** (known, workaround is desktop)
- 🟡 Blank screen after approval — **MONITORING** (Sriram: "Will keep an eye"; Sanjay: "could be a timing thing")

| # | User Story | Priority | Category |
|---|---|---|---|
| 4.1 | As a **homeowner**, when I encounter an "Access Denied" or error screen, I want to see a clear message explaining what went wrong and a button to either retry or request a new link so that I'm not stuck at a dead end. | P0 | Internal |
| 4.2 | As a **homeowner**, when my invite link has expired, I want to see a message that says "This link has expired" with an option to request a new one (via text or email) so that I don't need to call the contractor to get a new link. | P0 | Internal |
| 4.3 | As a **homeowner**, when I refresh the portal page after receiving loan offers, I want my session and offers to persist so that I don't see an "invalid link" error and lose my progress. | P0 | Internal |
| 4.4 | As a **homeowner**, when my loan is approved but the offer hasn't loaded yet, I want to see a loading indicator with a message rather than a blank screen so that I know the system is working. | P1 | Internal |
| 4.5 | As a **homeowner** on a mobile device, I want all buttons (including "Finish Application" and "Submit") to be fully functional so that I can complete my application without switching to a desktop computer. | P0 | Internal |

**Source Chat References:**
- 9/10/25, Cody Compton / Vipin Mamidi — white screen bug → 🟢 fixed in ~20 min
- Customer #2314786, Cousin's Air — "Access Denied" with "Contact Admin," no recovery
- 11/6/25, Cody Compton, App #2231563 Giambrone — expired Momnt link, manual resend needed
- 11/20/25, Cody Compton / Sriram / Malhar — blank screen after approval; had to close tab and reopen
- App #2309017 — "Finish Application" button unresponsive on mobile
- App #2285xxx — "invalid link" after refresh

---

## Initiative 5 (Rank #5): Offer Clarity & Loan Product Display

**Prevalence:** 5 incidents concentrated in Nov | **Persistence:** Recurring — same confusion pattern | **Urgency:** High — directly blocked a deal closing (Erbaugh)

**Problem:** Momnt's deferred interest offers display as "102 months" when they're actually 18-month No Interest/No Payment plans. Rate plans toggled on in backend don't always appear. "See Additional Offers" button is buried.

**Business Impact:** The Erbaugh case required a personal phone call from Jason to close — that doesn't scale. Confusing labels erode homeowner trust.

**Resolves Issues:** Internal #4, #17; Partner #1, #5, #6; User Error #12, #16

**Fix Status:**
- 🟡 Momnt offer description fix — **IN PROGRESS** (11/28, Sphoorthi: "We'll fix the description issue on priority")
- 🔴 Rate plan auto-refresh after enable — **OPEN**
- 🔴 Offer card redesign / "See Additional Offers" visibility — **OPEN**

| # | User Story | Priority | Category |
|---|---|---|---|
| 5.1 | As a **homeowner**, I want every financing offer to display a clear, plain-language description so that I understand exactly what I'm selecting. | P0 | Partner / Internal |
| 5.2 | As a **homeowner**, I want promotional offers to be visually prominent with a clear badge and description so that I can identify the best option without confusion. | P0 | Internal |
| 5.3 | As a **Comfort Advisor**, when I enable a rate plan, I want it to appear in the customer's view immediately so that I don't have to escalate to engineering. | P1 | Internal |
| 5.4 | As a **Comfort Advisor**, I want to see the same offer descriptions the customer sees so that I can walk them through their options accurately. | P1 | Internal |
| 5.5 | As a **homeowner**, I want all available offers visible on one screen (or with a clearly labeled "View More Options" button) so that I don't miss hidden offers. | P1 | Internal |

**Source Chat References:**
- 11/28/25, Jason Duval / Cody Compton / Sphoorthi / Sri Harsha — extensive thread; Cody: "It will say 102 month instead of 18 month on the customer device??"; Sphoorthi: "the offer description is not very clear… We'll fix the description issue on priority" → 🟡; later: "Mr. Erbaugh does not feel confident and comfortable selecting to 102 month loan"; Jason called customer to reassure
- Customer #2313283 — rate plan toggled on but not showing
- App #2288569 — "Click Here" for more plans not visible
- Western States / Mike Bidwell — No No/No plan confusion between rate card and app view

---

## Initiative 6 (Rank #6): Application Lifecycle Management

**Prevalence:** 5 incidents across Nov–Dec | **Persistence:** Recurring — duplicates happened independently twice | **Urgency:** Medium — pipeline clutter and repeated status inquiries

**Problem:** No way to cancel or withdraw apps. Duplicates created because CAs don't know about resend. Stale apps generate repeated inquiries.

**Business Impact:** Pipeline clutter wastes AM and Customer Service time. Cody noted he gets "asked 4 times for a status update" on dead apps.

**Resolves Issues:** Internal #11; User Error #10, #11

**Fix Status:**
- 🟡 Withdraw/cancel status — **IN PROGRESS** (12/1, Sri Harsha: "Currently we're working on the withdraw status for these scenarios")
- 🟡 Auto-cancel after X days — **IN PROGRESS** (11/21, Sriram: "We will add it to the list to automatically cancel or withdraw after certain number of days")
- 🔴 Duplicate app warning — **OPEN**
- 🔴 Resend invitation UX improvement — **OPEN** (feature exists but CAs don't find it)

| # | User Story | Priority | Category |
|---|---|---|---|
| 6.1 | As an **Account Manager**, I want to mark an application as "Withdrawn" or "Customer Declined" so that it's removed from the active pipeline and stops generating status update requests. | P0 | Internal |
| 6.2 | As the **system**, I want to automatically move applications to a "Stale" status after 30 days of inactivity so that the pipeline reflects only active deals. | P1 | Internal |
| 6.3 | As a **Comfort Advisor**, when I try to create a new app for a customer who already has an active one, I want to see a warning with a link to the existing app so that I don't create duplicates. | P1 | Internal |
| 6.4 | As a **Comfort Advisor**, I want the "Resend Invitation" option to be clearly visible and allow changing delivery method (email vs. text) so that I don't need to create a new app. | P1 | User Error Prevention |

**Source Chat References:**
- 11/21/25, Cody Compton / Sriram — "can we withdraw the app?"; Sriram: "Right now I dont think we can cancel a loan approved app. We just have to abandon it" → 🟡 auto-cancel committed
- 12/1/25, Sri Harsha Peri — "Currently we're working on the withdraw status" → 🟡
- 11/19/25, Vipin Mamidi / Cody — Metro duplicate apps, two reps same customer
- 12/4–12/5/25, Cody / Sphoorthi — Laryn duplicates; Sphoorthi: "they can click on the same app from pipeline and click on re-send invitation"

---

## Initiative 7 (Rank #7): Form Validation & Data Quality Guards

**Prevalence:** 6 incidents across Aug–Dec | **Persistence:** One-time each (different users, same root cause: missing validation) | **Urgency:** Medium — each one is preventable but individually low-frequency

**Problem:** Wrong state format, missing income, fat-fingered SSNs, all-zero phone numbers, missing last names — all cause downstream declines. Every one is preventable with standard form controls.

**Business Impact:** Each preventable decline is a wasted app, support ticket, and erosion of contractor confidence. Collectively these are the easiest wins.

**Resolves Issues:** User Error #1–6, Internal #25–29

**Fix Status:**
- 🔴 State dropdown — **OPEN**
- 🔴 Income range validation — **OPEN**
- 🔴 SSN format validation — **OPEN**
- 🔴 Phone number validation — **OPEN**
- 🔴 Required field enforcement — **OPEN**

*Note: Despite being ranked #7 by prevalence/persistence, this initiative has the highest ROI-to-effort ratio. These are standard form controls that could ship in 1–2 sprints.*

| # | User Story | Priority | Category |
|---|---|---|---|
| 7.1 | As a **Comfort Advisor**, I want the state field to be a dropdown of two-letter abbreviations so that I cannot accidentally enter a full state name that causes declines. | P0 | Internal |
| 7.2 | As a **Comfort Advisor**, I want to see a warning when I enter an income value outside a reasonable range so that I can catch typos before submission. | P0 | Internal |
| 7.3 | As a **homeowner**, I want the SSN field to validate exactly 9 digits before I can proceed so that a typo doesn't cause downstream failure. | P0 | Internal |
| 7.4 | As a **portal admin**, I want the system to reject clearly invalid phone numbers (all zeros, <10 digits) so that Momnt invites don't fail silently. | P1 | Internal |
| 7.5 | As a **Comfort Advisor**, I want the portal to require all mandatory fields before submission so that I don't create incomplete apps that get declined. | P0 | Internal |
| 7.6 | As a **portal admin**, I want a profile completeness indicator for each rep so that I can identify missing data before they start submitting apps. | P2 | Internal |

**Source Chat References:**
- App #2287261, Sanjay Venkatesh — state "Alabama" instead of "AL" caused dual declines; income $2,400 vs $24,000
- App #2285xxx, "Jack" — SSN fat-fingered, caught downstream by lender
- 11/28/25, Cody Compton, App #2239935 Richard Cook — missing household income
- 12/8/25, Sanjay / Cody, App #2246451 Tyler Fletcher — biweekly income $300 typo
- Western States, Tonia Eidson — Mike Bidwell all-zero phone number
- Cousin's Air / Mitchell Lovinger — missing last name blocked invite

---

## Initiative 8 (Rank #8): Onboarding & Partner Setup Automation

**Prevalence:** 7 incidents across Aug–Dec | **Persistence:** Sporadic (each incident independent) | **Urgency:** Medium — bottleneck to scale but not urgent per-deal

**Problem:** Thrive and Breeze onboarding is entirely manual. Pre-qual links only work for Premier. New dealer setup has no guardrails — wrong service types, missing rep registrations, disabled permissions.

**Business Impact:** Manual onboarding is the primary bottleneck to scaling the partner network.

**Resolves Issues:** Internal #14, #15, #34, #35; Partner #2, #8; User Error #15

**Fix Status:**
- 🔴 Automated Thrive/Breeze onboarding — **OPEN** (acknowledged as manual since 8/20, no automation committed)
- 🔴 Pre-qual for all programs — **OPEN** (9/8, Sphoorthi: "in our backlog but have not prioritized it")
- 🟢 Steve King invite disabled — **FIXED** (12/3, Sanjay: "sending invite was disabled… we enabled it now")
- 🟢 William Godwin repair option — **FIXED** (12/4, Vipin: "will update his access in 5-10 minutes")
- 🟢 Christy Bolton abandoned signup — **FIXED** (12/4, Sanjay manually deleted record)
- 🔴 Automated abandoned signup cleanup — **OPEN**
- 🔴 Onboarding validation checklist — **OPEN**

| # | User Story | Priority | Category |
|---|---|---|---|
| 8.1 | As a **portal admin**, I want an automated onboarding workflow for Thrive and Breeze that pulls dealer info from Momnt and submits it to each partner automatically. | P0 | Internal |
| 8.2 | As a **portal admin**, I want pre-qualification links to work for all program types (not just Premier). | P1 | Internal |
| 8.3 | As the **system**, during dealer onboarding, I want a checklist that validates all reps are registered, permissions are correct, and only correct service types are enabled. | P1 | Internal |
| 8.4 | As a **portal admin**, I want to manage user roles (standard vs. admin) as a self-service action. | P2 | Internal |
| 8.5 | As the **system**, I want to automatically clean up abandoned signup records after 30 days. | P2 | Internal |

**Source Chat References:**
- 8/20/25, Cody / Sri Harsha / Jason — Roy's Plumbing; Sri Harsha: "It's all manual onboarding"; Jason: "Thrive is manual for us" → 🔴
- 9/8/25, Cody / Sphoorthi — Polar Pros; Sphoorthi: "Our Prequal links are only for Premier Program… in our backlog but have not prioritized" → 🔴
- 12/3/25, Sanjay — Steve King invite disabled → 🟢 fixed from backend
- 12/4/25, Vipin — William Godwin missing repair option → 🟢 fixed in 10 min
- 12/4/25, Cody / Sanjay — Christy Bolton abandoned signup → 🟢 manually deleted
- Prospector Plumbing — Water Filter/Softener wrongly enabled

---

## Initiative 9 (Rank #9): Admin & Account Manager Portal Enhancements

**Prevalence:** 5 incidents, mostly Jan–Feb 2026 | **Persistence:** Chronic data gaps | **Urgency:** Low — operational friction, not deal-blocking

**Problem:** AMs are missing retail price, dealer fee, applicant details, plan selection visibility, and export in admin views.

**Business Impact:** Every data lookup diverts engineering time. AMs can't operate independently.

**Resolves Issues:** Internal #7, #16, #22, #23, #24

**Fix Status:**
- 🟢 Applicant details in pipeline — **FIXED** (pushed 1/30)
- 🟡 Export button — **IN PROGRESS** (confirmed as bug, fix not yet confirmed deployed)
- 🔴 Retail price in admin view — **OPEN** ("wish list" item)
- 🔴 Dealer fee visibility — **OPEN**
- 🔴 Selected plans column in ACC — **OPEN** (Jason requested; acknowledged as future improvement)

| # | User Story | Priority | Category |
|---|---|---|---|
| 9.1 | As an **Account Manager**, I want to see retail price, dealer fee percentage, and approved loan amount side by side in the admin view. | P0 | Internal |
| 9.2 | As an **Account Manager**, I want to export pipeline data to CSV/Excel from the live pipeline view. | P0 | Internal |
| 9.3 | As a **portal admin**, I want the ACC to show which Momnt plans were selected during setup for each dealer. | P1 | Internal |
| 9.4 | As an **Account Manager**, I want to see full applicant details directly in the pipeline view. | P1 | Internal |

**Source Chat References:**
- 2/5 thread — retail price "wish list" item from CA → 🔴
- 1/28 thread, Apex CA — dealer fee not visible post-approval → 🔴
- 1/30 thread — applicant details pushed as fix → 🟢
- 2/2 thread — export button missing from live view, confirmed bug → 🟡
- 11/28/25, Jason / Sphoorthi — selected plans column requested for ACC → 🔴

---

## Initiative 10 (Rank #10): Partner Relationship & Integration Improvements

**Prevalence:** 13 incidents (highest raw count) across 5 months | **Persistence:** Mixed — Momnt chronic, Microf/Breeze sporadic | **Urgency:** High for Momnt, Medium for others

**Problem:** Partner-side issues require coordination outside the portal. The portal doesn't surface partner problems or provide graceful degradation when a partner is down.

**Business Impact:** Partner issues account for 20% of all incidents. Momnt alone drives 6 of 13.

**Resolves Issues:** Partner #2, #3, #6, #7, #8, #11, #12

**Fix Status:**
- 🟢 Momnt outage — **RESOLVED** (12/4, back up in ~30 min; but no systemic outage detection added)
- 🟡 Momnt offer description — **IN PROGRESS** (see Initiative 5)
- 🟡 Momnt employment types — **IN PROGRESS** (Jason sent feedback to Momnt)
- 🔴 Momnt SMS delivery issues — **OPEN**
- 🔴 Microf dealer inactive detection — **OPEN**
- 🟡 Breeze email routing — **IN PROGRESS** (12/3, Sanjay: "Will send a note to Breeze to change it")
- 🔴 Partner outage banner in portal — **OPEN**
- 🔴 Integration health dashboard — **OPEN**

| # | User Story | Priority | Category |
|---|---|---|---|
| 10.1 | As a **Comfort Advisor**, when a lending partner is experiencing an outage, I want to see a banner in the portal indicating which partner is affected. | P0 | Partner |
| 10.2 | As a **portal admin**, I want the system to auto-detect when a dealer is "inactive" at a lending partner and alert the team. | P1 | Partner |
| 10.3 | As a **portal admin**, I want to configure which email address receives lender communications for each dealer. | P1 | Partner / Internal |
| 10.4 | As a **product manager**, I want a partner integration health dashboard showing webhook delivery rates and sync failures. | P2 | Partner / Internal |

**Source Chat References:**
- 12/4/25, Sphoorthi — "Everyone, urgent update, Momnt is currently down" → 🟢 resolved ~30 min later; Cody: "if the manager notices that, I'll likely have to tell her Momnt is down which means she may tell their whole team"
- 11/28/25, Jason — Momnt missing employment types → 🟡 feedback sent
- 11/25/25, Sanjay, App #2239142 Thomas Jones — Microf dealer inactive → 🔴
- 12/2–12/3/25, Cody / Sanjay — Breeze email to Metro Plbg president → 🟡 note sent to Breeze
- 8/4/25, Jason / Sanjay — Microf webhooks missing → 🔴

---

## Consolidated Fix Status Dashboard

### 🟢 FIXED (confirmed deployed)
| Issue | Date Fixed | Initiative |
|---|---|---|
| Non-Premier email notifications | 11/19/25 | Notifications (#3) |
| Dealer dashboard white screen | 9/10/25 | Customer Errors (#4) |
| Funding bug — water heater systems | 9/3/25 | Onboarding (#8) |
| Momnt rep toggle fix documented | 8/19/25 | Onboarding (#8) |
| Applicant details in pipeline | 1/30/26 | Admin Portal (#9) |
| Steve King invite re-enabled | 12/3/25 | Onboarding (#8) |
| William Godwin repair option | 12/4/25 | Onboarding (#8) |
| Christy Bolton abandoned signup deleted | 12/4/25 | Onboarding (#8) |
| Momnt outage resolved | 12/4/25 | Partner (#10) |
| Greist low-to-fixed rate change | 8/15/25 | One-off backend |
| App name correction (Wilcot) | 8/18/25 | One-off backend |

### 🟡 IN PROGRESS (committed but not confirmed deployed)
| Issue | Committed Date | Initiative |
|---|---|---|
| Withdraw/cancel app status | 12/1/25 | App Lifecycle (#6) |
| Auto-cancel stale apps after X days | 11/21/25 | App Lifecycle (#6) |
| Momnt offer description fix | 11/28/25 | Offer Clarity (#5) |
| Momnt employment types feedback | 11/28/25 | Partner (#10) |
| Breeze email routing note sent | 12/3/25 | Partner (#10) |
| Export button bug fix | 2/2/26 | Admin Portal (#9) |
| CA Momnt setup detection script | Ongoing | Notifications (#3) |

### 🔴 OPEN (no fix identified or committed)
| Issue | First Reported | Initiative |
|---|---|---|
| Webhook integration with Microf | 8/4/25 | Status Sync (#1) |
| Auto-sync with all lenders | Ongoing | Status Sync (#1) |
| SMS delivery verification | Late Nov | Charge Requests (#2) |
| 48-hour charge request expiry | Late Nov | Charge Requests (#2) |
| Override stalled pending charge request | Late Nov | Charge Requests (#2) |
| Contract amount confirmation step | Late Nov | Charge Requests (#2) |
| Credit bureau-specific freeze messaging | Feb 2026 | Notifications (#3) |
| "Access Denied" recovery path UX | Ongoing | Customer Errors (#4) |
| Invalid link on refresh | Ongoing | Customer Errors (#4) |
| Self-serve link re-request | Ongoing | Customer Errors (#4) |
| Mobile "Finish" button bug | Ongoing | Customer Errors (#4) |
| Rate plan auto-refresh after enable | Ongoing | Offer Clarity (#5) |
| Duplicate app warning | Ongoing | App Lifecycle (#6) |
| All form validation (state, income, SSN, phone) | Ongoing | Form Validation (#7) |
| Automated Thrive/Breeze onboarding | 8/20/25 | Onboarding (#8) |
| Pre-qual for all programs | 9/8/25 | Onboarding (#8) |
| Retail price in admin view | Jan 2026 | Admin Portal (#9) |
| Dealer fee visibility | Jan 2026 | Admin Portal (#9) |
| Partner outage banner | N/A | Partner (#10) |
| Integration health dashboard | N/A | Partner (#10) |
| Microf dealer inactive detection | 11/25/25 | Partner (#10) |

---

## Summary

| Initiative | Stories | P0 | P1 | P2 | Fix Status |
|---|---|---|---|---|---|
| 1. Status Sync (Rank #1) | 5 | 3 | 1 | 1 | 🔴 Mostly open |
| 2. Charge Requests (Rank #2) | 4 | 2 | 1 | 1 | 🔴 All open |
| 3. Notifications (Rank #3) | 4 | 2 | 1 | 1 | 🟡 1 fixed, rest open |
| 4. Customer Errors (Rank #4) | 5 | 3 | 1 | 1 | 🟡 1 fixed, 1 monitoring |
| 5. Offer Clarity (Rank #5) | 5 | 2 | 3 | 0 | 🟡 Description fix in progress |
| 6. App Lifecycle (Rank #6) | 4 | 1 | 3 | 0 | 🟡 Withdraw in progress |
| 7. Form Validation (Rank #7) | 6 | 3 | 1 | 2 | 🔴 All open |
| 8. Onboarding (Rank #8) | 5 | 1 | 2 | 2 | 🟡 One-offs fixed, systemic open |
| 9. Admin Portal (Rank #9) | 4 | 2 | 2 | 0 | 🟡 1 fixed, 1 in progress |
| 10. Partner Integration (Rank #10) | 4 | 1 | 2 | 1 | 🟡 Outage resolved, rest mixed |
| **Totals** | **46** | **20** | **17** | **9** | |

### Revised Prioritization (based on prevalence × persistence × impact)

**Critical Path (chronic + high impact + mostly open):**
1. Status Sync (#1) — chronic, all-lender, 🔴 mostly open
2. Charge Requests (#2) — chronic, deal-blocking, 🔴 all open

**High Priority (recurring + in-progress fixes to accelerate):**
3. Notifications (#3) — chronic, partially addressed
4. Offer Clarity (#5) — recurring, fix in progress but needs acceleration
5. App Lifecycle (#6) — withdraw feature in progress, ship it

**Quick Wins (highest ROI-to-effort, all open):**
6. Form Validation (#7) — 6 preventable errors, standard form controls, 1–2 sprints

**Medium Priority:**
7. Customer Errors (#4) — sporadic but high-impact when they hit
8. Admin Portal (#9) — operational friction

**Strategic (longer horizon):**
9. Onboarding (#8) — scale bottleneck
10. Partner Integration (#10) — external coordination required

---

*End of user stories.*
