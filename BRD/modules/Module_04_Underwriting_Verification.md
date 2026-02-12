# Module 4: Underwriting & Verification
## Credit Decisions and Verification Services

**Version:** 1.0  
**Date:** February 12, 2026  
**Stories:** 20

---

## Overview

Manages credit bureau integration, automated and manual underwriting decisions, and income/property verification services. Supports consistent, configurable credit decisions across all financing products.

**Key Capabilities:**
- Soft and hard credit pulls
- Credit report storage and retrieval
- Credit freeze detection
- Automated underwriting rules engine
- Company-specific underwriting configurations
- Manual underwriting queue and review
- Income verification (bank statements, pay stubs)
- Deed verification and property listing checks

---

## 4.1 Credit Bureau Integration

**US-4.1.1: Perform Soft Credit Pull**
> As a **System**, I want to perform a soft credit pull for prequalification, so that applicant creditworthiness can be evaluated without impacting their credit score.

**Acceptance Criteria:**
- Given applicant personal information and consent
- When a soft credit pull is requested
- Then credit data is retrieved from the bureau
- And the inquiry does not appear on the applicant's credit report

---

**US-4.1.2: Perform Hard Credit Pull**
> As a **System**, I want to perform a hard credit pull when required for final loan decisions, so that complete credit evaluation can occur.

**Acceptance Criteria:**
- Given applicant authorization for a hard pull
- When a hard credit pull is executed
- Then complete credit data is retrieved
- And the inquiry is recorded on the applicant's credit report

---

**US-4.1.3: Store Credit Report**
> As a **System**, I want to store credit report information, so that it's available for underwriting review.

**Acceptance Criteria:**
- Given a credit pull has been completed
- When the report is received
- Then key credit data is stored securely
- And a PDF copy is saved for reference

---

**US-4.1.4: Detect Credit Freeze**
> As a **System**, I want to detect when an applicant has a credit freeze, so that they can be appropriately informed.

**Acceptance Criteria:**
- Given a credit pull is attempted
- When a credit freeze is detected
- Then the application is flagged as "Credit Freeze Detected"
- And the applicant is informed they need to lift the freeze

---

## 4.2 Automated Underwriting

**US-4.2.1: Evaluate Application Against Underwriting Rules**
> As a **System**, I want to evaluate applications against configured underwriting rules, so that consistent decisions are made.

**Acceptance Criteria:**
- Given an application with credit data
- When underwriting evaluation runs
- Then the application is checked against criteria including FICO score, DTI, charge-offs, and delinquencies
- And a decision (approve, decline, review) is rendered

---

**US-4.2.2: Apply Company-Specific Underwriting Rules**
> As a **System**, I want to apply company-specific underwriting configurations, so that different dealers can have customized criteria.

**Acceptance Criteria:**
- Given a company has custom underwriting configuration
- When an application from that company is evaluated
- Then the company-specific rules take precedence

---

**US-4.2.3: Calculate Debt-to-Income Ratio**
> As a **System**, I want to calculate the debt-to-income ratio, so that it can be used in underwriting decisions.

**Acceptance Criteria:**
- Given applicant income and credit data showing monthly obligations
- When DTI is calculated
- Then total monthly debt / monthly income is computed
- And the result is compared against DTI thresholds

---

**US-4.2.4: Determine Maximum Approval Amount**
> As a **System**, I want to calculate the maximum approval amount, so that applicants know their spending limit.

**Acceptance Criteria:**
- Given underwriting criteria and applicant profile
- When maximum amount is calculated
- Then the amount reflects income-based and credit-based limits
- And the lowest applicable limit is used

---

**US-4.2.5: Apply Decision Hierarchy**
> As a **System**, I want to apply decision hierarchy when multiple underwriting rules match, so that the most restrictive decision prevails.

**Acceptance Criteria:**
- Given an application matches multiple underwriting criteria groups
- When decisions are evaluated
- Then "reject" takes precedence over "review"
- And "review" takes precedence over "approved"
- And if no adverse groups match, the application is approved

---

## 4.3 Manual Underwriting

**US-4.3.1: Queue Application for Manual Review**
> As a **System**, I want to queue applications requiring manual review, so that underwriters can evaluate them.

**Acceptance Criteria:**
- Given an application triggers manual review criteria
- When the application is queued
- Then it appears in the underwriting review queue
- And priority is assigned based on criteria

---

**US-4.3.2: Review Manual Underwriting Case**
> As an **Underwriter**, I want to review applications requiring manual decisions, so that I can make informed credit decisions.

**Acceptance Criteria:**
- Given an application in the manual review queue
- When I review the case
- Then I can view complete credit report, application details, and underwriting rule matches
- And I can approve, approve with conditions, or decline

---

**US-4.3.3: Record Manual Underwriting Decision**
> As an **Underwriter**, I want to record my decision with rationale, so that there is an audit trail.

**Acceptance Criteria:**
- Given I have made a manual underwriting decision
- When I record my decision
- Then the decision, conditions, and rationale are saved
- And the homeowner and dealer are notified

---

## 4.4 Income Verification

**US-4.4.1: Request Income Verification**
> As a **System**, I want to initiate income verification when required, so that stated income can be validated.

**Acceptance Criteria:**
- Given underwriting or policy requires income verification
- When verification is requested
- Then the verification process is initiated
- And the application status reflects verification in progress

---

**US-4.4.2: Submit Income Documentation**
> As a **Homeowner**, I want to submit income documentation, so that my income can be verified.

**Acceptance Criteria:**
- Given income verification is required
- When I upload documents (pay stubs, tax returns, bank statements)
- Then the documents are securely stored
- And verification review can proceed

---

**US-4.4.3: Review Income Documentation**
> As an **Administrator**, I want to review income documentation, so that I can verify stated income.

**Acceptance Criteria:**
- Given income documents have been submitted
- When I review the documentation
- Then I can verify or reject the income verification
- And I can record the verified income amount

---

**US-4.4.4: Update Income Verification Status**
> As an **Administrator**, I want to update income verification status, so that the application can proceed.

**Acceptance Criteria:**
- Given income verification is in progress
- When I update the status (verified, failed, needs more info)
- Then the application status is updated
- And the applicant and dealer are notified

---

## 4.5 Property/Deed Verification

**US-4.5.1: Request Deed Verification**
> As a **System**, I want to initiate deed verification for Premier leases, so that property ownership is confirmed.

**Acceptance Criteria:**
- Given a Premier enrollment requires deed verification
- When verification is requested
- Then the verification process is initiated
- And the status reflects "Deed Verification in Progress"

---

**US-4.5.2: Verify Property Ownership**
> As an **Administrator**, I want to verify property ownership, so that leases are properly secured.

**Acceptance Criteria:**
- Given deed verification is in progress
- When I confirm property ownership matches the applicant
- Then the verification status is updated to "Verified"
- And installation can be authorized

---

**US-4.5.3: Handle Deed Verification Failure**
> As a **System**, I want to handle failed deed verification, so that appropriate action can be taken.

**Acceptance Criteria:**
- Given deed verification has failed
- When the failure is recorded
- Then the applicant and dealer are notified
- And the application is held pending resolution

---

**US-4.5.4: Check Active Property Listings**
> As a **System**, I want to check for active property listings, so that leases are not made on properties being sold.

**Acceptance Criteria:**
- Given a property address
- When active listings are checked
- Then any active listings are flagged
- And additional review is triggered if found
