# Claude Project Memory — Comfort Connect Platform

> This file tracks project context, design decisions, conventions, and enhancement history so Claude can actively learn and improve across sessions.

---

## Project Overview

**Product:** Comfort Connect — a white-label financing platform for home comfort equipment (HVAC, water heaters, etc.) that connects dealers/contractors with multiple lending partners.

**Core Lender Integrations:** Momnt (loans), Microf (LTO), Breeze (LTO), Thrive (loans)

**Primary Users:** Dealers/Contractors (portal operators), Homeowners (applicants/borrowers), Admins (platform managers), Partners (lending institutions)

---

## BRD Structure

The Business Requirements Document is organized into **13 modules** with **90 feature files** containing **325 scenarios** in Gherkin Given/When/Then format.

### Module Inventory

| # | Module | Feature Files | Description |
|---|--------|--------------|-------------|
| 01 | Identity & Access | 4 | User registration, auth, roles, partner access |
| 02 | Dealer Management | 10 | Merchant onboarding, training, agreements, NDAs |
| 03 | Prequalification & Origination | 16 | Applications, prequal, offers, lender-specific flows (Momnt/Microf/Breeze/Thrive), document signing, first payment |
| 04 | Underwriting & Verification | 6 | Credit bureau, automated/manual UW, income verification, property/deed |
| 05 | Pricing & Equipment | 8 | Equipment catalog, buydown pricing, invoice verification |
| 06 | Document Management | 3 | Document generation, storage, compliance |
| 07 | Installation & Funding | 4 | Installation auth, contractor payment, partner funding, funding docs |
| 08 | Billing & Payments | 6 | Billing setup, cycles, payment processing/scheduling, fees, reconciliation |
| 09 | Account Servicing | 16 | Account lookup, status mgmt, buyout, maintenance, gamification, support, archiving, task mgmt, Momnt visibility, funding request audit |
| 10 | Communications | 5 | Email, SMS, in-portal notifications, real-time updates, preferences |
| 11 | Promotions | 2 | Promotion management, company-specific promotions |
| 12 | Administration | 9 | System config, rate sheets, branding, reporting, data export, UW config, partner validation |
| 13 | Integrations | 1 | External system integrations, Momnt charge/readiness webhooks |

### BRD File Locations

- **Gherkin feature files:** `features/module-XX-name/*.feature`
- **BRD module documents:** `BRD/modules/Module_XX_Name.md`
- **Supplementary docs:** Root-level `.md` files (GAP_ANALYSIS_REPORT, FIGMA_DESIGN_LINKING, BUSINESS_DOMAIN_COVERAGE_MAP, etc.)

### User Story Numbering Convention

- Format: `US-X.Y.Z` where X = module, Y = section, Z = story number
- Scenario names follow: descriptive kebab-case or natural language
- Each scenario uses Given/When/Then acceptance criteria with concrete data examples

---

## Design System — Portal 2.0

Extracted from Figma file: `Portal2.0-ipad-v.1.0.0` (file key: `nO8BrnBe7Z0UhLd2s5FecK`)

### Figma References

- **Style Guide:** `node-id=0-1` — Typography, colors, component library
- **Current Design Flow:** `node-id=102-19672` — Full portal screen flows
- **Key nodes inspected:** Typography (19:131), Components (27:79), Sidebar (8183:39145), Progress Steps (4166:386206), Notifications (11:1717), Tracker Pills (3035:34235), Approved Screen (198:42813), Customer Info (182:38909), Equipment Setup (198:43799)

### Color Palette

| Token | HSL | Hex | Usage |
|-------|-----|-----|-------|
| `--primary` / `--cc-navy` | 213 100% 21% | #002F6C | Primary brand, headings, sidebar, top bar |
| `--foreground` | 0 0% 25% | #3F3F3F | Body text |
| `--background` | 210 20% 98% | #FCFCFC | Page background |
| `--muted-foreground` | 0 0% 65% | #A7A7A7 | Placeholder/muted text |
| `--cc-green` | 120 60% 45% | ~#3d9b4f | CTA buttons, success states, active stepper |
| `--cc-orange` | 28 90% 55% | ~#e87722 | Form section labels, accent highlights |
| `--cc-teal` | 190 70% 42% | — | Informational badges |
| `--cc-sidebar-bg` | 213 100% 18% | #002147 | Dark navy sidebar background |
| Content area bg | — | #f0f2f5 | Light gray content zone behind cards |

### Typography

- **Font family:** Proxima Nova (production) / Nunito Sans (Google Fonts substitute)
- **Scale:** 1.200 – Minor Third, 16px baseline
- **Heading hierarchy:**
  - H1: Bold 57.3px / 80px line-height
  - H2: Bold 47.78px / 71.67px
  - H3: Semibold 39.81px / 56px
  - H4: Semibold 27.65px / 32px
  - H5: Semibold 23.04px / 32px
  - H6: Semibold 19.2px / 24px
- **Body:** Medium 16px, Small 13.33px, Extra Small 11.11px

### Layout Pattern

- **Sidebar:** Dark navy (#002147), icon-only with hover labels, bottom-anchored Settings/Profile/Logout
- **Top Bar:** Navy #002F6C, "ComfortConnect" branding left, user dropdown right
- **Content Area:** Light gray (#f0f2f5) background, white cards with subtle borders
- **Cards:** White, rounded corners, subtle shadow, padded content

### Component Patterns

- **Stepper (vertical/horizontal):** Green checkmark circles (completed) → navy numbered with ring shadow (active) → white with gray border (pending), connected by 3px rounded lines
- **Tracker Pills:** 7-stage horizontal bar: Apply → Sign → Pay → Authorize → Install → Review → Fund. Green = active, navy = completed, gray = pending. Rounded end caps.
- **Form Labels:** Orange (#e87722) uppercase section headers above form groups
- **Buttons:** Green (primary CTA), Navy outline (secondary), Gray (disabled)
- **Notifications:** Color-coded banners — blue info, green success, amber warning, red error
- **Inputs:** Rounded borders, gray placeholder text, focus ring in navy

---

## Technical Stack (Wireframe/Prototype)

- **Framework:** React 19 + TypeScript
- **Build:** Vite 7 (dev) + Parcel (production bundle)
- **Styling:** Tailwind CSS 3.4.1 + tailwindcss-animate
- **Components:** shadcn/ui (Card, Button, Badge, Input, Label, Separator, Tabs)
- **Bundling:** `parcel build` + `html-inline` for single-file HTML artifact output
- **Source:** `/sessions/determined-happy-clarke/momnt-workflow/`
- **Output artifacts in project folder:** `momnt-charge-workflow*.html`

### PATH Note

When running pnpm commands in the VM, prepend:
```bash
export PATH="/sessions/determined-happy-clarke/.npm-global/bin:$PATH"
```

---

## Enhancement Changelog

### 2026-03-11 — Funding Request Attribution & Audit Scenarios

**What changed:** Added cross-lender funding request user attribution tracking and an operational audit view, based on a new user story about viewing which user requested funding on any loan type.

**Gap identified:** Existing Breeze (US-14.4.3), Microf (US-14.4.4), and generic paperwork (US-14.2.1) funding scenarios did not log the requesting user. Only the rewritten Momnt charge request (US-7.4.1) captured this. New stories close this gap across all lenders.

**Stories added (5 new scenarios, 1 new feature file):**

| Story | Module | Feature File | Description |
|-------|--------|-------------|-------------|
| US-7.4.8 | 07 | `partner-funding.feature` | Log requesting user on ALL funding submissions (cross-lender) |
| US-9.19.1 | 09 | `funding-request-audit.feature` *(new)* | View funding request attribution on account detail |
| US-9.19.2 | 09 | `funding-request-audit.feature` *(new)* | Search/filter funding requests by requesting user |
| US-9.19.3 | 09 | `funding-request-audit.feature` *(new)* | Export funding request attribution data |
| US-9.19.4 | 09 | `funding-request-audit.feature` *(new)* | Role-based access to funding request attribution |

**Scenario count:** 320 → 325 (+5 new)
**Feature file count:** 89 → 90 (+1 new file)

---

### 2026-03-11 — Momnt Charge Request Stories → Gherkin Feature Files

**What changed:** Converted the 10 Momnt charge request/funding flow user stories (previously written to BRD module docs) into Gherkin scenarios in the feature files.

**Stories applied (9 net new scenarios, 1 rewrite):**

| Story | Module | Feature File | Action |
|-------|--------|-------------|--------|
| US-3.12.7 | 03 | `momnt-loan-flow.feature` | Added — Capture planned install date |
| US-7.4.1 | 07 | `partner-funding.feature` | Rewritten — Initiate Momnt charge request (was "Request Momnt Funding") |
| US-7.4.6 | 07 | `partner-funding.feature` | Added — Schedule charge for future date |
| US-7.4.7 | 07 | `partner-funding.feature` | Added — Track charge approval status |
| US-9.18.1 | 09 | `momnt-account-visibility.feature` *(new file)* | Added — View Momnt account readiness |
| US-9.18.2 | 09 | `momnt-account-visibility.feature` *(new file)* | Added — View charge/funding timeline |
| US-10.1.7 | 10 | `email-notifications.feature` | Added — Welcome Call notification |
| US-12.3.6 | 12 | `partner-configuration.feature` | Added — Charge timing rules config |
| US-13.6.1 | 13 | `momnt-webhooks.feature` *(new file + new directory)* | Added — Charge status webhooks |
| US-13.6.2 | 13 | `momnt-webhooks.feature` *(new file)* | Added — Readiness status webhooks |

**New files created:**
- `features/module-09-account-servicing/momnt-account-visibility.feature`
- `features/module-13-integrations/momnt-webhooks.feature` (+ new `module-13-integrations` directory)

**Scenario count:** 311 → 320 (+9 net new)
**Feature file count:** 87 → 89 (+2 new files)

---

### 2026-03-11 — Portal 2.0 Design System Integration

**What changed:** Completely rebuilt the Momnt charge workflow wireframe to match the Portal 2.0 Figma design system instead of the older Design Kit v2.

**Files modified:**
- `momnt-workflow/src/index.css` — New color variables, Nunito Sans font, Portal 2.0 typography scale
- `momnt-workflow/src/App.tsx` — Full rewrite with Sidebar, TopBar, PortalStepper, TrackerPills, orange form labels, green CTA buttons
- `momnt-workflow/tailwind.config.js` — Added success/warning color tokens

**New components added:**
- `Sidebar` — Dark navy icon-only sidebar matching Figma nav
- `TopBar` — Navy branded header bar
- `PortalStepper` — Green checkmark / navy active / gray pending stepper
- `TrackerPills` — 7-stage Apply→Fund pill bar
- `ReadinessCard` — Navy-branded status card

**Output:** `momnt-charge-workflow-v2.html` (320K bundled single HTML)

**Design tokens extracted from Figma nodes:**
- Typography: node 19:131
- Components: node 27:79
- Sidebar: node 8183:39145
- Progress Steps: node 4166:386206
- Tracker Pills: node 3035:34235
- Notifications: node 11:1717
- Portal screens: nodes 198:42813, 182:38909, 198:43799

---

### Pre-2026-03-11 — Initial Build (Prior Sessions)

**Momnt Charge Workflow:**
- Gap analysis comparing BRD coverage vs. actual Momnt charge request flow
- 10 new user stories written across Modules 03, 07, 09, 10, 12, 13
- Initial wireframe built with Design Kit v2 (Metropolis font, basic tokens)
- Output: `momnt-charge-workflow.html` (initial), `momnt-charge-workflow-react.html` (React version)

**BRD Development:**
- 13 modules structured and populated
- 368 total stories at peak (311+ currently in Gherkin feature files)
- Multi-lease support, maintenance batch funding, ad-hoc items added
- Module 1 overhauled for identity/access patterns
- White-label branding stories added to Module 12

---

## Conventions & Patterns Learned

1. **Module numbering:** Always zero-padded two digits (01–13)
2. **Feature file naming:** kebab-case, descriptive (e.g., `momnt-loan-flow.feature`)
3. **Section numbering in BRD docs:** Sections within modules use X.Y format; stories use X.Y.Z
4. **Folder naming:** `module-XX-descriptive-name` in features directory
5. **Lender-specific flows** get their own feature files (momnt-loan-flow, microf-lto-flow, breeze-lto-flow, thrive-loan-flow)
6. **Design artifacts** are bundled as single HTML files for easy sharing/review
7. **Orange (#e87722)** is used for form section labels — this is a distinct Portal 2.0 pattern
8. **Green buttons** are reserved for primary CTAs only; navy for secondary actions
9. **The tracker pill bar** (Apply→Fund) appears on all post-approval screens as a status indicator
10. **Figma file** `nO8BrnBe7Z0UhLd2s5FecK` is the canonical Portal 2.0 design source
11. **Mockup drafts** are saved to the `Mockup-Drafts-Go-Here/` folder and named using the format `Module.UserStory.Date.Version` (e.g., `07.US-7.4.1.2026-03-11.v1.html`)

---

## Open Items & Future Work

- [ ] Module 13 (Integrations) needs additional Gherkin feature files — currently has Momnt webhooks only; other integration sections still need conversion
- [ ] Additional wireframe screens for other workflows beyond Momnt charge
- [ ] Responsive/mobile adaptations of Portal 2.0 design
- [ ] Integration of actual Proxima Nova font (currently using Nunito Sans substitute)
- [ ] Lender-specific branding variations (white-label theming per partner)

---

*Last updated: 2026-03-11*
