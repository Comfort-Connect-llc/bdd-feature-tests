---
figma:
  file: "https://www.figma.com/file/FIGMA_FILE_ID/Comfort-Connect-Platform"
  page: "Module 09 - Account Servicing"
  frames:
    - id: "overview"
      name: "Module 09 - Account Servicing Overview"
      url: "TODO"
---

# Module 9: Account Servicing
## Maintenance, Customer Service, and Account Lifecycle

**Version:** 1.0  
**Date:** February 12, 2026  
**Stories:** 43

---

## Overview

Manages post-origination account activities including maintenance requests, customer service interactions, and account lifecycle events (buyout, termination, archival). Supports both homeowner self-service and internal customer service operations.

**Key Capabilities:**
- Service request creation and tracking
- Equipment status visibility for homeowners
- Servicing contractor information
- Maintenance reminder scheduling
- Service claim funding
- Worry-Free Rewards enrollment, earning, redemption, and administration
- Rewards suspension, forfeiture, and manager override
- Customer account lookup and research
- Task creation, assignment, and tracking
- Account notes and history
- Issue escalation workflows
- Account status transitions
- Lease buyout calculation and processing
- Account termination and archival

---

## 9.1 Maintenance Requests

**US-9.1.1: Request Maintenance Service**
> As a **Homeowner**, I want to request maintenance service for my equipment, so that issues are addressed.

**Acceptance Criteria:**
- Given I have an active Premier enrollment
- When I submit a maintenance request
- Then the request is logged
- And the contractor is notified

---

**US-9.1.2: Schedule Maintenance Appointment**
> As a **Dealer**, I want to schedule a maintenance appointment, so that service can be performed.

**Acceptance Criteria:**
- Given a maintenance request has been submitted
- When I schedule the appointment
- Then the homeowner is notified of the date and time
- And the appointment is tracked

---

**US-9.1.3: Complete Maintenance Service**
> As a **Dealer**, I want to record that maintenance service is complete, so that the service is documented.

**Acceptance Criteria:**
- Given a maintenance appointment has occurred
- When I record completion
- Then the service details are documented
- And the homeowner receives confirmation

---

**US-9.1.4: View Equipment Status**
> As a **Homeowner**, I want to view the status of my installed equipment, so that I can see what's installed, when it was installed, and its current service status.

**Acceptance Criteria:**
- Given I have an active Premier enrollment with installed equipment
- When I view my equipment details
- Then I see equipment make, model, serial number, and installation date
- And I see current warranty and service status
- And I see service history for each piece of equipment

---

## 9.2 Maintenance Reminders

**US-9.2.1: Send Scheduled Maintenance Reminder**
> As a **System**, I want to send scheduled maintenance reminders to homeowners, so that regular service is performed.

**Acceptance Criteria:**
- Given an account is due for scheduled maintenance
- When the reminder is triggered
- Then the homeowner receives a notification
- And can request service through the reminder

---

**US-9.2.2: Configure Maintenance Schedule**
> As an **Administrator**, I want to configure maintenance schedules, so that reminders are sent at appropriate intervals.

**Acceptance Criteria:**
- Given maintenance schedule parameters
- When I configure the schedule
- Then reminders are triggered according to the schedule

---

## 9.3 Maintenance Funding

**US-9.3.1: Process Maintenance Invoice**
> As a **System**, I want to process maintenance invoices, so that contractors are compensated for service.

**Acceptance Criteria:**
- Given a maintenance service has been completed
- When the invoice is submitted
- Then the invoice is processed for payment
- And the contractor is paid

---

**US-9.3.2: Track Maintenance Costs**
> As an **Administrator**, I want to track maintenance costs per account, so that profitability can be analyzed.

**Acceptance Criteria:**
- Given maintenance has been performed
- When I view maintenance costs
- Then I see all service costs associated with the account

---

## 9.4 Worry-Free Rewards - Enrollment

**US-9.4.1: Enroll in Worry-Free Rewards**
> As a **Homeowner**, I want to enroll in the Worry-Free Rewards program, so that I can earn rewards for on-time payments made while enrolled in Autopay.

**Acceptance Criteria:**
- Given I have an active Premier account and am enrolled in Autopay
- When I enroll in Worry-Free Rewards (or am auto-enrolled based on program configuration)
- Then my enrollment is recorded with a timestamp
- And I begin earning rewards based on qualifying on-time payments
- And I receive confirmation of my enrollment along with the program terms

---

**US-9.4.2: Configure Rewards Enrollment Mode**
> As an **Administrator**, I want to configure whether the Worry-Free Rewards program is opt-in or auto-enroll, so that the enrollment approach aligns with business strategy.

**Acceptance Criteria:**
- Given the Worry-Free Rewards program is active
- When I configure the enrollment mode (opt-in or auto-enroll for all Premier account holders)
- Then new accounts follow the configured enrollment mode
- And existing accounts are handled according to the transition rules I define
- And auto-enrolled homeowners have the option to opt out

---

## 9.5 Worry-Free Rewards - Earning & Calculation

**US-9.5.1: Calculate Quarterly Rewards**
> As a **System**, I want to calculate Worry-Free Rewards at the end of each calendar quarter, so that homeowners earn rewards accurately based on their qualifying on-time payments.

**Acceptance Criteria:**
- Given a homeowner is enrolled in the Worry-Free Rewards program
- When the calendar quarter ends
- Then the system calculates net qualifying payments (total on-time Autopay payments minus net Transactions such as late payments, returned payments, taxes, and fees)
- And rewards are calculated by multiplying the net amount by the configured earning rate (default 10%)
- And rewards are posted to the homeowner's Rewards Account within 30 days of quarter end
- And rewards are only calculated for payments within the first 120 months of the Agreement

---

**US-9.5.2: View Rewards Balance and History**
> As a **Homeowner**, I want to view my Worry-Free Rewards balance and earning history, so that I can track what I've earned and understand my rewards status.

**Acceptance Criteria:**
- Given I am enrolled in the Worry-Free Rewards program
- When I view my rewards dashboard
- Then I see my current rewards balance (where 1 Reward = $1)
- And I see a history of rewards earned by quarter with amounts and calculation details
- And I see which on-time payments contributed to my rewards
- And I see any adjustments or deductions applied to my rewards balance

---

**US-9.5.3: Adjust Rewards for Payment Changes**
> As a **System**, I want to adjust a homeowner's rewards balance when qualifying payments are cancelled, disputed, or refunded, so that rewards accurately reflect actual payment history.

**Acceptance Criteria:**
- Given a homeowner has earned rewards
- When a qualifying payment is cancelled, disputed, or refunded
- Then the rewards balance is adjusted accordingly
- And the adjustment may result in a negative rewards balance
- And any future rewards earned are first applied to bring the balance to zero before accumulating

---

## 9.6 Worry-Free Rewards - Redemption

**US-9.6.1: Redeem Rewards Toward New Premier Account**
> As a **Homeowner**, I want to redeem my rewards toward a new Premier Program account, so that I can reduce my monthly payments on a new system.

**Acceptance Criteria:**
- Given I have a positive rewards balance and my account is current
- When I redeem rewards toward a new Premier account (HVAC, water heater, tankless water heater, water filtration, standby generator, or other eligible products)
- Then the redeemed amount is applied equally as a monthly credit across the scheduled payments of the new account
- And my rewards balance is reduced accordingly
- And rewards from different accounts cannot be combined for a single redemption

---

**US-9.6.2: Redeem Rewards Toward Equipment Buyout**
> As a **Homeowner**, I want to redeem my rewards toward the Purchase Option or Extension Purchase Option price, so that I can reduce the cost of buying my equipment.

**Acceptance Criteria:**
- Given I have a positive rewards balance and my account is current
- When I redeem rewards toward my Purchase Option at the scheduled end of my Agreement or Extension Purchase Option during an extension term
- Then the redeemed amount is applied in full to the buyout price
- And any remaining rewards after the buyout is completed are forfeited

---

**US-9.6.3: Donate Rewards to Non-Profit Partner**
> As a **Homeowner**, I want to donate my rewards to a sustainability-focused non-profit partner, so that I can support decarbonization and environmental goals.

**Acceptance Criteria:**
- Given I have a positive rewards balance and my account is current
- When I choose to donate rewards at the scheduled end of my Agreement or during an extension term
- Then I can select from available non-profit partners
- And the donated amount is applied in full to the selected organization
- And donations are subject to a maximum of $500 per account
- And I receive confirmation of my donation

---

**US-9.6.4: Process Rewards Redemption**
> As a **System**, I want to process rewards redemptions according to the selected redemption path, so that rewards are applied correctly and balances are updated.

**Acceptance Criteria:**
- Given a homeowner has requested a rewards redemption
- When the redemption is processed
- Then the rewards balance is debited
- And the redemption is applied per the selected path (monthly credits, buyout price reduction, or non-profit donation)
- And the homeowner receives confirmation with redemption details
- And the redemption is recorded for audit and tax reporting purposes

---

## 9.7 Worry-Free Rewards - Suspension & Forfeiture

**US-9.7.1: Suspend Rewards for Delinquent Account**
> As a **System**, I want to suspend rewards earning and redemption when an account becomes past due, so that program restrictions are enforced per the terms.

**Acceptance Criteria:**
- Given a homeowner's account has a past due balance
- When the account is no longer current
- Then the homeowner can no longer earn new rewards
- And the homeowner cannot redeem existing rewards
- And the suspension is recorded on the account
- And if the account is brought current, earning and redemption eligibility are restored

---

**US-9.7.2: Forfeit Rewards on Account Closure or Transfer**
> As a **System**, I want to forfeit unredeemed rewards when an account is closed, terminated, or transferred, so that program terms are enforced.

**Acceptance Criteria:**
- Given a homeowner has unredeemed rewards
- When their account is closed, terminated, or transferred
- Then all unredeemed rewards are forfeited
- And the forfeiture is recorded on the account

---

**US-9.7.3: Handle Rewards for Deceased Account Holder**
> As a **System**, I want to handle rewards appropriately when an account holder is deceased, so that rewards are managed per program terms.

**Acceptance Criteria:**
- Given the primary account holder (Customer) is deceased
- When the death is recorded on the account
- Then if there is a co-applicant, unredeemed rewards are retained by the co-applicant
- And if there is no co-applicant, unredeemed rewards are forfeited
- And the estate is not eligible to redeem rewards regardless of how it was created

---

**US-9.7.4: Override Rewards Suspension or Forfeiture**
> As a **Manager**, I want to override a rewards suspension or forfeiture on a case-by-case basis, so that I can accommodate situations where the delinquency or issue is not entirely the customer's fault.

**Acceptance Criteria:**
- Given a homeowner's rewards have been suspended or forfeited
- When I review the circumstances and determine an override is warranted
- Then I can reinstate the rewards balance (partially or fully)
- And I can restore earning and redemption eligibility
- And the override is recorded with my rationale for audit purposes
- And the homeowner is notified of the reinstatement

---

## 9.8 Worry-Free Rewards - Administration

**US-9.8.1: Configure Rewards Program Rules**
> As an **Administrator**, I want to configure the Worry-Free Rewards program rules, so that earning rates, redemption options, and program policies can be adjusted as the business evolves.

**Acceptance Criteria:**
- Given the Worry-Free Rewards program is active
- When I configure program rules
- Then I can set the earning rate (default 10% of net qualifying payments)
- And I can configure the maximum earning period (default 120 months)
- And I can manage the list of eligible redemption products and non-profit partners
- And I can set the maximum donation amount per account (default $500)
- And I can configure delinquency suspension and forfeiture thresholds
- And changes take effect for the next calculation period without affecting previously posted rewards

---

**US-9.8.2: View Rewards Program Reporting**
> As an **Administrator**, I want to view reporting on the Worry-Free Rewards program, so that I can monitor program costs, engagement, and redemption activity.

**Acceptance Criteria:**
- Given the Worry-Free Rewards program has active participants
- When I view program reports
- Then I see total rewards earned, redeemed, suspended, and forfeited across all accounts
- And I see redemption breakdown by path (new account, buyout, donation)
- And I see enrollment rates and active participant counts
- And I can filter by date range, account status, and dealer

---

## 9.9 Customer Service - Account Lookup

**US-9.9.1: Search for Customer Account**
> As a **Customer Service Representative**, I want to search for customer accounts, so that I can assist them.

**Acceptance Criteria:**
- Given I need to find a customer account
- When I search by name, email, phone, or account number
- Then matching accounts are displayed
- And I can select the account to view details

---

**US-9.9.2: View Account Summary**
> As a **Customer Service Representative**, I want to view an account summary, so that I understand the customer's situation.

**Acceptance Criteria:**
- Given I have accessed a customer account
- When I view the summary
- Then I see key information including status, balance, payment history, and recent activity

---

**US-9.9.3: View Servicing Contractor Information**
> As a **Homeowner**, I want to view information about my servicing contractor, so that I know who to contact for service needs and can see their details.

**Acceptance Criteria:**
- Given I have an active account with an assigned servicing dealer
- When I view my contractor information
- Then I see the contractor's business name, phone number, and email
- And I see their service area and hours of operation

---

## 9.10 Customer Service - Task Management

**US-9.10.1: Create Service Task**
> As a **Customer Service Representative**, I want to create a task for follow-up, so that issues are tracked to resolution.

**Acceptance Criteria:**
- Given a customer issue requires follow-up
- When I create a task
- Then the task is associated with the account
- And can be assigned and tracked

---

**US-9.10.2: Assign Task to Team Member**
> As a **Customer Service Representative**, I want to assign tasks to team members, so that work is distributed appropriately.

**Acceptance Criteria:**
- Given a task needs assignment
- When I assign it to a team member
- Then the assignee is notified
- And the task appears in their queue

---

**US-9.10.3: Complete Service Task**
> As a **Customer Service Representative**, I want to mark tasks as complete, so that progress is tracked.

**Acceptance Criteria:**
- Given a task has been resolved
- When I mark it complete with notes
- Then the task is closed
- And the resolution is recorded

---

## 9.11 Customer Service - Notes & Comments

**US-9.11.1: Add Note to Account**
> As a **Customer Service Representative**, I want to add notes to an account, so that interaction history is documented.

**Acceptance Criteria:**
- Given I am viewing a customer account
- When I add a note
- Then the note is saved with timestamp and my name
- And is visible to other authorized users

---

**US-9.11.2: View Account Notes**
> As a **Customer Service Representative**, I want to view all notes on an account, so that I understand previous interactions.

**Acceptance Criteria:**
- Given an account has notes
- When I view notes
- Then I see all notes in chronological order
- And can filter by date or type

---

## 9.12 Customer Service - Document Access

**US-9.12.1: Access Account Documents**
> As a **Customer Service Representative**, I want to access documents associated with an account, so that I can assist with document-related inquiries.

**Acceptance Criteria:**
- Given an account has documents
- When I access the documents
- Then I can view and download all associated documents

---

## 9.13 Customer Service - Support Requests

**US-9.13.1: Submit Support Request**
> As a **Homeowner**, I want to submit a support request, so that I can get help with my account.

**Acceptance Criteria:**
- Given I have an issue or question
- When I submit a support request
- Then the request is logged
- And I receive confirmation with a reference number

---

**US-9.13.2: View Support Request Status**
> As a **Homeowner**, I want to view the status of my support requests, so that I know when to expect resolution.

**Acceptance Criteria:**
- Given I have submitted a support request
- When I check status
- Then I see the current status and any updates

---

## 9.14 Account Lifecycle - Status Management

**US-9.14.1: View Account Status History**
> As a **User**, I want to view the history of account status changes, so that I understand the account journey.

**Acceptance Criteria:**
- Given an account has had status changes
- When I view status history
- Then I see all status changes with dates and details

---

**US-9.14.2: Transition Account Status**
> As a **System**, I want to automatically transition account status based on events, so that accounts reflect their current state.

**Acceptance Criteria:**
- Given an account event occurs
- When the transition is triggered
- Then the account status is updated
- And stakeholders are notified

---

## 9.15 Account Lifecycle - Buyout Process

**US-9.15.1: Request Lease Buyout**
> As a **Homeowner**, I want to request a buyout of my Premier lease, so that I can own the equipment outright.

**Acceptance Criteria:**
- Given I have an active Premier lease
- When I request a buyout
- Then a buyout quote is generated
- And I receive the buyout amount and process

---

**US-9.15.2: Generate Buyout Quote**
> As a **System**, I want to generate a buyout quote, so that homeowners know the cost to purchase their equipment.

**Acceptance Criteria:**
- Given a buyout is requested
- When the quote is generated
- Then the buyout amount includes remaining principal and any applicable fees

---

**US-9.15.3: Process Buyout Payment**
> As a **Homeowner**, I want to pay my buyout amount, so that I complete the buyout.

**Acceptance Criteria:**
- Given a buyout quote has been accepted
- When I make the buyout payment
- Then the payment is processed
- And the buyout is completed

---

**US-9.15.4: Complete Buyout Process**
> As a **System**, I want to complete the buyout process, so that the lease is properly closed.

**Acceptance Criteria:**
- Given a buyout payment has been received
- When the buyout is processed
- Then the lease is terminated
- And the status changes to "Buyout Processed"
- And the homeowner receives confirmation of ownership

---

**US-9.15.5: Cancel Buyout Request**
> As a **Homeowner**, I want to cancel my buyout request, so that I can continue my lease if I change my mind.

**Acceptance Criteria:**
- Given I have requested a buyout but not paid
- When I cancel the request
- Then the buyout is cancelled
- And my lease continues normally

---

## 9.16 Account Lifecycle - Termination

**US-9.16.1: Request Account Cancellation**
> As a **Homeowner**, I want to request cancellation of my account, so that I can end my agreement.

**Acceptance Criteria:**
- Given I have an active account
- When I request cancellation
- Then the request is logged
- And the cancellation process begins

---

**US-9.16.2: Process Account Termination**
> As an **Administrator**, I want to process account terminations, so that accounts are properly closed.

**Acceptance Criteria:**
- Given a termination is warranted
- When I process the termination
- Then the account status changes to "Terminated"
- And billing stops
- And all parties are notified

---

**US-9.16.3: Terminate for Non-Payment**
> As a **System**, I want to terminate accounts for prolonged non-payment, so that uncollectable accounts are closed.

**Acceptance Criteria:**
- Given an account has been delinquent for an extended period
- When termination criteria are met
- Then the account is terminated
- And appropriate collection actions are triggered

---

## 9.17 Account Lifecycle - Archiving

**US-9.17.1: Archive Completed Account**
> As a **System**, I want to archive completed accounts, so that they are preserved for historical reference.

**Acceptance Criteria:**
- Given an account has been completed, bought out, or terminated
- When archiving criteria are met
- Then the account is archived
- And historical data is preserved

---

**US-9.17.2: Retrieve Archived Account**
> As a **Customer Service Representative**, I want to retrieve archived accounts, so that historical inquiries can be answered.

**Acceptance Criteria:**
- Given an account has been archived
- When I search for it
- Then the archived account data is retrievable
- And I can view historical information
