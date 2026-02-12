# Module 7: Installation & Funding
## Fulfillment and Contractor Payment

**Version:** 1.0  
**Date:** February 12, 2026  
**Stories:** 12

---

## Overview

Manages the installation authorization, documentation verification, and contractor payment processes. Supports funding for Premier Program as well as partner financing products (Momnt, Breeze, Microf).

**Key Capabilities:**
- Installation authorization and completion recording
- Funding paperwork submission and verification
- Contractor payment initiation and processing
- Funding status visibility for dealers
- Partner-specific funding (Momnt, Breeze, Microf)

---

## 7.1 Installation Authorization

**US-7.1.1: Authorize Installation**
> As a **Dealer**, I want to authorize that installation can proceed, so that I can schedule the work.

**Acceptance Criteria:**
- Given all pre-installation requirements are met (documents signed, first payment received, verifications complete)
- When I authorize installation
- Then the status changes to "Installation Authorized"
- And installation can proceed

---

**US-7.1.2: Record Installation Completion**
> As a **Dealer**, I want to record that installation is complete, so that funding can be processed.

**Acceptance Criteria:**
- Given installation has been performed
- When I record completion with date and details
- Then the status changes to "Installation Completed"
- And the funding process can begin

---

## 7.2 Funding Documentation

**US-7.2.1: Submit Funding Paperwork**
> As a **Dealer**, I want to submit funding paperwork after installation, so that I can receive payment.

**Acceptance Criteria:**
- Given installation is complete
- When I submit funding documentation (invoice, photos, certificates)
- Then the documentation is received for review
- And the status changes to "Funding Documentation Submitted"

---

**US-7.2.2: Request Additional Paperwork**
> As an **Administrator**, I want to request additional funding paperwork if needed, so that documentation is complete.

**Acceptance Criteria:**
- Given funding documentation has been reviewed
- When additional documents are needed
- Then the dealer is notified of what is required
- And the status reflects pending documentation

---

**US-7.2.3: Verify Funding Documentation**
> As an **Administrator**, I want to verify funding documentation, so that payment can be approved.

**Acceptance Criteria:**
- Given funding documentation has been submitted
- When I verify the documentation is complete and accurate
- Then the status changes to "Funding Documentation Verified"
- And payment processing can proceed

---

## 7.3 Contractor Payment

**US-7.3.1: Initiate Contractor Payment**
> As a **System**, I want to initiate contractor payment when documentation is verified, so that dealers are paid promptly.

**Acceptance Criteria:**
- Given funding documentation has been verified
- When payment is initiated
- Then the payment is queued for processing
- And the dealer is notified

---

**US-7.3.2: Process Contractor Payment**
> As a **System**, I want to process contractor payments to their bank account, so that dealers receive their funds.

**Acceptance Criteria:**
- Given a contractor payment has been initiated
- When the payment is processed
- Then funds are transferred to the dealer's bank account
- And the status changes to "Contractor Paid"

---

**US-7.3.3: View Funding Status**
> As a **Dealer**, I want to view the funding status of my installations, so that I know when to expect payment.

**Acceptance Criteria:**
- Given I have completed installations
- When I view funding status
- Then I see the status of each installation's funding
- And expected payment dates

---

## 7.4 Partner Funding

**US-7.4.1: Request Momnt Funding**
> As a **System**, I want to request funding from Momnt after installation, so that the loan is disbursed.

**Acceptance Criteria:**
- Given a Momnt loan has been approved and installation is complete
- When funding is requested
- Then Momnt processes the funding
- And the dealer receives payment

---

**US-7.4.2: Request Momnt Refund**
> As an **Administrator**, I want to request a refund from Momnt, so that cancelled or adjusted loans are corrected.

**Acceptance Criteria:**
- Given a Momnt loan requires refund
- When I initiate the refund
- Then the refund is processed with Momnt
- And appropriate adjustments are made

---

**US-7.4.3: Request Breeze Funding**
> As a **Dealer**, I want to request funding from Breeze after delivery/installation, so that I receive payment.

**Acceptance Criteria:**
- Given a Breeze LTO has been executed and installation is complete
- When I set the delivery date
- Then Breeze initiates the funding process
- And I receive payment when funded

---

**US-7.4.4: Complete Microf Work Order**
> As a **Dealer**, I want to complete the work order with Microf, so that funding is processed.

**Acceptance Criteria:**
- Given a Microf LTO has been executed
- When I submit work completion
- Then Microf is notified
- And funding is initiated
