# Comfort Connect POS Platform - BRD Part 4
## Billing, Payments, Installation & Funding

---

## Domain 11: Billing & Payments

### 11.1 Billing Account Setup

**US-11.1.1: Create Billing Account**
> As a **System**, I want to create a billing account when a Premier enrollment is activated, so that billing can begin.

**Acceptance Criteria:**
- Given a Premier enrollment has been completed
- When the billing account is created
- Then the billing schedule is established
- And the first billing date is set based on installation date

---

**US-11.1.2: Set Up Payment Method**
> As a **Homeowner**, I want to set up my payment method, so that I can make payments conveniently.

**Acceptance Criteria:**
- Given I have an active billing account
- When I add a payment method (card, bank account)
- Then the payment method is securely stored
- And I can use it for payments

---

**US-11.1.3: Enable Autopay**
> As a **Homeowner**, I want to enable automatic payments, so that my payments are made on time without manual action.

**Acceptance Criteria:**
- Given I have a stored payment method
- When I enable autopay
- Then my payments are automatically processed on the due date
- And I receive confirmation of each payment

---

**US-11.1.4: Disable Autopay**
> As a **Homeowner**, I want to disable automatic payments, so that I can control when payments are made.

**Acceptance Criteria:**
- Given I have autopay enabled
- When I disable autopay
- Then automatic payments stop
- And I am responsible for making manual payments

---

### 11.2 Billing Cycle Management

**US-11.2.1: Generate Monthly Invoice**
> As a **System**, I want to generate monthly invoices, so that homeowners know their payment obligations.

**Acceptance Criteria:**
- Given a billing period has ended
- When the invoice is generated
- Then it shows previous balance, current charges, payments received, and amount due
- And is delivered via preferred channel

---

**US-11.2.2: View Billing History**
> As a **Homeowner**, I want to view my billing history, so that I can track my payments.

**Acceptance Criteria:**
- Given I have an active billing account
- When I view billing history
- Then I see all past statements, payments, and fees
- And can download statements for my records

---

**US-11.2.3: Calculate Balance Due**
> As a **System**, I want to calculate the current balance due, so that accurate amounts are displayed.

**Acceptance Criteria:**
- Given all billing transactions
- When balance is calculated
- Then it includes past due amounts, current charges, fees, and credits applied

---

**US-11.2.4: View Current Period Summary**
> As a **Homeowner**, I want to view my current billing period summary, so that I understand my payment status.

**Acceptance Criteria:**
- Given I have an active billing account
- When I view my current summary
- Then I see current charges, payments made, fees assessed, and balance remaining

---

### 11.3 Payment Processing

**US-11.3.1: Make One-Time Payment**
> As a **Homeowner**, I want to make a one-time payment, so that I can pay my balance.

**Acceptance Criteria:**
- Given I have a balance due
- When I submit a payment
- Then the payment is processed
- And I receive a receipt
- And my balance is updated

---

**US-11.3.2: Process Autopay Payment**
> As a **System**, I want to automatically process scheduled payments, so that enrolled homeowners' payments are collected.

**Acceptance Criteria:**
- Given autopay is enabled and payment is due
- When the scheduled date arrives
- Then the payment is processed using the stored payment method
- And the homeowner is notified of success or failure

---

**US-11.3.3: Generate Payment Receipt**
> As a **System**, I want to generate receipts for payments, so that homeowners have proof of payment.

**Acceptance Criteria:**
- Given a payment has been processed
- When the receipt is generated
- Then it includes payment amount, date, and confirmation number
- And is available for download and sent via email

---

**US-11.3.4: Process Payment Refund**
> As an **Administrator**, I want to process payment refunds, so that overpayments or corrections can be handled.

**Acceptance Criteria:**
- Given a refund is warranted
- When I process the refund
- Then the refund is issued to the original payment method
- And the account balance is adjusted
- And the homeowner is notified

---

**US-11.3.5: Handle Payment Failure**
> As a **System**, I want to handle payment failures appropriately, so that collection efforts can proceed.

**Acceptance Criteria:**
- Given a payment attempt has failed
- When the failure is recorded
- Then the reason is captured (insufficient funds, expired card, etc.)
- And the homeowner is notified
- And retry logic is applied as configured

---

**US-11.3.6: Process Payment Reversal**
> As an **Administrator**, I want to reverse a payment, so that erroneous payments can be corrected.

**Acceptance Criteria:**
- Given a payment needs to be reversed
- When I process the reversal
- Then the payment is reversed
- And the account balance is adjusted
- And the reversal is recorded for audit

---

### 11.4 Fees & Delinquency

**US-11.4.1: Assess Late Fee**
> As a **System**, I want to automatically assess late fees when payments are overdue, so that collection policies are enforced.

**Acceptance Criteria:**
- Given a payment is past due beyond the grace period
- When the late fee is assessed
- Then the fee amount is added to the balance
- And the homeowner is notified

---

**US-11.4.2: Calculate Days Past Due**
> As a **System**, I want to calculate days past due, so that delinquency status is tracked.

**Acceptance Criteria:**
- Given a balance is past due
- When days past due is calculated
- Then accurate delinquency aging is determined (30/60/90+ days)

---

**US-11.4.3: Initiate Dunning Communications**
> As a **System**, I want to send dunning communications to delinquent accounts, so that past due balances are collected.

**Acceptance Criteria:**
- Given an account has a past due balance
- When dunning rules are triggered
- Then appropriate reminder communications are sent
- And escalation occurs based on days past due

---

**US-11.4.4: Assess Statement Fee**
> As a **System**, I want to assess statement fees when applicable, so that paper statement costs are recovered.

**Acceptance Criteria:**
- Given an account receives paper statements
- When the billing cycle ends
- Then the statement fee is assessed
- And appears on the next invoice

---

**US-11.4.5: Apply Credit to Account**
> As an **Administrator**, I want to apply a credit to an account, so that adjustments and goodwill can be accommodated.

**Acceptance Criteria:**
- Given a credit is warranted
- When I apply the credit
- Then the account balance is reduced
- And the credit is recorded with a reason

---

### 11.5 Payment Scheduling

**US-11.5.1: Schedule Future Payment**
> As a **Homeowner**, I want to schedule a payment for a future date, so that I can plan my payments.

**Acceptance Criteria:**
- Given I have a balance due
- When I schedule a payment for a future date
- Then the payment is queued for processing on that date
- And I receive confirmation of the scheduled payment

---

**US-11.5.2: Cancel Scheduled Payment**
> As a **Homeowner**, I want to cancel a scheduled payment, so that I can change my payment plans.

**Acceptance Criteria:**
- Given I have a scheduled payment
- When I cancel it before the processing date
- Then the payment is cancelled
- And I am notified of the cancellation

---

### 11.6 Billing Reconciliation

**US-11.6.1: Identify Billing Reconciliation Exceptions**
> As an **Administrator**, I want to identify billing reconciliation exceptions, so that discrepancies can be resolved.

**Acceptance Criteria:**
- Given billing transactions have been processed
- When reconciliation is performed
- Then exceptions are identified and flagged
- And are available for review and resolution

---

**US-11.6.2: Export Payment Data**
> As an **Administrator**, I want to export payment data, so that it can be used for reporting and reconciliation.

**Acceptance Criteria:**
- Given payment transactions exist
- When I export payment data
- Then the data is exported in the required format
- And includes all necessary fields for reconciliation

---

---

## Domain 12: Maintenance & Servicing

### 12.1 Maintenance Requests

**US-12.1.1: Request Maintenance Service**
> As a **Homeowner**, I want to request maintenance service for my equipment, so that issues are addressed.

**Acceptance Criteria:**
- Given I have an active Premier enrollment
- When I submit a maintenance request
- Then the request is logged
- And the contractor is notified

---

**US-12.1.2: Schedule Maintenance Appointment**
> As a **Dealer**, I want to schedule a maintenance appointment, so that service can be performed.

**Acceptance Criteria:**
- Given a maintenance request has been submitted
- When I schedule the appointment
- Then the homeowner is notified of the date and time
- And the appointment is tracked

---

**US-12.1.3: Complete Maintenance Service**
> As a **Dealer**, I want to record that maintenance service is complete, so that the service is documented.

**Acceptance Criteria:**
- Given a maintenance appointment has occurred
- When I record completion
- Then the service details are documented
- And the homeowner receives confirmation

---

### 12.2 Maintenance Reminders

**US-12.2.1: Send Scheduled Maintenance Reminder**
> As a **System**, I want to send scheduled maintenance reminders to homeowners, so that regular service is performed.

**Acceptance Criteria:**
- Given an account is due for scheduled maintenance
- When the reminder is triggered
- Then the homeowner receives a notification
- And can request service through the reminder

---

**US-12.2.2: Configure Maintenance Schedule**
> As an **Administrator**, I want to configure maintenance schedules, so that reminders are sent at appropriate intervals.

**Acceptance Criteria:**
- Given maintenance schedule parameters
- When I configure the schedule
- Then reminders are triggered according to the schedule

---

### 12.3 Maintenance Funding

**US-12.3.1: Process Maintenance Invoice**
> As a **System**, I want to process maintenance invoices, so that contractors are compensated for service.

**Acceptance Criteria:**
- Given a maintenance service has been completed
- When the invoice is submitted
- Then the invoice is processed for payment
- And the contractor is paid

---

**US-12.3.2: Track Maintenance Costs**
> As an **Administrator**, I want to track maintenance costs per account, so that profitability can be analyzed.

**Acceptance Criteria:**
- Given maintenance has been performed
- When I view maintenance costs
- Then I see all service costs associated with the account

---

### 12.4 Worry-Free Rewards

**US-12.4.1: Enroll in Worry-Free Rewards**
> As a **Homeowner**, I want to enroll in the Worry-Free Rewards program, so that I can earn benefits for on-time payments.

**Acceptance Criteria:**
- Given I have an active Premier account
- When I enroll in Worry-Free Rewards
- Then my enrollment is recorded
- And I begin earning rewards based on payment history

---

---

## Domain 13: Equipment Management

### 13.1 Equipment Identification

**US-13.1.1: Look Up Equipment by Model**
> As a **Dealer**, I want to look up equipment by model number, so that I can find the correct specifications.

**Acceptance Criteria:**
- Given a model number
- When I search for equipment
- Then matching equipment details are returned
- And specifications are displayed

---

**US-13.1.2: Identify Equipment via AI**
> As a **Dealer**, I want to identify equipment from an invoice or image, so that I can quickly capture equipment details.

**Acceptance Criteria:**
- Given an equipment invoice or image
- When AI analysis is performed
- Then equipment make, model, and specifications are extracted
- And can be added to the work order

---

**US-13.1.3: Capture Equipment Serial Number**
> As a **Dealer**, I want to capture the equipment serial number during installation, so that the installed equipment is tracked.

**Acceptance Criteria:**
- Given equipment is being installed
- When I enter the serial number
- Then the serial is associated with the account
- And is available for warranty and service purposes

---

### 13.2 Equipment Catalog

**US-13.2.1: Manage Equipment Catalog**
> As an **Administrator**, I want to manage the equipment catalog, so that dealers have accurate equipment information.

**Acceptance Criteria:**
- Given equipment data
- When I add or update the catalog
- Then the equipment is available for lookup
- And specifications are accurate

---

### 13.3 Invoice Verification

**US-13.3.1: Verify Equipment Invoice**
> As an **Administrator**, I want to verify equipment invoices, so that funding is based on actual equipment installed.

**Acceptance Criteria:**
- Given an equipment invoice has been submitted
- When I verify the invoice
- Then I confirm the equipment matches the work order
- And the invoice is approved for funding

---

---

## Domain 14: Installation & Funding

### 14.1 Installation Authorization

**US-14.1.1: Authorize Installation**
> As a **Dealer**, I want to authorize that installation can proceed, so that I can schedule the work.

**Acceptance Criteria:**
- Given all pre-installation requirements are met (documents signed, first payment received, verifications complete)
- When I authorize installation
- Then the status changes to "Installation Authorized"
- And installation can proceed

---

**US-14.1.2: Record Installation Completion**
> As a **Dealer**, I want to record that installation is complete, so that funding can be processed.

**Acceptance Criteria:**
- Given installation has been performed
- When I record completion with date and details
- Then the status changes to "Installation Completed"
- And the funding process can begin

---

### 14.2 Funding Documentation

**US-14.2.1: Submit Funding Paperwork**
> As a **Dealer**, I want to submit funding paperwork after installation, so that I can receive payment.

**Acceptance Criteria:**
- Given installation is complete
- When I submit funding documentation (invoice, photos, certificates)
- Then the documentation is received for review
- And the status changes to "Funding Documentation Submitted"

---

**US-14.2.2: Request Additional Paperwork**
> As an **Administrator**, I want to request additional funding paperwork if needed, so that documentation is complete.

**Acceptance Criteria:**
- Given funding documentation has been reviewed
- When additional documents are needed
- Then the dealer is notified of what is required
- And the status reflects pending documentation

---

**US-14.2.3: Verify Funding Documentation**
> As an **Administrator**, I want to verify funding documentation, so that payment can be approved.

**Acceptance Criteria:**
- Given funding documentation has been submitted
- When I verify the documentation is complete and accurate
- Then the status changes to "Funding Documentation Verified"
- And payment processing can proceed

---

### 14.3 Contractor Payment

**US-14.3.1: Initiate Contractor Payment**
> As a **System**, I want to initiate contractor payment when documentation is verified, so that dealers are paid promptly.

**Acceptance Criteria:**
- Given funding documentation has been verified
- When payment is initiated
- Then the payment is queued for processing
- And the dealer is notified

---

**US-14.3.2: Process Contractor Payment**
> As a **System**, I want to process contractor payments to their bank account, so that dealers receive their funds.

**Acceptance Criteria:**
- Given a contractor payment has been initiated
- When the payment is processed
- Then funds are transferred to the dealer's bank account
- And the status changes to "Contractor Paid"

---

**US-14.3.3: View Funding Status**
> As a **Dealer**, I want to view the funding status of my installations, so that I know when to expect payment.

**Acceptance Criteria:**
- Given I have completed installations
- When I view funding status
- Then I see the status of each installation's funding
- And expected payment dates

---

### 14.4 Partner Funding

**US-14.4.1: Request Momnt Funding**
> As a **System**, I want to request funding from Momnt after installation, so that the loan is disbursed.

**Acceptance Criteria:**
- Given a Momnt loan has been approved and installation is complete
- When funding is requested
- Then Momnt processes the funding
- And the dealer receives payment

---

**US-14.4.2: Request Momnt Refund**
> As an **Administrator**, I want to request a refund from Momnt, so that cancelled or adjusted loans are corrected.

**Acceptance Criteria:**
- Given a Momnt loan requires refund
- When I initiate the refund
- Then the refund is processed with Momnt
- And appropriate adjustments are made

---

**US-14.4.3: Request Breeze Funding**
> As a **Dealer**, I want to request funding from Breeze after delivery/installation, so that I receive payment.

**Acceptance Criteria:**
- Given a Breeze LTO has been executed and installation is complete
- When I set the delivery date
- Then Breeze initiates the funding process
- And I receive payment when funded

---

**US-14.4.4: Complete Microf Work Order**
> As a **Dealer**, I want to complete the work order with Microf, so that funding is processed.

**Acceptance Criteria:**
- Given a Microf LTO has been executed
- When I submit work completion
- Then Microf is notified
- And funding is initiated
