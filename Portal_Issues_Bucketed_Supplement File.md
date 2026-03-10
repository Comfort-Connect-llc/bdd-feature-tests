# Integrated Portal Support — Comprehensive Issue Analysis

**Source:** Integrated Portal Support Chat (Aug 2025 – Feb 2026)
**Date of Review:** March 4, 2026

This report consolidates all issues identified across the full chat history into three categories: User Error, Partner-Based, and Internal Update Needed. Issues that span multiple categories are placed under their primary root cause with cross-references noted.

---

## User Error (16 issues)

### Data Entry Mistakes

**1. State Entered as "Alabama" Instead of "AL" — Caused Dual Declines, App #2287261**
A contractor entered the full state name instead of the two-letter abbreviation, causing both Momnt and Thrive to decline the application. *Also Internal: portal allows freeform text entry with no dropdown or validation.*

**2. Annual Income Entered as $2,400 Instead of $24,000, App #2287261**
Customer's income was entered as $2,400 instead of $24,000, causing a decline. *Also Internal: no range-validation or warning flags for implausibly low income values.*

**3. Wrong SSN Entered (Fat-Fingered), App #2285xxx**
A customer fat-fingered their SSN, caught downstream by the lender but not at point of entry. Created complications with other plans selected, requiring a new app. *Also Internal: no SSN validation/verification step at point of entry.*

**4. Richard Cook — Didn't Input Household Income, App #2239935 (11/28)**
Metro CA submitted a repair financing app without household income. Loan declined; same app cannot be resubmitted. *Also Internal: better form guidance or required-field validation needed.*

**5. LTO Declined — Biweekly Income Typo, App #2246451 (12/8)**
Dixie Electric CA submitted an LTO app with biweekly income listed as $300 — suspected typo causing decline.

**6. Contractor Rep Has All-Zero Phone Number — Mike Bidwell**
A sales rep had all 0s as their phone number in the portal, preventing Momnt invites from being sent. *Also Internal: no validation at data entry or flag for incomplete profiles.*

### Wrong Action / Process Mistakes

**7. App #2224786 — Accidentally Sent to Momnt Instead of Premier Program (9/8)**
Vastola CA selected the wrong financing path. App had to be manually moved back while the CA was sitting with the homeowner.

**8. Customer Charged Wrong Amount — Wrong Contract Sent, App #2267674**
A contract was sent with $9,000 instead of $7,110.75, and the customer signed it. Required discarding and recreating the contract. *Also Internal: no confirmation step or amount-mismatch warning before sending contracts.*

### Training / Awareness Gaps

**9. Metro CA Unaware of LTO Option After Loan Decline — App #2237436 (11/19)**
Neither the CA nor the customer knew they could proceed to LTO after a loan decline. Training gap — CA didn't understand the fallback flow.

**10. Duplicate App Submission — Metro, Same Customer / Two Reps (11/19)**
Ricky (field CA) submitted an app that was declined; Nicholas Glavich (inside sales/admin) submitted a second for the same customer. Unclear coordination led to duplicates.

**11. Laryn at A/C Contractors — Duplicate Apps for Same Customer (12/4–12/5)**
Laryn created duplicate apps because the homeowner had trouble with email invite. Didn't know about the "re-send invitation" feature in the pipeline.

**12. Customer Confused by Momnt 102-Month Offer Description (11/28)**
Mr. Erbaugh refused to select the 18-month No/No because it displayed as "102 months." Required a phone call from Jason to reassure. *Also Internal (see Internal #17) and Partner-Based (see Partner #5).*

**13. Momnt App Link Expired — Vastola Customer Giambrone, App #2231563 (11/6)**
Customer on old flow delayed completing the Momnt app; link expired. Had to be manually resent.

**14. Incorrect Bank Information — App #2239521, James Myers (11/26)**
Homeowner entered incorrect bank details on Breeze. Corrected directly with Breeze but approval fell out of sync with portal. *Also Partner-Based: Breeze approval didn't sync back.*

**15. Christy Bolton — Abandoned Signup / Can't Log In (12/4)**
Started signup but never completed it, leaving an abandoned record. Couldn't log in or reset password. Sanjay had to manually delete the record. *Also Internal: no cleanup of abandoned signups.*

**16. No No/No Plan Confusion — Western States / Mike Bidwell**
Confusion arose over whether the No No/No plan was appearing on the correct rate card vs. the app. The two-step process (update main rate card first, then the app) wasn't well understood. *Also Internal: process not clearly communicated in portal.*

---

## Partner-Based (13 issues)

### Momnt

**1. Momnt — 18-Month No/No Offer Displaying as "102 Months" (11/28)**
The deferred interest product description was unclear and confusing on the customer-facing view. The "102 months" label was actually the 18-month No/No plan with 84 amortizing payments after.

**2. Momnt — Missing Employment Type Categories (11/28)**
Momnt's employment type dropdown doesn't include government, law enforcement, or municipality. Jason sent feedback to Momnt.

**3. Momnt — System Outage (12/4)**
Momnt went completely down, affecting all repair apps. Also caused William Godwin at Dixie to lose his repair financing button. Restored after ~30 minutes.

**4. Momnt — Charge Request Texts Not Being Received by Customer, App #2305831**
Multiple customers not receiving charge request SMS from Momnt. The portal shows the correct phone number but texts aren't arriving. No way to verify delivery from the portal side.

**5. Momnt — Charge Requests Expire After 48 Hours, Apps #2290809, #2305831, #2280373**
Charge requests expire after only 48 hours with no automatic re-send or reminder. Customer has no self-serve way to reopen. Entire request must be manually resubmitted by the contractor.

**6. Momnt — 12-Month No No Plan Not Available on Portal (Western States)**
For a specific contractor, the 12-month No No plan wasn't visible and gave an error when attempted through Momnt.

### Microf

**7. Microf — App #2219548 (Watts), Customer Couldn't Pay Until September (8/4)**
Application showed declined after originally being selected. Status change from Microf wasn't communicated back via webhooks or email.

**8. Microf — Dealer Showing as Inactive, App #2239142, Thomas Jones (11/25)**
LTO attempt failed because Microf was showing the dealer as inactive on their end.

**9. Microf — No Notification on Decline of Previously Conditionally Approved App, App #2280121**
When Microf declined an app that was previously conditionally approved, no notification was sent to portal users. Had to be discovered manually.

### Breeze

**10. Breeze — "Incorrect Bank Information" Error / Lack of Account Type Documentation (11/26)**
Breeze rejected app #2239521 with "incorrect bank information." Team needed clarification from Breeze on accepted account types. Approval done directly with Breeze didn't sync back to portal.

**11. Breeze — App #2239142 Error (11/25)**
Breeze also failed on the Thomas Jones LTO attempt alongside Microf. Had to be manually triggered from backend.

**12. Breeze — Approval Email Sent to Wrong Recipient at Metro Plbg (12/2–12/3)**
Breeze sent approval email to the president of Metro Plumbing instead of the operations email. No email config had been set up on portal side.

**13. Breeze — Funding Status Shows Funded, Lender Says Not Paid, App #2261859**
Portal reflected funded status while Breeze claimed the contractor had not been paid. Required manual investigation across platforms. *Also Internal: status sync issue.*

---

## Internal Update Needed (35 issues)

### Bugs

**1. Funding Submission Bug — Water Heater Systems (9/2)**
Amy at Apex couldn't submit app #2224037 for Microf funding. Bug specific to water heater system funding requests. Fix pushed overnight.

**2. Dealer Dashboard Overview — White Screen Bug (9/10)**
Dealer overview showed only a white screen on phones and computers. Caused by in-progress deployment. Fixed within ~20 minutes.

**3. Display Name Bug — "Contractor" Instead of "Sales Rep" (9/15)**
Portal showed internal name "Contractor" instead of display name (Comfort Advisor / Sales Rep).

**4. Momnt Approved Amounts Not Showing in Pipeline (10/10)**
Approved amounts from Momnt not displaying in pipeline view despite data existing. UI rendering issue.

**5. Metro CA Error — Loan Offers Not Loading, App #2237554 (11/19)**
Ricky at Metro received an error preventing loan offers from displaying while with a customer. Required urgent engineering support.

**6. Loan Approval Not Displaying on Customer Device (11/20)**
Customer's approved loan offer didn't show on their device. Refresh didn't help — had to close tab and reopen link. Timing/caching issue.

**7. Export Button Missing from Pipeline View (2/2)**
Export button was visible in mirror mode but missing from the live pipeline view. Confirmed as a bug.

**8. "Finish" / Submit Button Not Working on Mobile, App #2309017**
Customer could see documents but the "Finish Application" button was unresponsive. Known mobile-specific UI bug — workaround was to use desktop.

**9. "Invalid Link" Error After Portal Refresh, App #2285xxx**
Customers seeing "invalid link" errors when refreshing their browser. Required sending a new link each time.

**10. Thrive Stipulations "Invalid" Message — App #2244288 (12/5)**
Customer finished Thrive stipulations but kept getting "invalid" message when trying to sign docs.

### Missing Features / Product Gaps

**11. No Ability to Cancel or Withdraw Approved Loan Apps (11/21)**
No way to cancel or withdraw a loan-approved app the customer decides not to pursue. App sits in pipeline generating repeated status update requests. Withdraw status feature was in development as of 12/1.

**12. Missing Email Notifications for Account Management (Non-Premier) (11/19)**
No live email notifications for non-Premier apps. Sphoorthi committed to pushing same day.

**13. Missing Webhook/Email Notifications from Microf (8/4)**
No email updates sent when Microf app status changed. Webhooks not being received for event updates. Notification pipeline gap.

**14. Pre-Qual Links Only Available for Premier Program (9/8)**
Pre-qual links only support Premier Program. Non-Premier contractors have no equivalent. Feature in backlog but not prioritized.

**15. Thrive & Breeze Onboarding Still Manual (8/20)**
Dealer onboarding for Thrive and Breeze is entirely manual. No automated flow exists, creating a bottleneck.

**16. Admin Command Center Missing "Selected Plans" Visibility (11/28)**
ACC doesn't show which Momnt plans were selected during initial setup vs. what's available. Jason requested a column for selection status.

**17. Cannot Send New Charge Request While One is In Progress, Apps #2280373, #2274662**
System blocks new charge requests if a prior one is still "pending," even if stalled. No override or escalation path from the UI.

**18. No Self-Serve Way for Customers to Request New Invite Link**
When links expire or break, there's no customer-facing option to request a new one. Must be manually resent by a support rep every time.

**19. No Portal Message When CA is Not Set Up in Momnt**
If a CA hasn't completed Momnt setup, there's no portal indicator. Invites fail silently. A script was being built to identify these cases.

**20. No Paper Statement Option — Not Clearly Communicated**
Customers ask about paper statements. No FAQ or in-portal content explaining that billing is electronic-only. Support fields these calls reactively.

**21. User Role Switching Requires Manual Support Intervention**
Multiple requests to manually switch users from standard to Admin role. Should be a self-service option for company admins.

**22. Retail Price Not Visible in Admin Command View**
Retail price of a job is not displayed in the admin command view, making it difficult to cross-check approved loan amount against job cost.

**23. Dealer Fee Percentage Not Visible After Approval (1/28)**
Dealer fee percentage is not populated or visible post-approval. Account managers have to ask support to look it up.

**24. Applicant Details Not Visible in Pipeline for Account Managers (1/30)**
Account managers couldn't see applicant details in pipeline view (ACC). Fixed and pushed 1/30 but highlights the gap.

### Data Validation Gaps

**25. State Field Allows Freeform Text — No Dropdown, App #2287261**
Portal allows typing full state names instead of using a dropdown with two-letter abbreviations. Causes downstream declines at Momnt and Thrive.

**26. No Income Range Validation, App #2287261**
No warning flags for implausibly low income values (e.g., $2,400 annual). Causes preventable declines.

**27. No SSN Validation at Point of Entry, App #2285xxx**
No SSN format verification step at data entry. Errors caught downstream by lenders create complications requiring new apps.

**28. No Phone Number Validation on Rep Profiles**
All-zero phone numbers are accepted and stored without flagging, causing Momnt invites to fail silently.

**29. Missing Last Name Field Blocks Invite — No Prompt for Required Fields**
When a contact's profile is missing a last name, the Momnt invite fails. Portal doesn't prompt users to complete required fields before attempting to send.

### Status Sync & Notification Issues

**30. Portal Status Not Syncing with Lender Portals (Thrive/Momnt)**
Portal status and lender-side statuses frequently out of sync. Manual "Refresh Status" / "Mirror Company" action required — not automatic. Multiple instances across apps.

**31. Loan Declined After "Approved For Less" — No Proactive Notification, App #2280121**
App moved from "Approved For Less" to "Declined" with no notification to portal users. Discovered manually.

**32. Customer Doesn't Know Which Credit Bureau Freeze to Lift**
Portal shows "credit freeze detected" with all 3 bureau contact numbers but doesn't specify which bureau caused the block. Customers forced to contact all three.

**33. "Access Denied" Screen on Customer Devices — No Recovery Path**
Multiple customers hit an "Access Denied" error with "Contact Admin" messaging. No clear on-screen recovery path. Workaround (navigate back to Home, tap home icon) is not intuitive.

### Configuration / Setup Gaps

**34. Steve King — Invite Sending Disabled (12/3)**
CA had invite sending disabled in the portal. Engineering identified and fixed from backend. Root cause unclear.

**35. William Godwin — Missing Repair Financing Option (12/4)**
Only seeing "new system financing," not repair. Access needed backend update. Likely wrong configuration during onboarding.

---

## Summary

| Category | Count |
|---|---|
| User Error | 16 |
| Partner-Based | 13 |
| Internal Update Needed | 35 |
| **Total** | **64** |

### Breakdown by Sub-Theme

**User Error:**
- Data Entry Mistakes: 6
- Wrong Action / Process: 2
- Training / Awareness Gaps: 8

**Partner-Based:**
- Momnt: 6
- Microf: 3
- Breeze: 4

**Internal Update Needed:**
- Bugs: 10
- Missing Features / Product Gaps: 14
- Data Validation Gaps: 5
- Status Sync & Notification Issues: 4
- Configuration / Setup Gaps: 2

### Key Patterns

**Internal issues account for over half (55%) of all issues.** The largest sub-categories are missing features (14) and bugs (10). Many user errors are partially attributable to internal gaps — 6 of 16 user errors have a cross-reference to a missing validation or UI guardrail that could have prevented the error.

**Partner issues cluster around three vendors:** Momnt (6), Breeze (4), and Microf (3). The most impactful are Momnt's confusing offer descriptions, charge request delivery failures, and the 48-hour expiration window.

**User errors are predominantly training-related** (8 of 16). The data entry mistakes (6) could largely be eliminated with front-end validation (dropdowns for state, range checks for income, SSN format validation, phone number validation).

---

*End of report.*
