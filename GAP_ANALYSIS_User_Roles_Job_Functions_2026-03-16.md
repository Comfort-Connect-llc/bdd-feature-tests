# Product Requirements Gap Analysis
## User Roles, Job Titles, Job Functions & Communication Segmentation

**Date:** March 16, 2026
**Reviewer:** Senior Product Manager — AI-Assisted Review
**Scope:** Stakeholder meeting concepts vs. existing BRD (13 modules, 90 feature files, 325 scenarios)
**Requirements Coverage Score:** 38/100
**Missing Story Severity:** HIGH — core organizational identity model is structurally underspecified

---

## 1. Existing BRD Stories That Match Meeting Concepts

| Story ID | Title | Coverage Level | Notes |
|----------|-------|---------------|-------|
| US-1.2.1 | Assign Role to User with Hierarchical Constraints | **Partial** | Covers access-control roles (Superadmin, Company Admin, Sales Rep, Service Tech, Manager, Standard User). Does NOT distinguish organizational function (Ownership, Marketing, Back Office) from permission role. Roles are purely permission scopes, not identity classifications. |
| US-1.2.2 | Configure Role Permissions | **Partial** | Defines permission entitlements per role. Does not support function-based permission layering or communication targeting. |
| US-1.2.5 | Configure User Provisioning Profile | **Partial** | Includes "Department / Job Function" as a required field during provisioning, referencing US-2.12.1. However, the field is a single select from a flat list — there is no separation of job title (free-form) from job function (standardized). Closest match to meeting intent, but structurally insufficient. |
| US-2.12.1 | Assign Department or Job Function to Dealer User | **Partial** | Allows Dealer Managers to assign department/job function from a system-defined list (Sales, Service, Technician, Management). Missing categories: Ownership Team, Admin Team, Marketing Team. Also conflates "department" and "job function" as a single field rather than separating them. |
| US-2.12.2 | Configure Available Departments and Job Functions | **Partial** | Allows Admins to add/rename/deactivate department entries. This is the closest mechanism to supporting standardized job functions, but the current list (Sales, Service, Technician, Management) doesn't cover the meeting's proposed taxonomy. No concept of "job title" as a separate free-form field exists. |
| US-12.3.4 | Configure Department-Based Rate Plan Access | **Partial** | Uses department for rate plan visibility (Sales + HVAC → promotional plans). This proves the platform already has a dependency on department for business logic, making the meeting's request for expanded functions even more critical. |
| US-10.5.1 | Configure Notification Preferences | **None** | Individual user channel preferences (email/SMS/in-app) only. No capability for role-based, function-based, or segment-based communication targeting. The meeting's requirement for differentiating owners vs. managers vs. back-office for targeted messaging is completely absent. |
| US-1.1.5 | Company Admin Invites Lower-Privilege User | **Partial** | Includes department in the invitation flow, but only as a single field. No job title capture. No function inference. |
| US-1.3.1 | Update User Profile | **None** | Profile updates limited to name, phone, email preferences. No job title, job function, or organizational identity fields. |
| US-2.10.2 | Company Groups (referenced) | **None** | Company groups are organizational hierarchies for dealers, not user-level function segmentation. |

---

## 2. Gap Analysis

### Gap 1: No Separation of Job Title vs. Job Function — SEVERITY: HIGH

**Current state:** The BRD has a single "department/job function" field (US-2.12.1) that serves as both organizational classification and platform-behavior driver. There is no free-form "job title" field anywhere in the user profile schema.

**Meeting requirement:** Two distinct fields — a free-form job title (what the person calls themselves) and a standardized job function dropdown (what the system uses for logic).

**Impact:** Without separation, the platform cannot support business cards that say "VP of Operations" while the system classifies the user as "Management Team" for rate plan access, communication targeting, and analytics. This is a data model gap that affects every module that touches user identity.

**Affected stories:** US-1.2.5, US-2.12.1, US-1.3.1, US-1.1.5

---

### Gap 2: Incomplete Job Function Taxonomy — SEVERITY: HIGH

**Current state:** The system-defined list includes only: Sales, Service, Technician, Management.

**Meeting requirement:** The proposed taxonomy includes: Ownership Team, Management Team, Admin Team, Sales Team, Service Team, Marketing Team.

**Missing categories:** Ownership Team, Admin Team (back office), Marketing Team. "Technician" from the current list does not map cleanly to the proposed taxonomy — it may fold into Service Team or remain as a sub-function.

**Impact:** Without Ownership and Admin Team as distinct functions, the platform cannot distinguish between an owner who needs strategic visibility and a back-office admin who processes paperwork. This directly blocks the communication segmentation requirement (Gap 4).

**Affected stories:** US-2.12.1, US-2.12.2, US-12.3.4

---

### Gap 3: No Automated Function Assignment / Inference — SEVERITY: MEDIUM

**Current state:** Department is manually selected by the Dealer Manager or Administrator during user provisioning (US-1.2.5) or profile editing (US-2.12.1). There is no concept of system-inferred function assignment.

**Meeting requirement:** The system may infer job function based on the user's role, onboarding inputs, or system permutations — reducing manual configuration burden and ensuring consistency.

**Impact:** This is a convenience and consistency enhancement. Without inference, every user requires manual function tagging, which creates data quality risk at scale (especially across hundreds of dealer organizations). However, this was noted as an "optional concept" in the meeting, so it should be deprioritized relative to Gaps 1, 2, and 4.

**Affected stories:** US-1.2.5, US-2.12.1

---

### Gap 4: No Communication Segmentation by Function — SEVERITY: HIGH

**Current state:** Communications (Module 10) are triggered by system events (status changes, signing requests, payments) and sent to "appropriate parties" — defined as homeowner and/or dealer. There is no mechanism to target communications by job function, organizational role, or segment within a dealer organization. US-10.5.1 handles individual channel preferences but not audience segmentation.

**Meeting requirement:** The organization needs to differentiate Owners, Managers, and Back-office Admins for targeted messaging. This implies both admin-configured targeting rules and function-based distribution lists.

**Impact:** This is a foundational capability gap. Without it, every dealer user at a company receives the same communications regardless of whether they're the business owner or a front-desk admin. This creates noise for non-relevant users and risks critical communications being lost in the flood.

**Affected stories:** US-10.1.1 through US-10.1.7, US-10.3.1, US-10.5.1

---

### Gap 5: No Marketing User Role or Portal Access Path — SEVERITY: LOW (Future)

**Current state:** No "Marketing" role or function exists in the BRD. The current role hierarchy (Superadmin → Company Admin → Sales Rep / Service Tech / Manager / Standard User) has no marketing persona. No marketing toolkit is referenced anywhere in the BRD.

**Meeting requirement:** Marketing users may require portal access in the future due to a planned marketing toolkit.

**Impact:** Low immediate impact but architecturally important. If the job function taxonomy is designed now without a Marketing Team category, it will need to be retrofitted later. Better to include it in the taxonomy from the start even if the marketing toolkit is not yet built.

**Affected stories:** US-1.2.1, US-2.12.2

---

### Gap 6: Ownership Not Distinct from Management — SEVERITY: MEDIUM

**Current state:** The "Management" department in US-2.12.1 conflates owners and managers. A business owner and a general manager would both be classified as "Management" today.

**Meeting requirement:** Ownership and Management are separate categories with different communication needs, visibility requirements, and strategic access patterns.

**Impact:** Owners typically need high-level financial summaries and business performance data. Managers need operational dashboards and team oversight. Without separation, the platform cannot tailor dashboards (US-1.4.2), communications, or analytics to these fundamentally different personas.

**Affected stories:** US-2.12.1, US-2.12.2, US-1.4.2

---

## 3. Proposed New User Stories

### US-1.3.5: Capture Job Title on User Profile

> As a **User**, I want to enter my job title as a free-form text field on my profile, so that my organizational identity is accurately represented in the platform without being constrained by the system's standardized function categories.

**Acceptance Criteria:**
- Given I am viewing my user profile
- When I edit the "Job Title" field
- Then I can enter free-form text up to 100 characters (e.g., "VP of Operations," "Lead Install Technician," "Owner & President")
- And the job title is displayed on my profile card, user management screens, and anywhere my name appears with contextual detail
- And the job title is searchable in user management and global search
- And the job title is included in user data exports (US-12.5)
- And the job title field is optional during registration but encouraged via a profile completeness indicator
- And the job title does not affect permissions, rate plan access, or any system behavior — it is purely identity/display

**Edge Cases:**
- Users may enter misleading titles (e.g., "CEO" when they are a Sales Rep). This is acceptable — the standardized Job Function (US-2.12.3) governs system behavior, not the free-form title.
- Offensive or inappropriate titles should be flagged by a content filter with admin notification.

**Dependencies:** US-1.3.1 (profile update flow), US-2.12.3 (standardized job function — proposed below)

**Priority:** P1 — Required for organizational identity distinction

---

### US-2.12.3: Standardized Job Function Taxonomy

> As an **Administrator**, I want to define a standardized set of job function categories that are distinct from access-control roles, so that the platform can classify users by organizational function for communication targeting, analytics segmentation, and operational workflow customization.

**Acceptance Criteria:**
- Given I am configuring the platform's job function taxonomy
- When I access the Job Function configuration screen
- Then the system ships with the following default functions: Ownership Team, Management Team, Admin Team, Sales Team, Service Team, Marketing Team
- And I can add custom job functions beyond the defaults (e.g., "Install Team," "Dispatch Team") with a name and optional description
- And I can deactivate a job function (preventing new assignments) without removing it from users currently assigned
- And I can reorder job functions for display priority
- And each job function is a platform-wide classification (not per-dealer) to ensure consistency across organizations
- And the job function taxonomy is versioned — changes are audit-logged with the actor, timestamp, and change description
- And the old "department/job function" field from US-2.12.1 is migrated to this new taxonomy with a mapping: Sales → Sales Team, Service → Service Team, Technician → Service Team, Management → Management Team

**Edge Cases:**
- Migration of existing users: All users currently tagged with the old department values must be mapped to the new taxonomy. A migration report showing before/after assignments should be generated for admin review.
- Organizations that used "Management" for owners will need manual reclassification to "Ownership Team" — a bulk reassignment tool should be provided.

**Dependencies:** US-2.12.1 (existing department field — to be superseded), US-2.12.2 (admin configuration — to be enhanced)

**Priority:** P0 — Foundational. All other meeting requirements depend on this taxonomy existing.

---

### US-2.12.4: Assign Job Function Independent of Access-Control Role

> As a **Dealer Manager or Administrator**, I want to assign a standardized job function to a user independently of their access-control role, so that a user's organizational identity (what they do) is decoupled from their platform permissions (what they can access).

**Acceptance Criteria:**
- Given I am provisioning or editing a user
- When I configure their profile
- Then I see two distinct fields: "Role" (access-control: Admin, Sales Rep, Manager, etc.) and "Job Function" (organizational: Ownership Team, Management Team, Sales Team, etc.)
- And the Role field governs permissions, feature access, and partner visibility (per existing US-1.2.1)
- And the Job Function field governs communication targeting, analytics segmentation, dashboard defaults, and rate plan access (replacing the old department field in US-12.3.4)
- And there are no hard constraints between Role and Job Function — a user with a "Sales Rep" role can have a "Management Team" function if the dealer's org structure requires it
- And both fields are required during user provisioning (US-1.2.5)
- And changes to either field are independently audit-logged

**Edge Cases:**
- A small dealer where the owner also does sales: Role = Sales Rep (they need to create applications), Function = Ownership Team (they need owner-level communications and dashboards).
- A large dealer where an admin has manager-level permissions: Role = Manager (they approve applications), Function = Admin Team (they handle back-office operations).

**Dependencies:** US-1.2.1, US-1.2.5, US-2.12.3

**Priority:** P0 — Required to decouple identity from access control

---

### US-2.12.5: Infer Job Function from Role and Onboarding Context (Optional)

> As the **System**, I want to suggest a default job function when a new user is being provisioned, based on their assigned role and onboarding context, so that administrators can accept the suggestion or override it — reducing manual configuration effort and improving data consistency.

**Acceptance Criteria:**
- Given an administrator is provisioning a new user and has selected an access-control role
- When the role is selected
- Then the system suggests a default job function based on configurable mapping rules (e.g., "Sales Rep" role → "Sales Team" function; "Service Tech" role → "Service Team" function)
- And the suggestion is displayed as a pre-selected value that the administrator can accept or change
- And if the administrator changes the function, the system records that it was manually overridden (for analytics on inference accuracy)
- And inference mapping rules are configurable by Superadmins in the administration module
- And the inference is a suggestion only — it never auto-assigns without administrator confirmation
- And the system tracks inference acceptance rate per mapping rule to help Superadmins optimize the rules over time

**Edge Cases:**
- Roles that don't map cleanly (e.g., "Standard User" has no obvious function). The system should leave the function field blank with a prompt to select manually.
- New custom functions added by admins won't have inference rules until explicitly configured.

**Dependencies:** US-2.12.3, US-2.12.4, US-1.2.5

**Priority:** P2 — Nice-to-have. Manual assignment is acceptable for initial release.

---

### US-10.6.1: Configure Communication Targeting by Job Function

> As an **Administrator**, I want to configure which job functions receive specific types of platform communications, so that I can ensure owners get strategic updates, managers get operational notifications, and back-office admins get administrative alerts without overwhelming any group with irrelevant messages.

**Acceptance Criteria:**
- Given I am configuring communication targeting rules
- When I access the Communication Targeting configuration screen
- Then I see a matrix of notification types (rows) × job functions (columns)
- And I can enable or disable each notification type for each job function
- And default targeting rules are pre-configured: funding notifications → Ownership Team + Management Team; application status → Sales Team + Service Team; compliance alerts → Admin Team + Management Team; system announcements → all functions
- And I can create custom targeting rules for new notification types
- And targeting rules can be overridden at the organization level by Company Admins (to narrow, but not expand beyond, the global configuration)
- And individual users can still configure their own channel preferences (email/SMS/in-app per US-10.5.1) within the scope of what their function receives
- And a "Preview Recipients" function shows which users in a given organization would receive a specific notification type based on current targeting rules

**Edge Cases:**
- Users with no job function assigned: These users receive all communications (fail-open) until a function is assigned, to avoid silently dropping critical notifications.
- A user changes job function: Their communication targeting immediately shifts to the new function's rules. Any in-flight notifications already queued are still delivered.

**Dependencies:** US-2.12.3, US-2.12.4, US-10.5.1

**Priority:** P1 — Primary business driver for the meeting's communication segmentation requirement

---

### US-10.6.2: Send Targeted Communication to Specific Job Function

> As an **Administrator or System**, I want to send a targeted communication (email, in-app notification, or SMS) to all users matching a specific job function across one or more organizations, so that strategic, operational, or administrative messages reach the right audience.

**Acceptance Criteria:**
- Given I am composing a targeted communication
- When I select the target audience
- Then I can select one or more job functions (e.g., "Ownership Team" + "Management Team")
- And I can further filter by organization, company group, or partner enrollment
- And I see a recipient count before sending
- And I can preview the message as it will appear to recipients
- And sent targeted communications are logged with: sender, target functions, recipient count, timestamp, and delivery status summary
- And bulk communications are rate-limited to prevent system overload (configurable by Superadmin)

**Dependencies:** US-2.12.3, US-10.6.1

**Priority:** P1

---

### US-1.2.6: Marketing User Portal Access (Future-Ready)

> As a **Company Admin**, I want to invite users with a "Marketing Team" job function and grant them access to marketing-specific portal features, so that when the marketing toolkit is released, marketing users already have appropriately scoped accounts.

**Acceptance Criteria:**
- Given the Marketing Team job function exists in the taxonomy (US-2.12.3)
- When I provision a user with the Marketing Team function
- Then I can assign them an access-control role (Standard User or a future "Marketing" role)
- And their portal dashboard defaults to marketing-relevant widgets (when available) or a generic dashboard
- And they receive marketing-relevant communications per US-10.6.1 targeting rules
- And if the marketing toolkit is not yet released, the user sees a "Coming Soon" placeholder in the marketing section of the portal
- And the marketing toolkit release can be enabled via feature flag without reprovisioning users

**Edge Cases:**
- Pre-provisioned marketing users should not count against licensing tiers (if applicable) until the marketing toolkit is GA.

**Dependencies:** US-2.12.3, US-2.12.4, US-1.4.2 (dashboard customization)

**Priority:** P3 — Future-ready scaffolding. Low effort now, high value when marketing toolkit ships.

---

### US-12.8.1: User Analytics by Job Function

> As an **Administrator**, I want to view platform usage analytics segmented by job function, so that I can understand adoption patterns, identify underserved functions, and optimize the platform experience for each organizational persona.

**Acceptance Criteria:**
- Given the analytics dashboard includes a job function dimension
- When I view user analytics
- Then I can filter and group by job function (Ownership, Management, Admin, Sales, Service, Marketing)
- And I can see metrics per function: active users, login frequency, feature usage, application volume, average session duration
- And I can compare functions side-by-side
- And I can export the analytics data (CSV/JSON per US-12.5)
- And the function dimension is available in all existing reports that include user data

**Dependencies:** US-2.12.3, US-12.5 (data export)

**Priority:** P2

---

## 4. UX / Data Model Implications

### 4.1 Data Model Changes

**User Profile Schema — New Fields:**

| Field | Type | Required | Source |
|-------|------|----------|--------|
| `job_title` | VARCHAR(100), free-form | Optional (encouraged) | User self-entry |
| `job_function_id` | FK → `job_functions` table | Required | Admin/Manager assignment |

**New Table: `job_functions`**

| Column | Type | Notes |
|--------|------|-------|
| `id` | UUID | Primary key |
| `name` | VARCHAR(50) | e.g., "Ownership Team" |
| `description` | TEXT | Optional |
| `display_order` | INT | For UI ordering |
| `is_active` | BOOLEAN | Soft-delete |
| `is_system_default` | BOOLEAN | Prevents deletion of the 6 core functions |
| `created_at` | TIMESTAMP | |
| `updated_at` | TIMESTAMP | |

**New Table: `role_function_inference_rules`** (for US-2.12.5)

| Column | Type | Notes |
|--------|------|-------|
| `id` | UUID | Primary key |
| `role_id` | FK → roles | Source role |
| `suggested_function_id` | FK → job_functions | Suggested function |
| `acceptance_count` | INT | Tracking |
| `override_count` | INT | Tracking |

**New Table: `communication_targeting_rules`** (for US-10.6.1)

| Column | Type | Notes |
|--------|------|-------|
| `id` | UUID | Primary key |
| `notification_type` | ENUM | Application status, funding, compliance, etc. |
| `job_function_id` | FK → job_functions | Target function |
| `is_enabled` | BOOLEAN | |
| `org_override` | FK → organizations, nullable | Org-level override |

**Migration Required:**
- Existing `department` field on user profiles must be mapped to new `job_function_id`: Sales → Sales Team, Service → Service Team, Technician → Service Team, Management → Management Team
- The old `department` column should be retained as `legacy_department` for 90 days post-migration, then dropped

### 4.2 User Onboarding Flow Changes

The user provisioning screen (US-1.2.5) currently has a single "Department / Job Function" dropdown. This must be redesigned to:

1. **Role** dropdown (unchanged — access-control role)
2. **Job Function** dropdown (new — standardized taxonomy from US-2.12.3, with inference suggestion per US-2.12.5)
3. **Job Title** free-form text input (new — optional, displayed on profile)

The invitation flow (US-1.1.5) should also be updated so that "department/job function assignment" in the acceptance criteria is split into the new two-field model.

### 4.3 Role Assignment UI Changes

The role assignment screen needs a visual separation between "Access & Permissions" (the role) and "Organizational Identity" (the job function + job title). These are currently conflated in the UI. Recommended pattern: two-panel layout or collapsible sections with clear headers.

### 4.4 Admin Configuration Tools

A new "Job Function Management" screen is required under Module 12 (Administration), supporting:
- CRUD for job function entries
- Reordering
- Inference rule configuration
- Communication targeting matrix
- Migration/bulk reassignment tool for initial rollout

### 4.5 Permission System

No permission system changes are needed for the core implementation. Job function is explicitly NOT a permission construct — it is an identity and targeting construct. The existing role-based permission system (US-1.2.1, US-1.2.2) remains intact. However, the rate plan access configuration (US-12.3.4) needs to be updated to reference job functions from the new taxonomy rather than the old department field.

---

## 5. Product Recommendations

### 5.1 Job Title and Job Function Must Be Separate Fields

**Recommendation: YES — implement as two distinct fields.**

Rationale: Job title is a self-identified, organizational label that varies wildly across companies ("Comfort Advisor" vs. "Sales Rep" vs. "Inside Sales Manager"). Job function is a platform-defined classification that drives system behavior. Conflating them means either the system list becomes unmanageably long (trying to cover every title variant) or users feel misrepresented by a rigid dropdown. Two fields solve both problems. Job title lets users express their identity. Job function lets the platform operate consistently.

### 5.2 Job Function Should Be Admin-Selected with System Suggestion

**Recommendation: Admin/Manager selects, with optional system inference.**

Rationale: Fully automated inference is risky because dealer organizations vary widely in structure. A 3-person shop might have an owner who does sales, service, and admin. A 200-person company might have clean departmental lines. The system should suggest a default based on the access-control role (Sales Rep → Sales Team) but always allow the provisioner to override. Track acceptance rates so the inference improves over time. Don't make inference mandatory — it should be a convenience, not a constraint.

### 5.3 Ownership Must Be Separate from Management

**Recommendation: YES — separate them.**

Rationale: In home comfort dealer organizations, ownership and management are fundamentally different personas with different information needs. Owners care about P&L visibility, portfolio performance, and strategic reports. Managers care about team productivity, pipeline status, and operational compliance. Additionally, the communication segmentation requirement (the primary business driver from the meeting) specifically calls out the need to differentiate owners from managers for targeted messaging. Combining them under "Management" defeats the purpose.

### 5.4 How These Functions Should Affect Platform Behavior

**Permissions:** Job function should NOT affect permissions. Permissions remain governed by the access-control role (US-1.2.1). This is critical — otherwise you create a confusing two-axis permission model that's hard to debug and audit. Keep it simple: role = what you can do, function = who you are.

**Communications:** Job function should be the PRIMARY targeting dimension for non-transactional communications (announcements, reports, strategic updates). Transactional communications (application status, payment reminders) should continue to target based on involvement in the transaction rather than function. The communication targeting matrix (US-10.6.1) gives administrators full control.

**Analytics Segmentation:** Job function should be available as a first-class dimension in all analytics and reporting. This enables questions like "How many applications are Sales Team users creating vs. Service Team users?" and "What's the average login frequency for Ownership Team vs. Admin Team?"

**Dashboard Defaults:** Each job function should have a default dashboard layout (extending US-1.4.2) that surfaces the most relevant widgets for that persona. Owners see portfolio summaries. Sales sees pipeline. Service sees installation queue. Admins see billing and compliance.

### 5.5 Recommended Roadmap Priority

| Phase | Stories | Timeline Estimate | Rationale |
|-------|---------|-------------------|-----------|
| **Phase 1: Foundation** | US-2.12.3 (taxonomy), US-2.12.4 (decouple function from role), US-1.3.5 (job title field) | Sprint 1-2 | Data model and schema changes must land first. All other capabilities depend on this. |
| **Phase 2: Communication Targeting** | US-10.6.1 (targeting config), US-10.6.2 (send targeted comms) | Sprint 3-4 | Primary business value driver from the meeting. |
| **Phase 3: Intelligence & Analytics** | US-2.12.5 (inference), US-12.8.1 (analytics by function) | Sprint 5-6 | Optimization layer once the foundation is stable. |
| **Phase 4: Future Access** | US-1.2.6 (marketing user scaffolding) | Sprint 7+ or when marketing toolkit roadmap firms up | Low effort now to avoid retrofitting later. |

### 5.6 Risks and Scalability Considerations

**Data migration risk:** Approximately 325 scenarios reference roles and departments. The migration from the old single-field model to the new two-field model must be carefully coordinated. Recommend a feature-flagged rollout where both models coexist temporarily.

**Taxonomy bloat:** If admins can add custom job functions without guardrails, the taxonomy will fragment across organizations. Recommend a "system defaults + admin extras" model where the 6 core functions are immutable and custom additions are organization-scoped rather than platform-wide.

**Backward compatibility:** US-12.3.4 (department-based rate plan access) currently depends on the old department field. This integration must be updated to reference the new job function taxonomy before the old field is deprecated. This is a breaking change that needs coordinated release planning.

**Reporting retroactivity:** Historical data won't have job functions assigned. Recommend backfilling based on the role → function inference mapping, clearly marked as "inferred (historical)" in reports to distinguish from explicitly assigned values.

---

## Appendix: Requirements Coverage Summary

| Meeting Concept | Coverage | Gap Severity |
|----------------|----------|-------------|
| 1. Improved User Role Identification | Partial (38%) | HIGH |
| 2. Job Title vs Job Function | None (0%) | HIGH |
| 3. Standardized Job Function Categories | Partial (30%) — 4 of 6 categories exist but as a flat "department" field | HIGH |
| 4. Automated Function Assignment | None (0%) | MEDIUM |
| 5. Improved Communication Segmentation | None (0%) | HIGH |
| 6. Future Marketing User Access | None (0%) | LOW |

**Overall Requirements Coverage: 38/100**

The BRD has a foundational awareness of user classification (departments exist, roles exist, provisioning captures some of this) but structurally conflates identity with access control. The meeting requirements demand a clean separation that does not exist today. This is not a feature gap — it is an architectural gap in the identity model that will affect multiple modules when addressed.

---

*Generated: March 16, 2026*
