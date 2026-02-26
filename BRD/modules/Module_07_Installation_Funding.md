---
figma:
  file: "https://www.figma.com/file/FIGMA_FILE_ID/Comfort-Connect-Platform"
  page: "Module 07 - Installation & Funding"
  frames:
    - id: "overview"
      name: "Module 07 - Installation & Funding Overview"
      url: "TODO"
---

# Module 7: Installation & Funding
## Fulfillment and Contractor Payment

**Version:** 1.0  
**Date:** February 12, 2026  
**Stories:** 17

---

## Overview

Manages the installation authorization, documentation verification, and contractor payment processes. Supports funding for Premier Program as well as partner financing products (Momnt, Breeze, Microf).

**Key Capabilities:**
- Installation authorization and completion recording
- Funding paperwork submission and verification
- Contractor payment initiation and processing
- Funding status visibility for dealers
- Partner-specific funding (Momnt, Breeze, Microf)
- Batch maintenance invoice upload and validation
- Manual and automated batch funding processing

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

**US-7.1.3: Manage Phased Installation for Multi-Lease Project**
> As a **Dealer**, I want to authorize and record installation completion for each lease component in a multi-lease project separately, so that each phase of the project (e.g., Ground Loop installation followed by Equipment installation) can be tracked and funded independently.

**Acceptance Criteria:**
- Given a multi-lease project (e.g., Geothermal) with multiple lease components
- When I authorize installation for a specific component
- Then only that component's status changes to "Installation Authorized"
- And I can record completion for each component independently with its own date, details, and documentation
- And funding for each component is processed independently upon its completion
- And the overall project status reflects the progress of all components (e.g., "Phase 1 Complete — Awaiting Phase 2")
- And I can view a consolidated timeline of all installation phases for the project

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

---

## 7.5 Maintenance Funding

**US-7.5.1: Batch Upload Maintenance Invoices**
> As a **Dealer**, I want to upload multiple maintenance invoices at once through the dealer portal, so that I can efficiently submit all completed maintenance work for funding without entering each invoice individually.

**Acceptance Criteria:**
- Given I have completed maintenance work on multiple accounts
- When I select "Batch Upload Invoices" from the dealer portal
- Then I can upload a file (CSV or Excel) containing multiple maintenance invoices with account numbers, invoice amounts, service dates, and descriptions
- And the system validates each invoice against active maintenance agreements and flags any errors (invalid account, amount mismatch, duplicate invoice)
- And I can review the validation summary showing accepted and rejected invoices before confirming the submission
- And upon confirmation, all valid invoices are submitted for funding review
- And I receive a confirmation with a batch reference number and count of submitted invoices

---

**US-7.5.2: Review and Approve Maintenance Invoice Batch**
> As an **Administrator**, I want to review and approve batches of maintenance invoices, so that I can efficiently process maintenance funding requests while maintaining oversight.

**Acceptance Criteria:**
- Given a dealer has submitted a batch of maintenance invoices
- When I view the batch in the funding queue
- Then I see the batch summary (dealer name, invoice count, total amount, submission date)
- And I can expand to review individual invoices within the batch
- And I can approve the entire batch, reject the entire batch, or approve/reject individual invoices within the batch
- And rejected invoices include a reason that is communicated back to the dealer
- And approved invoices are queued for funding processing

---

**US-7.5.3: Process Batch Maintenance Funding — Manual**
> As an **Administrator**, I want to select multiple approved maintenance invoices and process their funding as a single batch, so that I can efficiently pay contractors for maintenance work.

**Acceptance Criteria:**
- Given there are approved maintenance invoices pending funding
- When I select multiple invoices (filtered by dealer, date range, or status) and initiate batch funding
- Then the system calculates the total funding amount per dealer
- And I can review the funding summary before confirming
- And upon confirmation, all selected invoices are processed as a single payment per dealer
- And each invoice's status updates to "Funded" with the batch reference and funding date
- And the contractor funding email notification is triggered for each dealer in the batch (see US-10.1.6)

---

**US-7.5.4: Process Batch Maintenance Funding — Automated**
> As a **System**, I want to automatically batch and process approved maintenance invoices for funding on a configurable schedule, so that contractors receive timely payment without manual intervention.

**Acceptance Criteria:**
- Given there are approved maintenance invoices that have not yet been funded
- When the scheduled batch funding cycle runs (e.g., daily at end of business, weekly)
- Then the system groups all eligible invoices by dealer
- And processes funding as a single payment per dealer
- And each invoice's status updates to "Funded" with the batch reference and funding date
- And the contractor funding email notification is triggered for each dealer in the batch (see US-10.1.6)
- And the batch schedule is configurable by an Administrator in platform settings
- And if processing fails for any invoice, it is flagged for manual review and does not block the remaining invoices in the batch
