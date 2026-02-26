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
**Stories:** 23

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
