---
figma:
  file: "https://www.figma.com/file/FIGMA_FILE_ID/Comfort-Connect-Platform"
  page: "Module 12 - Administration"
  frames:
    - id: "overview"
      name: "Module 12 - Administration Overview"
      url: "TODO"
---

# Module 12: Administration
## Configuration and Reporting

**Version:** 1.0  
**Date:** February 12, 2026  
**Stories:** 31

---

## Overview

Platform administration module for system configuration, partner management, underwriting configuration, feature flags, and operational reporting/analytics.

**Key Capabilities:**
- Partner integration configuration
- Partner product availability
- Underwriting rules configuration
- Company underwriting config assignment
- System parameter management
- Feature flag management
- Pipeline, funding, and delinquency reports
- Partner data validation
- Data warehouse export
- Dealer performance dashboards

---

## 12.1 Partner Configuration

**US-12.1.1: Enable Partner for Company**
> As an **Administrator**, I want to enable financing partners for a company, so that they can offer those products.

**Acceptance Criteria:**
- Given a company is enrolled
- When I enable a partner (Premier, Momnt, Microf, Breeze, Thrive)
- Then the partner appears as an option for that company
- And their users can create applications for that partner

---

**US-12.1.2: Disable Partner for Company**
> As an **Administrator**, I want to disable a financing partner for a company, so that they can no longer use it.

**Acceptance Criteria:**
- Given a company has a partner enabled
- When I disable the partner
- Then new applications cannot be created for that partner
- And existing applications continue to be serviced

---

**US-12.1.3: Configure Global Partner Access**
> As an **Administrator**, I want to globally enable or disable partner access, so that I can control platform-wide availability.

**Acceptance Criteria:**
- Given a partner needs to be globally controlled
- When I configure the global access setting
- Then the setting takes precedence over company-level settings
- And all users are affected

---

## 12.2 Underwriting Configuration

**US-12.2.1: Configure Underwriting Criteria**
> As an **Administrator**, I want to configure underwriting criteria groups, so that approval decisions reflect business rules.

**Acceptance Criteria:**
- Given underwriting rules need to be updated
- When I configure criteria groups
- Then new applications are evaluated against the updated rules

---

**US-12.2.2: Assign Underwriting Config Type to Company**
> As an **Administrator**, I want to assign an underwriting config type to a company, so that their applications are evaluated using the appropriate underwriting criteria.

**Acceptance Criteria:**
- Given a company is enrolled
- When I select an underwriting config type from available options
- Then the config type is saved to the company record
- And applications from that company use the associated underwriting rules

---

**US-12.2.3: View Available Underwriting Config Types**
> As an **Administrator**, I want to view the list of available underwriting config types, so that I can select the appropriate one for a company.

**Acceptance Criteria:**
- Given I am configuring a company's underwriting settings
- When I view the config type options
- Then I see a list of available config types (e.g., "buyDownDeeper", "BostonMaxApproval")
- And each option includes a description of its purpose

---

## 12.3 System Configuration

**US-12.3.1: Configure System Parameters**
> As an **Administrator**, I want to configure system parameters, so that the platform operates according to business needs.

**Acceptance Criteria:**
- Given system parameters need adjustment
- When I update configuration
- Then the new settings take effect
- And system behavior reflects the configuration

---

**US-12.3.2: Manage Feature Flags**
> As an **Administrator**, I want to enable or disable features, so that I can control feature availability.

**Acceptance Criteria:**
- Given a feature needs to be controlled
- When I toggle the feature flag
- Then the feature is enabled or disabled accordingly

---

**US-12.3.3: Configure Project Types and Lease Structures**
> As an **Administrator**, I want to define and manage project types (e.g., Standard, Geothermal) and configure the lease structure required for each, so that the platform can support different equipment categories with single-lease or multi-lease arrangements.

**Acceptance Criteria:**
- Given I am configuring project types for the Premier Program
- When I create or edit a project type
- Then I can define the project type name, description, and the set of lease components it requires (e.g., Standard = "Equipment" only; Geothermal = "Equipment" + "Ground Loop")
- And I can configure whether each lease component has its own payment schedule and billing line
- And I can activate or deactivate project types without affecting existing accounts
- And new project types are immediately available for selection during application creation
- And I can configure which dealers or company groups are eligible to offer each project type

---

**US-12.3.4: Configure Department-Based Rate Plan Access**
> As an **Administrator**, I want to configure which rate plans are available for each department/job function and trade combination, so that sales reps, service technicians, and other dealer roles see only the plans relevant to their function and the product category they are quoting.

**Acceptance Criteria:**
- Given departments/job functions and trade-based rate plan assignments (US-5.2.3) exist
- When I configure department-based plan access
- Then I can select a department (e.g., Sales) and a trade (e.g., HVAC) and assign which rate plans from that trade's pool are visible to users in that department
- And I can set priority ordering for plans within each department–trade combination (highest priority displayed first)
- And I can configure different plan sets for different department–trade pairs (e.g., Sales + HVAC gets promotional plans; Service + Plumbing gets repair-focused plans)
- And I can set these configurations as global defaults that apply to all dealers
- And dealer managers can create company-level overrides that further narrow (but not expand beyond) the administrator's configuration
- And I can view a summary matrix of departments × trades showing the number of assigned plans for each combination
- And changes take effect for new quotes without affecting existing committed quotes

---

**US-12.3.5: Review and Approve Dealer Brand Profile**
> As an **Administrator**, I want to review dealer-submitted brand profiles (logo, tagline, and colors) and approve or reject them before they go live on customer-facing screens, so that all branding meets platform quality standards, compliance requirements, and does not contain inappropriate or misleading content.

**Acceptance Criteria:**
- Given a dealer has submitted a brand profile for approval
- When I view the branding approval queue
- Then I see all pending submissions listed with: dealer name, submission date, and a thumbnail preview
- And I can click a submission to see a full side-by-side comparison of the proposed branding vs. the currently live branding (or default platform branding if first submission)
- And I can view a rendered preview of the customer-facing application with the proposed branding applied
- And I can approve the submission, which immediately publishes the branding to the dealer's customer-facing screens
- And I can reject the submission with a required reason (free-text) which is sent back to the dealer as a notification with specific feedback on what to change
- And the approval/rejection decision is recorded in the audit log with: administrator ID, dealer ID, decision, reason (if rejected), and timestamp
- And I can set platform-wide branding guidelines (e.g., minimum logo resolution, prohibited color ranges) that are enforced automatically during upload — submissions that violate guidelines are blocked before reaching the approval queue
- And if a dealer has no approved branding, the default Comfort Connect platform branding is displayed on their customer-facing screens

---

**US-12.3.6: Configure Momnt Charge Request Timing Rules**
> As an **Administrator**, I want to configure the rules that determine whether a Momnt charge request should be initiated immediately or scheduled for a future date, so that the platform can guide dealers on optimal charge timing based on installation proximity.

**Acceptance Criteria:**
- Given charge timing rules need to be configured for Momnt loans
- When I access the Momnt charge configuration settings
- Then I can set an "immediate charge threshold" (number of days) — if the planned installation date is within this threshold from loan acceptance, the platform recommends immediate charge initiation
- And I can set a "scheduled charge lead time" (number of days before planned installation) — if the installation date is beyond the immediate threshold, the platform recommends scheduling the charge this many days before installation
- And I can configure a minimum and maximum lead time for scheduled charges
- And I can enable or disable the scheduling option entirely (forcing all charges to be immediate)
- And changes to timing rules apply only to new charge requests and do not affect already-initiated or scheduled charges
- And I can view the current configuration with a summary of how many pending applications would be affected by a change

---

## 12.4 Operational Reports

**US-12.4.1: Generate Application Pipeline Report**
> As an **Administrator**, I want to generate pipeline reports, so that I can see application volume and status.

**Acceptance Criteria:**
- Given applications exist in the system
- When I generate the pipeline report
- Then I see applications by status, dealer, and date range
- And can export the report

---

**US-12.4.2: Generate Funding Report**
> As an **Administrator**, I want to generate funding reports, so that I can track payments to dealers.

**Acceptance Criteria:**
- Given funding has been processed
- When I generate the funding report
- Then I see all funding by date, dealer, and amount
- And can reconcile with financial systems

---

**US-12.4.3: Generate Delinquency Report**
> As an **Administrator**, I want to generate delinquency reports, so that I can monitor collection needs.

**Acceptance Criteria:**
- Given accounts have balances
- When I generate the delinquency report
- Then I see accounts by days past due
- And total amounts at risk

---

**US-12.4.4: Save Report Configuration**
> As an **Administrator**, I want to save my report filter and parameter configurations as named presets, so that I can re-run frequently used reports without rebuilding them each time.

**Acceptance Criteria:**
- Given I have configured a report with specific filters (date range, dealer, status, partner, etc.)
- When I save the configuration with a name
- Then the preset is available in my saved reports list
- And I can load, run, edit, or delete saved presets
- And saved presets are personal to me unless I choose to share them with my team

---

**US-12.4.5: Schedule Automated Report Delivery**
> As an **Administrator**, I want to schedule reports to be automatically generated and delivered via email on a recurring basis, so that I receive regular reporting without manually running them.

**Acceptance Criteria:**
- Given I have a saved report configuration
- When I set up a delivery schedule (daily, weekly, monthly) with one or more email recipients
- Then the report is automatically generated on the configured schedule
- And the report is delivered as a PDF or CSV attachment to the specified recipients
- And I can pause, modify, or cancel scheduled deliveries at any time
- And failed deliveries are logged and I am notified

---

## 12.5 Partner Validation

**US-12.5.1: Generate Partner Validation Report**
> As a **System**, I want to generate partner validation reports, so that data consistency is monitored.

**Acceptance Criteria:**
- Given accounts exist with external partners
- When the validation report is generated
- Then discrepancies between platform and partner data are identified
- And can be investigated

---

**US-12.5.2: Validate Partner Status**
> As a **System**, I want to periodically validate partner statuses, so that account data remains synchronized.

**Acceptance Criteria:**
- Given accounts have partner status
- When validation runs
- Then partner systems are queried
- And any status discrepancies are flagged

---

## 12.6 Data Export

**US-12.6.1: Export Account Data to Data Warehouse**
> As a **System**, I want to export account data to the data warehouse, so that analytics can be performed.

**Acceptance Criteria:**
- Given account data exists
- When the export runs
- Then data is loaded to the data warehouse
- And is available for reporting

---

**US-12.6.2: Export Payment Data**
> As a **System**, I want to export payment data for reconciliation, so that financial reporting is accurate.

**Acceptance Criteria:**
- Given payments have been processed
- When the export runs
- Then payment data is exported
- And can be reconciled with financial systems

---

## 12.7 Dealer Reporting

**US-12.7.1: View Dealer Performance Dashboard**
> As a **Dealer**, I want to view my performance dashboard, so that I can track my business with Comfort Connect.

**Acceptance Criteria:**
- Given I have applications and funded deals
- When I view my dashboard
- Then I see application volume, approval rates, and funding totals
- And can compare to previous periods

---

**US-12.7.2: View Application Status Summary**
> As a **Dealer**, I want to view a summary of my applications by status, so that I can manage my pipeline.

**Acceptance Criteria:**
- Given I have applications in various statuses
- When I view the summary
- Then I see counts by status
- And can drill down to individual applications

---

**US-12.7.3: View Sales Rep Performance Report**
> As a **Sales Representative**, I want to view a pre-built performance report showing my recent activity and results, so that I can track my own production and identify areas for improvement.

**Acceptance Criteria:**
- Given I am a sales representative with application and funding activity
- When I view my performance report
- Then I see my key metrics including applications submitted, approval rate, funded deals, total funded volume, and average deal size
- And I can view trends over configurable time periods (week, month, quarter, year)
- And I see how my current period compares to the previous period
- And the report is available as a pre-built view on my dashboard without requiring manual configuration

---

**US-12.7.4: View Company Performance Report as Dealer Manager**
> As a **Dealer Manager**, I want to view a pre-built company-level performance report, so that I can see how my organization is performing overall and identify which reps are driving results.

**Acceptance Criteria:**
- Given I have a manager or leadership role at my dealer organization
- When I view the company performance report
- Then I see aggregated company-level metrics including total applications, approval rates, funded volume, and average deal size
- And I see a breakdown by individual sales representative within my organization
- And I can compare rep-to-rep performance
- And I can view trends over configurable time periods (week, month, quarter, year)
- And the report is scoped to my organization only — I cannot see other dealers' data

---

**US-12.7.5: View Multi-Level Performance Report as Internal User**
> As an **Internal User**, I want to view a pre-built performance report that I can drill into at the company level, dealer level, and individual rep level, so that I have full visibility into sales performance across the platform.

**Acceptance Criteria:**
- Given I am an internal user with reporting access
- When I view the multi-level performance report
- Then I see platform-wide aggregated metrics at the top level (total applications, approval rates, funded volume, average deal size)
- And I can drill down to a specific company group or individual dealer to see their performance
- And I can further drill down to individual sales representatives within a dealer
- And each level shows the same core metrics with trends over configurable time periods
- And I can filter by partner program, region, date range, and account status
- And the report supports export to CSV or PDF for sharing

---

## 12.8 Platform Branding & Naming Consistency

**US-12.8.1: Display "Comfort Connect" as Default Platform Brand**
> As a **User** (any role), I want all platform interfaces to display "Comfort Connect" as the platform name by default, so that I have a consistent brand experience across the portal.

**Acceptance Criteria:**
- Given I am logged into the platform
- When I view any screen that is NOT specific to a Premier Program application
- Then the platform name, headers, navigation, dashboards, and general UI elements display "Comfort Connect" — not "Premier Program"
- And page titles, breadcrumbs, and browser tab titles reference "Comfort Connect"
- And footer, help text, and support references use "Comfort Connect"
- And welcome messages, onboarding screens, and empty states reference "Comfort Connect"

---

**US-12.8.2: Display "Premier Program" Only in Premier Program Application Context**
> As a **User** (any role), I want to see the text "Premier Program" only when I am actively viewing or working with a specific Premier Program application, so that I can clearly distinguish the Premier Program product from the broader Comfort Connect platform.

**Acceptance Criteria:**
- Given I am viewing or managing a specific Premier Program application (e.g., application detail, offer selection, underwriting decision, document signing, billing for a Premier account)
- When the screen context is tied to that Premier Program application
- Then the UI may display "Premier Program" to identify the product type
- And "Premier Program" appears as a product label or descriptor — not as the platform name
- And if I navigate away from the Premier Program application context back to a general screen (dashboard, application list, settings), the branding reverts to "Comfort Connect"

---

**US-12.8.3: Use "Comfort Connect" in Non-Premier Product Contexts**
> As a **Dealer**, I want product selection screens, multi-product application lists, and general financing workflows to reference the "Comfort Connect" platform name rather than "Premier Program," so that I understand I am using the Comfort Connect platform even when the Premier Program is one of several available products.

**Acceptance Criteria:**
- Given I am on a screen that lists multiple financing products (Premier Program, Momnt, Thrive, Microf, Breeze)
- When the screen displays a platform-level header, navigation bar, or page title
- Then the platform name shown is "Comfort Connect" — not "Premier Program"
- And "Premier Program" appears only as a selectable product option alongside the other products
- And filter labels, column headers, and report titles that span multiple products use "Comfort Connect" as the platform identifier

---

**US-12.8.4: Display "Comfort Connect" in Communications and Notifications**
> As a **Homeowner**, I want emails, SMS messages, and in-portal notifications to reference "Comfort Connect" as the sender/platform name unless the communication is specifically about my Premier Program account, so that I recognize the platform brand consistently.

**Acceptance Criteria:**
- Given a notification or communication is being sent
- When the communication is a general platform message (welcome email, password reset, general announcement, prequalification invitation)
- Then the sender name, email header, and body reference "Comfort Connect"
- And "Premier Program" is NOT used as the platform name in these communications
- When the communication is specific to a Premier Program account (payment reminder, lease document, Premier offer details)
- Then the communication may reference "Premier Program" as the product name within the body
- And the sender/platform name still references "Comfort Connect"

---

**US-12.8.5: Display "Comfort Connect" on Dealer-Facing Portal and Dashboards**
> As a **Dealer**, I want my portal dashboard, navigation menu, and general dealer management screens to be branded as "Comfort Connect," so that I associate the overall platform with Comfort Connect rather than any single financing product.

**Acceptance Criteria:**
- Given I am a dealer logged into the portal
- When I view my dashboard, application pipeline, or dealer management screens
- Then the portal header, sidebar navigation, and dashboard title display "Comfort Connect"
- And "Premier Program" does NOT appear in navigation labels, menu items, or dashboard titles
- And "Premier Program" only appears as a product type filter option or within individual application details where the application is a Premier Program application
- And training modules, help documentation, and support links reference "Comfort Connect" as the platform
