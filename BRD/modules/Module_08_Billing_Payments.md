---
figma:
  file: "https://www.figma.com/file/FIGMA_FILE_ID/Comfort-Connect-Platform"
  page: "Module 08 - Billing & Payments"
  frames:
    - id: "overview"
      name: "Module 08 - Billing & Payments Overview"
      url: "TODO"
---

# Module 8: Billing & Payments
## Financial Operations for Premier Accounts

**Version:** 1.0  
**Date:** February 12, 2026  
**Stories:** 23

---

## Overview

Manages all billing and payment operations for Premier Program accounts. Includes billing account setup, invoice generation, payment processing, autopay, fees, and delinquency management.

**Key Capabilities:**
- Billing account creation
- Payment method management
- Autopay enrollment/cancellation
- Invoice generation
- One-time and recurring payment processing
- Payment receipts and refunds
- Late fee assessment
- Credit and adjustment application
- Delinquency tracking and escalation

---

## 8.1 Billing Account Setup

**US-8.1.1: Create Billing Account**
> As a **System**, I want to create a billing account when a Premier enrollment is activated, so that billing can begin.

**Acceptance Criteria:**
- Given a Premier enrollment has been completed
- When the billing account is created
- Then the billing schedule is established
- And the first billing date is set based on installation date

---

**US-8.1.2: Set Up Payment Method**
> As a **Homeowner**, I want to set up my payment method, so that I can make payments conveniently.

**Acceptance Criteria:**
- Given I have an active billing account
- When I add a payment method (card, bank account)
- Then the payment method is securely stored
- And I can use it for payments

---

**US-8.1.3: Enable Autopay**
> As a **Homeowner**, I want to enable automatic payments, so that my payments are made on time without manual action.

**Acceptance Criteria:**
- Given I have a stored payment method
- When I enable autopay
- Then my payments are automatically processed on the due date
- And I receive confirmation of each payment

---

**US-8.1.4: Disable Autopay**
> As a **Homeowner**, I want to disable automatic payments, so that I can control when payments are made.

**Acceptance Criteria:**
- Given I have autopay enabled
- When I disable autopay
- Then automatic payments stop
- And I am responsible for making manual payments

---

## 8.2 Billing Cycle Management

**US-8.2.1: Generate Monthly Invoice**
> As a **System**, I want to generate monthly invoices, so that homeowners know their payment obligations.

**Acceptance Criteria:**
- Given a billing period has ended
- When the invoice is generated
- Then it shows previous balance, current charges, payments received, and amount due
- And is delivered via preferred channel

---

**US-8.2.2: View Billing History**
> As a **Homeowner**, I want to view my billing history, so that I can track my payments.

**Acceptance Criteria:**
- Given I have an active billing account
- When I view billing history
- Then I see all past statements, payments, and fees
- And can download statements for my records

---

**US-8.2.3: Calculate Balance Due**
> As a **System**, I want to calculate the current balance due, so that accurate amounts are displayed.

**Acceptance Criteria:**
- Given all billing transactions
- When balance is calculated
- Then it includes past due amounts, current charges, fees, and credits applied

---

**US-8.2.4: View Current Period Summary**
> As a **Homeowner**, I want to view my current billing period summary, so that I understand my payment status.

**Acceptance Criteria:**
- Given I have an active billing account
- When I view my current summary
- Then I see current charges, payments made, fees assessed, and balance remaining

---

## 8.3 Payment Processing

**US-8.3.1: Make One-Time Payment**
> As a **Homeowner**, I want to make a one-time payment, so that I can pay my balance.

**Acceptance Criteria:**
- Given I have a balance due
- When I submit a payment
- Then the payment is processed
- And I receive a receipt
- And my balance is updated

---

**US-8.3.2: Process Autopay Payment**
> As a **System**, I want to automatically process scheduled payments, so that enrolled homeowners' payments are collected.

**Acceptance Criteria:**
- Given autopay is enabled and payment is due
- When the scheduled date arrives
- Then the payment is processed using the stored payment method
- And the homeowner is notified of success or failure

---

**US-8.3.3: Generate Payment Receipt**
> As a **System**, I want to generate receipts for payments, so that homeowners have proof of payment.

**Acceptance Criteria:**
- Given a payment has been processed
- When the receipt is generated
- Then it includes payment amount, date, and confirmation number
- And is available for download and sent via email

---

**US-8.3.4: Process Payment Refund**
> As an **Administrator**, I want to process payment refunds, so that overpayments or corrections can be handled.

**Acceptance Criteria:**
- Given a refund is warranted
- When I process the refund
- Then the refund is issued to the original payment method
- And the account balance is adjusted
- And the homeowner is notified

---

**US-8.3.5: Handle Payment Failure**
> As a **System**, I want to handle payment failures appropriately, so that collection efforts can proceed.

**Acceptance Criteria:**
- Given a payment attempt has failed
- When the failure is recorded
- Then the reason is captured (insufficient funds, expired card, etc.)
- And the homeowner is notified
- And retry logic is applied as configured

---

**US-8.3.6: Process Payment Reversal**
> As an **Administrator**, I want to reverse a payment, so that erroneous payments can be corrected.

**Acceptance Criteria:**
- Given a payment needs to be reversed
- When I process the reversal
- Then the payment is reversed
- And the account balance is adjusted
- And the reversal is recorded for audit

---

## 8.4 Fees & Delinquency

**US-8.4.1: Assess Late Fee**
> As a **System**, I want to automatically assess late fees when payments are overdue, so that collection policies are enforced.

**Acceptance Criteria:**
- Given a payment is past due beyond the grace period
- When the late fee is assessed
- Then the fee amount is added to the balance
- And the homeowner is notified

---

**US-8.4.2: Calculate Days Past Due**
> As a **System**, I want to calculate days past due, so that delinquency status is tracked.

**Acceptance Criteria:**
- Given a balance is past due
- When days past due is calculated
- Then accurate delinquency aging is determined (30/60/90+ days)

---

**US-8.4.3: Initiate Dunning Communications**
> As a **System**, I want to send dunning communications to delinquent accounts, so that past due balances are collected.

**Acceptance Criteria:**
- Given an account has a past due balance
- When dunning rules are triggered
- Then appropriate reminder communications are sent
- And escalation occurs based on days past due

---

**US-8.4.4: Assess Statement Fee**
> As a **System**, I want to assess statement fees when applicable, so that paper statement costs are recovered.

**Acceptance Criteria:**
- Given an account receives paper statements
- When the billing cycle ends
- Then the statement fee is assessed
- And appears on the next invoice

---

**US-8.4.5: Apply Credit to Account**
> As an **Administrator**, I want to apply a credit to an account, so that adjustments and goodwill can be accommodated.

**Acceptance Criteria:**
- Given a credit is warranted
- When I apply the credit
- Then the account balance is reduced
- And the credit is recorded with a reason

---

## 8.5 Payment Scheduling

**US-8.5.1: Schedule Future Payment**
> As a **Homeowner**, I want to schedule a payment for a future date, so that I can plan my payments.

**Acceptance Criteria:**
- Given I have a balance due
- When I schedule a payment for a future date
- Then the payment is queued for processing on that date
- And I receive confirmation of the scheduled payment

---

**US-8.5.2: Cancel Scheduled Payment**
> As a **Homeowner**, I want to cancel a scheduled payment, so that I can change my payment plans.

**Acceptance Criteria:**
- Given I have a scheduled payment
- When I cancel it before the processing date
- Then the payment is cancelled
- And I am notified of the cancellation

---

## 8.6 Billing Reconciliation

**US-8.6.1: Identify Billing Reconciliation Exceptions**
> As an **Administrator**, I want to identify billing reconciliation exceptions, so that discrepancies can be resolved.

**Acceptance Criteria:**
- Given billing transactions have been processed
- When reconciliation is performed
- Then exceptions are identified and flagged
- And are available for review and resolution

---

**US-8.6.2: Export Payment Data**
> As an **Administrator**, I want to export payment data, so that it can be used for reporting and reconciliation.

**Acceptance Criteria:**
- Given payment transactions exist
- When I export payment data
- Then the data is exported in the required format
- And includes all necessary fields for reconciliation
