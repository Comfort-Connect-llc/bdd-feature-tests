---
figma:
  file: "https://www.figma.com/file/FIGMA_FILE_ID/Comfort-Connect-Platform"
  page: "Module 01 - Identity & Access"
  frames:
    - id: "overview"
      name: "Module 01 - Identity & Access Overview"
      url: "TODO"
---

# Module 1: Identity & Access
## User & Profile Management

**Version:** 1.0  
**Date:** February 12, 2026  
**Stories:** 21

---

## Overview

Foundation module for all user interactions. Manages authentication, authorization, roles, permissions, and user profiles across all personas (Dealers, Homeowners, Internal Staff).

**Key Capabilities:**
- Hierarchical invite-only user registration (Superadmin → Company Admin → Standard User)
- Authentication via OTP and magic link
- Role-based access control with hierarchical privilege enforcement
- Invitation lifecycle management (issuance, expiration, re-issuance, revocation)
- Unified user provisioning profile (role, department, partner access, training, notifications)
- Strict cross-organization tenant isolation
- User and organization deactivation with cascading impact handling
- User impersonation for support
- Immutable identity lifecycle audit logging
- Global search across platform entities
- Customizable dashboards
- Session state persistence

---

## 1.1 User Registration & Authentication

**US-1.1.1: Invite Customer Company Admin**
> As a **Superadmin**, I want to invite a Customer Company Admin to the platform by issuing a scoped invitation, so that the designated administrator can onboard their organization's users within the boundaries I define.

**Acceptance Criteria:**
- Given I am authenticated as a Superadmin
- When I create an invitation for a new Customer Company Admin
- Then I must provide: recipient email address, organization (company) assignment, and the maximum role scope the admin is authorized to grant within their org
- And the system generates a unique, cryptographically signed invitation token bound to the recipient email, assigned organization, and defined role scope
- And an invitation email is sent containing a secure, single-use registration link
- And the invitation record is persisted with status "Pending," inviter ID, timestamp, org ID, and role scope ceiling
- And the invitation does not grant any platform access until the recipient completes the acceptance flow (see US-1.1.6)
- And if the recipient email already belongs to an active account, the invitation is rejected with an error ("User already exists in this organization")
- And if the recipient email belongs to a user in a different organization, the invitation is rejected to enforce tenant isolation

**Security Considerations:**
- Invitation token must be cryptographically signed and non-guessable (minimum 256-bit entropy)
- Token is bound to recipient email — acceptance from a different email must be rejected
- Privilege scope is set at invitation time and cannot be escalated by the invited user
- All invitation actions (create, send, expire, accept, revoke) are audit-logged with actor, timestamp, and target
- If the inviting Superadmin's access is revoked before acceptance, the pending invitation must be automatically invalidated

---

**US-1.1.2: Authenticate via OTP**
> As a **User**, I want to authenticate using a one-time password, so that I can securely access my account.

**Acceptance Criteria:**
- Given I am attempting to log in
- When I request an OTP
- Then I receive a code via SMS or email
- And when I enter the correct code, I am granted access

---

**US-1.1.3: Register Homeowner Account**
> As a **Homeowner**, I want to create an account, so that I can view my financing details and manage my account.

**Acceptance Criteria:**
- Given I have an active financing agreement
- When I register using my email and account information
- Then my account is created
- And I can access my homeowner portal

---

**US-1.1.4: Access Portal via Magic Link**
> As a **Homeowner**, I want to receive a magic link via email or SMS to access my portal, so that I can securely log in without needing to remember a password.

**Acceptance Criteria:**
- Given I am a registered homeowner and I have forgotten my password or prefer passwordless access
- When I request a magic link from the login page
- Then I receive a unique, time-limited link via my registered email or phone number
- And when I click the link within the expiration window, I am authenticated and directed to my homeowner portal
- And the magic link expires after a single use or after the configured time limit
- And if the link has expired or already been used, I am prompted to request a new one

---

**US-1.1.5: Company Admin Invites Lower-Privilege User**
> As a **Customer Company Admin**, I want to invite users to my organization and assign them a role within my authorized scope, so that my team members can access the platform with appropriate permissions without requiring Superadmin involvement.

**Acceptance Criteria:**
- Given I am authenticated as a Customer Company Admin with a defined role scope ceiling
- When I create an invitation for a new user within my organization
- Then I must provide: recipient email address, assigned role (which must be strictly lower than or equal to my permitted scope), and department/job function assignment
- And the system validates that the selected role does not exceed my role scope ceiling before generating the invitation
- And if I attempt to assign a role equal to or higher than my own privilege level, the system rejects the request with an error ("Role exceeds your authorized scope")
- And if I attempt to invite a user to an organization other than my own, the request is rejected ("Cross-organization invitation not permitted")
- And the invitation email is sent with a secure, single-use registration link bound to my organization's tenant
- And the invitation record is persisted with status "Pending," inviter ID (my user ID), timestamp, org ID, assigned role, and department
- And I can view all pending, accepted, and expired invitations I have issued

**Security Considerations:**
- Role scope ceiling is enforced server-side — client-side role dropdowns are filtered but the API independently validates
- Invitation is tenant-scoped — the token embeds org ID and the acceptance flow must verify org match
- If the inviting Company Admin's access is revoked or downgraded before acceptance, all their pending invitations are automatically invalidated
- No lateral privilege creation — a Company Admin cannot create another Company Admin unless explicitly authorized in their scope ceiling

---

**US-1.1.6: Accept Invitation and Complete Registration**
> As an **Invited User** (Company Admin or Standard User), I want to accept my invitation by verifying my email and creating my credentials, so that I can securely access the platform with my assigned role.

**Acceptance Criteria:**
- Given I have received an invitation email with a registration link
- When I click the registration link
- Then the system validates the invitation token (signature integrity, expiration status, single-use status, and that the inviting user's account is still active)
- And if the token is valid, I am presented with a registration form pre-populated with my email (read-only) and organization name (read-only)
- And I must provide: first name, last name, phone number, and create a password meeting complexity requirements (minimum 12 characters, mixed case, number, special character)
- And the system sends a verification code to my email to confirm ownership
- And upon entering the correct verification code, my account is created with the role, department, partner access, and organization assigned in the invitation
- And the invitation token is marked as "Accepted" and cannot be reused
- And I am redirected to the platform login screen with a confirmation message
- And if the token is expired, I see a message ("This invitation has expired. Please contact your administrator to request a new one.") with no registration form displayed
- And if the token has already been used, I see a message ("This invitation has already been accepted.") with a link to the login page
- And if the inviting user's account was revoked after the invitation was sent, I see a message ("This invitation is no longer valid. Please contact your organization's administrator.")

**Security Considerations:**
- Token validation must occur server-side on every step (page load, form submission) — not just on initial click
- Email verification code expires after 10 minutes and allows a maximum of 5 attempts before locking
- Password is hashed using bcrypt (or equivalent) before storage — never stored in plaintext
- Registration completion triggers an audit log entry with: new user ID, inviter ID, org ID, assigned role, and timestamp
- Rate-limit registration attempts per token to prevent brute-force attacks on the verification code

---

**US-1.1.7: Prevent Unauthorized Signup Attempts**
> As the **System**, I want to reject any attempt to create an account without a valid invitation token, so that platform access is strictly controlled through the hierarchical invitation chain and no unauthorized users can gain access.

**Acceptance Criteria:**
- Given the platform does not support open/public self-registration
- When a user navigates to the registration URL without a valid invitation token (missing, malformed, or tampered)
- Then the system displays a generic error ("Registration requires an invitation. Please contact your organization's administrator.") and does not render the registration form
- And if a user submits a registration API request directly (bypassing the UI) without a valid token, the API returns HTTP 403 with no account created
- And if a user submits a registration request with a token belonging to a different email, the API returns HTTP 403 ("Token does not match the provided email address")
- And if a user attempts to register with a revoked or invalidated token, the request is rejected
- And all rejected registration attempts are logged with: IP address, attempted email, token (if provided), rejection reason, and timestamp
- And after 10 failed registration attempts from the same IP within a 1-hour window, the IP is temporarily blocked from the registration endpoint

**Security Considerations:**
- Registration endpoint must not leak information about valid vs. invalid tokens beyond the generic error message
- Token validation errors should use constant-time comparison to prevent timing attacks
- No enumeration — the system must not confirm whether an email address exists in the platform
- Failed attempt logs are available to Superadmins in the security audit dashboard

---

**US-1.1.8: Manage Invite Expiration and Re-Issuance**
> As an **Administrator** (Superadmin or Company Admin), I want invitations to automatically expire after a configurable period and the ability to re-issue expired invitations, so that stale invitations do not become a security liability and users who missed the window can still be onboarded.

**Acceptance Criteria:**
- Given an invitation has been issued
- When the configured expiration period elapses (default: 72 hours, configurable by Superadmin between 24–168 hours)
- Then the invitation status automatically changes from "Pending" to "Expired"
- And the associated token is invalidated and cannot be used for registration
- And the inviter is notified (in-app notification) that their invitation to [email] has expired
- When I choose to re-issue an expired invitation
- Then the original invitation record is marked "Superseded" and a new invitation is created with a fresh token, new expiration window, and the same role/org/department configuration
- And the new invitation email is sent to the same recipient
- And only the inviter or a Superadmin can re-issue the invitation
- And a maximum of 3 re-issuances are allowed per recipient email per 30-day window (to prevent invitation spam)
- And I can view the full invitation history for any recipient (original + all re-issuances) with statuses and timestamps

**Security Considerations:**
- Expired tokens must be irreversibly invalidated — they cannot be reactivated
- Re-issued invitations generate entirely new tokens; the old token cannot be recycled
- Expiration check runs server-side on both a scheduled job (hourly) and on-demand when a token is presented
- Superadmin can override the default expiration window per organization

---

## 1.2 Role & Permission Management

**US-1.2.1: Assign Role to User with Hierarchical Constraints**
> As an **Administrator** (Superadmin or Company Admin), I want to assign or change a user's role with enforcement of the hierarchical trust model, so that no user can be granted privileges that exceed their inviter's authorized scope and privilege escalation is structurally impossible.

**Acceptance Criteria:**
- Given I am assigning or changing a role for a user within my organization
- When I select a role for the user
- Then the system validates that the selected role is strictly lower than my own privilege level (or within my defined role scope ceiling if set by a Superadmin)
- And if the selected role would exceed my scope ceiling, the request is rejected with an error ("Role exceeds your authorized scope — maximum assignable role: [ceiling role name]")
- And a Superadmin can assign any role including Customer Company Admin, but cannot create another Superadmin through this flow
- And a Customer Company Admin can assign roles from their permitted set (e.g., Sales Rep, Service Tech, Manager) but cannot assign Customer Company Admin or Superadmin
- And when a role is assigned, the user immediately inherits all permissions associated with that role
- And when a role is changed, the user's previous role permissions are revoked and replaced (not merged) with the new role's permissions
- And the role change is recorded in the audit log with: actor ID, target user ID, previous role, new role, timestamp, and justification (optional text field)
- And if a Company Admin's own role scope is downgraded by a Superadmin, any users they previously assigned at the now-exceeded level are flagged for review (not auto-demoted) with a notification sent to the Superadmin

**Security Considerations:**
- Role hierarchy is enforced server-side on every assignment API call — client-side dropdown filtering is cosmetic only
- No lateral privilege creation — users cannot create peers at their own level unless their scope ceiling explicitly allows it
- No upward privilege assignment — the system rejects any attempt to assign a role higher than the actor's own level regardless of API manipulation
- Role changes for Company Admins require Superadmin authorization
- Concurrent role-change requests for the same user must be serialized to prevent race conditions

---

**US-1.2.2: Configure Role Permissions**
> As an **Administrator**, I want to configure what permissions are associated with each role, so that access control is properly managed.

**Acceptance Criteria:**
- Given a defined role
- When I add or remove entitlements from the role
- Then all users with that role immediately reflect the permission changes

---

**US-1.2.3: Manage Partner Access for User**
> As an **Administrator**, I want to control which financing partners a user can access, so that they only see relevant options.

**Acceptance Criteria:**
- Given a dealer user
- When I configure their partner access
- Then the user only sees applications and options for their enabled partners

---

**US-1.2.4: Enforce Cross-Organization Access Boundaries**
> As the **System**, I want to enforce strict tenant isolation so that no user — regardless of role — can view, modify, or interact with data belonging to a different organization, so that customer data confidentiality and regulatory compliance are maintained.

**Acceptance Criteria:**
- Given a user is authenticated and belongs to Organization A
- When they make any API request or navigate to any portal screen
- Then the system appends the user's org ID as a mandatory filter on every data query — no opt-out, no override
- And if a user attempts to access a resource belonging to Organization B (via URL manipulation, API call, or any other method), the system returns HTTP 403 ("Access denied") and logs the attempt
- And Superadmins can access data across organizations for support purposes, but all cross-org access by Superadmins is logged with reason codes
- And database queries use row-level security or equivalent tenant-scoping so that even raw database access cannot leak cross-tenant data
- And API responses never include org IDs, user IDs, or resource IDs from other organizations — even in error messages
- And search results, reports, and exports are scoped to the user's organization without exception
- And impersonation sessions (US-1.3.2) inherit the impersonated user's org scope — the impersonator cannot access data outside the impersonated user's org during the session

**Security Considerations:**
- Tenant isolation must be enforced at the data layer (not just the application layer) to prevent bypass through SQL injection or API manipulation
- Cross-org access attempts must trigger a security alert to the Superadmin dashboard after 3 occurrences from the same user within 24 hours
- Session tokens embed org ID and the server validates org scope on every request — token tampering results in immediate session invalidation
- Shared infrastructure (caches, queues, search indexes) must maintain tenant boundaries

---

**US-1.2.5: Configure User Provisioning Profile**
> As an **Administrator** (Superadmin or Company Admin), I want a unified user provisioning screen that captures all required attributes when setting up a new user, so that every user is fully configured with the correct role, access, department, partner visibility, and training requirements from day one — eliminating the need to configure settings across multiple screens.

**Acceptance Criteria:**
- Given I am provisioning a new user (either during invitation creation or after invite acceptance)
- When I access the user provisioning profile
- Then I must configure the following required fields before the user is activated:
  - **Role assignment** — selected from roles within my authorized scope (enforced per US-1.2.1)
  - **Department / Job Function** — selected from the system-defined list (Sales, Service, Technician, Management, etc. per US-2.12.1)
  - **Organization assignment** — auto-populated based on inviter's org (read-only for Company Admins; selectable for Superadmins)
  - **Company Group assignment** — if the organization uses company groups (per US-2.10.2), select the applicable group which determines inherited configuration defaults
- And I can configure the following optional fields:
  - **Partner access** — which financing partners (Premier, Momnt, Breeze, Microf, Thrive) the user can access (defaults to organization-level settings per US-1.2.3)
  - **Rate plan visibility overrides** — department–trade plan access if different from the default configuration (per US-5.2.4 / US-12.3.4)
  - **Training course enrollment** — auto-enroll the user in required courses based on their role and partner access (per US-2.7.1), with the ability to add additional courses
  - **Notification preferences** — defaults to all channels enabled (email, SMS, in-app per US-10.5.1); can be pre-configured
  - **Dashboard layout** — defaults to the role-based default dashboard (per US-1.4.2); can be customized
- And the system validates all fields against the hierarchical trust model before saving (no privilege escalation, no cross-org assignment, no scope ceiling violation)
- And a summary confirmation screen displays all configured attributes before activation, requiring the administrator to explicitly confirm
- And upon confirmation, the user's profile is fully active with all attributes applied simultaneously (no partial activation state)
- And the provisioning event is recorded in the audit log with all configured attribute values

**Security Considerations:**
- All attributes are validated server-side against the inviter's scope ceiling and org boundaries
- Partner access configuration cannot exceed what the organization has enabled (per US-12.1.1)
- Company Group assignment inherits group-level defaults which can be narrowed but not expanded by the provisioner
- The provisioning profile is accessible only to users with the "manage_users" permission within their org

---

## 1.3 Profile Management

**US-1.3.1: Update User Profile**
> As a **User**, I want to update my profile information, so that my contact details remain current.

**Acceptance Criteria:**
- Given I am logged in
- When I update my profile (name, phone, email preferences)
- Then my changes are saved

---

**US-1.3.2: Impersonate User for Support**
> As a **Customer Service Representative**, I want to view the platform as a specific user sees it, so that I can assist them.

**Acceptance Criteria:**
- Given I have impersonation privileges
- When I impersonate a user
- Then I see the platform exactly as they see it
- And my actions are logged as impersonation

---

**US-1.3.3: Revoke User Access with Cascading Impact**
> As an **Administrator** (Superadmin or Company Admin), I want to revoke a user's access with clear handling of downstream effects — including invalidating their active sessions, pending invitations they issued, and tasks assigned to them — so that deprovisioning is immediate, complete, and does not leave orphaned access or dangling responsibilities.

**Acceptance Criteria:**
- Given an active user account that I have authority to deactivate (within my org for Company Admins, any org for Superadmins)
- When I revoke the user's access
- Then the user's account status changes to "Deactivated" immediately
- And all active sessions for that user are terminated within 60 seconds (forced logout across all devices)
- And all pending invitations issued by that user are automatically invalidated with status "Inviter Revoked"
- And recipients of those invalidated invitations who attempt to register receive the message: "This invitation is no longer valid. Please contact your organization's administrator."
- And all open tasks assigned to the deactivated user are flagged as "Unassigned — Owner Deactivated" and surfaced to the user's manager or Company Admin for reassignment
- And the deactivated user's data, historical activity, notes, and audit trail are preserved and remain accessible to authorized administrators
- And the deactivated user cannot log in, reset their password, or use any existing magic links or OTP codes
- And a Company Admin can only revoke users with roles lower than their own — attempting to revoke a peer or higher-role user returns an error ("Insufficient privileges to deactivate this user")
- And a Superadmin can revoke any user including Company Admins
- And the revocation event is recorded in the audit log with: actor ID, target user ID, target's role, reason (required text field), timestamp, and count of cascading actions taken (invalidated invitations, reassigned tasks)
- And an optional "Reactivation" flow exists where a Superadmin (or Company Admin for lower-privilege users) can restore a deactivated account, which re-enables login but does not restore previously invalidated invitations

**Security Considerations:**
- Session termination must be enforced at the token/session layer — simply marking the account as inactive is insufficient if session tokens remain valid
- Cascading invalidation of invitations must be atomic with the revocation — no window where a revoked user's invitation can still be accepted
- Reactivation requires the same level of authority as the original deactivation (or higher)
- Deactivated accounts cannot be used for API access, webhook authentication, or system integrations

---

**US-1.3.4: Deactivate Organization**
> As a **Superadmin**, I want to deactivate an entire organization, so that all users, invitations, and active sessions belonging to that organization are immediately terminated when the business relationship ends, the organization is acquired, or a security event requires immediate isolation.

**Acceptance Criteria:**
- Given I am authenticated as a Superadmin
- When I deactivate an organization
- Then I must provide a reason (required: "Contract Termination," "Security Event," "Acquisition," or free-text)
- And all user accounts within the organization are immediately set to "Deactivated — Org Suspended"
- And all active sessions for all users in the organization are terminated within 60 seconds
- And all pending invitations (issued by any user in the org, or issued to the org by Superadmins) are invalidated
- And the organization no longer appears as an active tenant in the system — its data remains stored but is inaccessible through the portal
- And a Superadmin can still access the org's data through a dedicated "Deactivated Organizations" administrative view for audit, legal, or data export purposes
- And no new users can be invited to or registered within the deactivated organization
- And no new applications, quotes, or transactions can be created under the deactivated org
- And existing in-flight applications and funded accounts continue to be serviced through internal admin tools (not the dealer portal)
- And the deactivation event is recorded in the audit log with: Superadmin ID, org ID, reason, timestamp, and count of affected users/sessions/invitations
- And a "Reactivation" flow requires Superadmin action and sends re-activation emails to the org's Company Admins (their previous sessions and invitations are not restored — they must log in fresh)

**Security Considerations:**
- Org deactivation must cascade atomically — there must be no window where some users are deactivated and others retain access
- Data retention policies apply to deactivated orgs based on contractual and regulatory requirements
- Deactivated org data must remain encrypted at rest and access-logged when viewed by Superadmins
- Reactivation must regenerate all session tokens and API keys — no previous credentials may be honored

---

## 1.4 Portal Experience

**US-1.4.1: Search Globally Across Platform**
> As a **User**, I want to search across all platform entities (accounts, applications, dealers, tasks, and documents) from a single search bar, so that I can find what I need quickly without knowing which section it lives in.

**Acceptance Criteria:**
- Given I am logged into the platform
- When I type a query into the global search bar
- Then I see results grouped by entity type (accounts, applications, dealers, tasks, documents)
- And results are ranked by relevance and show key identifying information (name, ID, status)
- And I can click any result to navigate directly to that record
- And the search supports partial matches, account numbers, names, email addresses, and phone numbers

---

**US-1.4.2: Customize Dashboard Layout**
> As a **User**, I want to customize which widgets and data panels appear on my dashboard, so that I see the most relevant information for my role when I log in.

**Acceptance Criteria:**
- Given I am logged into the platform
- When I enter dashboard customization mode
- Then I can add, remove, reorder, and resize widgets from a library of available options appropriate to my role
- And my layout preferences are saved and persist across sessions
- And each role has a default dashboard layout that can be personalized
- And an Administrator can define which widgets are available for each role

---

**US-1.4.3: Persist Session State Across Navigation**
> As a **User**, I want my active filters, search queries, scroll positions, and in-progress form data to be preserved when I navigate between sections of the portal, so that I don't lose my working context.

**Acceptance Criteria:**
- Given I have active filters, a search query, or in-progress form data in any section of the portal
- When I navigate to a different section and then return
- Then my previous state (filters, search terms, scroll position, draft form data) is restored
- And this applies across all major portal sections (pipeline, accounts, billing, reports, LMS)
- And session state is cleared when I explicitly reset a view or log out

---

## 1.5 Identity Audit & Security

**US-1.5.1: Audit Log All Identity Lifecycle Events**
> As a **Superadmin**, I want every identity lifecycle event (invitation, registration, role change, login, deactivation, reactivation, and org-level actions) to be recorded in an immutable, searchable audit log, so that I have a complete forensic trail for security investigations, compliance audits, and regulatory reporting.

**Acceptance Criteria:**
- Given any identity lifecycle event occurs on the platform
- When the event is processed
- Then an audit log entry is created containing: event type, actor ID (who performed the action), target ID (who/what was affected), actor's role at the time of action, actor's org ID, target's org ID, timestamp (UTC with millisecond precision), IP address of the actor, and event-specific metadata
- And the following events are logged:
  - **Invitation events:** created, sent, accepted, expired, re-issued, invalidated (with reason: manual revoke, inviter deactivated, org deactivated)
  - **Registration events:** started, email verified, completed, failed (with failure reason)
  - **Authentication events:** login success, login failure (with failure reason: wrong OTP, expired OTP, deactivated account), logout, session timeout, forced session termination
  - **Role events:** role assigned, role changed (with previous and new role), scope ceiling modified
  - **Access events:** partner access granted/revoked, department changed, company group changed
  - **Deactivation events:** user deactivated (with reason and cascading impact count), user reactivated, org deactivated, org reactivated
  - **Unauthorized access events:** cross-org access attempt, privilege escalation attempt, invalid token usage, registration without invitation
- And audit logs are immutable — entries cannot be modified or deleted by any user, including Superadmins
- And a Superadmin can search and filter the audit log by: event type, actor, target, organization, date range, and IP address
- And Company Admins can view audit logs scoped to their own organization only (they cannot see events from other orgs or Superadmin-level actions outside their org)
- And audit log entries are retained for a minimum of 7 years per regulatory requirements
- And audit logs can be exported in CSV and JSON formats for external compliance tools
- And high-severity events (privilege escalation attempts, cross-org access attempts, org deactivations) trigger real-time alerts to the Superadmin notification channel

**Security Considerations:**
- Audit log storage must be append-only with cryptographic integrity verification (hash chaining or equivalent) to detect tampering
- Audit log access itself is audited — viewing and exporting logs creates its own log entry
- Logs must not contain sensitive PII (SSNs, passwords) — only references (user IDs, masked emails) sufficient for investigation
- Log storage must be separate from application storage so that a compromised application database does not compromise the audit trail
- Retention and deletion policies must comply with applicable data protection regulations (state and federal)
