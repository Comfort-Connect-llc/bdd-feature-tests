---
figma:
  file: "https://www.figma.com/file/FIGMA_FILE_ID/Comfort-Connect-Platform"
  page: "Module 13 - Integrations"
  frames:
    - id: "overview"
      name: "Module 13 - Integrations Overview"
      url: "TODO"
---

# Module 13: Integrations
## Third-Party Platform Integrations

**Version:** 1.0
**Date:** February 23, 2026
**Stories:** 22

---

## Overview

Manages integrations with third-party platforms that support marketing, operational support, and communication workflows. Ensures data flows between the Comfort Connect platform and external systems used by marketing, customer service, collections, and contractor support teams.

**Key Capabilities:**
- HubSpot integration for email campaigns and marketing engagement
- HubSpot Deals for dealer acquisition pipeline and onboarding status tracking
- ClickUp integration for operational support task management
- Aircall integration for customer service, collections, and contractor support calls
- Contact synchronization across platforms
- Activity and event syncing for unified reporting

---

## 13.1 HubSpot - Contact Synchronization

**US-13.1.1: Sync Homeowner Contacts to HubSpot**
> As a **System**, I want to automatically sync homeowner contact records to HubSpot, so that marketing can engage homeowners through email campaigns.

**Acceptance Criteria:**
- Given a homeowner account is created or updated on the platform
- When the sync process runs
- Then the homeowner's contact information (name, email, phone, account status) is created or updated in HubSpot
- And custom properties reflecting account type, enrollment status, and financing product are populated

---

**US-13.1.2: Sync Dealer Contacts to HubSpot**
> As a **System**, I want to automatically sync dealer and contractor owner contacts to HubSpot, so that marketing can engage contractors through targeted campaigns.

**Acceptance Criteria:**
- Given a dealer account is created, updated, or onboarding status changes
- When the sync process runs
- Then the dealer's contact information and key personnel are created or updated in HubSpot
- And custom properties reflecting enrollment status, partner programs, and company group are populated

---

**US-13.1.3: Sync Sales Rep and Admin Contacts to HubSpot**
> As a **System**, I want to automatically sync internal sales rep and admin contacts to HubSpot, so that internal teams are included in relevant communications and reporting.

**Acceptance Criteria:**
- Given an internal user account is created or updated
- When the sync process runs
- Then the user's contact information and role are created or updated in HubSpot
- And team assignments and permissions are reflected in HubSpot properties

---

## 13.2 HubSpot - Marketing Campaigns

**US-13.2.1: Trigger Campaign Enrollment Based on Platform Events**
> As a **System**, I want to enroll contacts in HubSpot marketing campaigns based on platform events, so that homeowners and dealers receive timely, relevant communications.

**Acceptance Criteria:**
- Given a qualifying event occurs on the platform (e.g., account activation, application approval, installation complete, payment milestone)
- When the event is detected
- Then the associated contact is enrolled in the appropriate HubSpot workflow or campaign
- And the triggering event details are passed to HubSpot for personalization

---

**US-13.2.2: Sync Email Engagement Data from HubSpot**
> As a **System**, I want to sync email engagement data (opens, clicks, unsubscribes) from HubSpot back to the platform, so that customer service and sales teams have visibility into marketing interactions.

**Acceptance Criteria:**
- Given a contact has received marketing emails through HubSpot
- When engagement events occur
- Then engagement data is synced back to the platform and associated with the relevant account
- And unsubscribe requests are respected across all platform-triggered communications

---

**US-13.2.3: Manage Marketing Consent and Preferences**
> As a **Homeowner**, I want my communication preferences on the Comfort Connect platform to be reflected in HubSpot, so that I only receive marketing communications I've opted into.

**Acceptance Criteria:**
- Given I update my notification or marketing preferences on the platform
- When the preference change is synced to HubSpot
- Then my HubSpot subscription status reflects my current preferences
- And I am removed from or added to campaigns accordingly

---

## 13.3 HubSpot - Deals & Pipeline Management

**US-13.3.1: Create HubSpot Deal for Dealer Prospect**
> As a **System**, I want to automatically create a HubSpot Deal when a prospective dealer is identified or invited, so that the Business Development and Sales teams can track acquisition efforts.

**Acceptance Criteria:**
- Given a new dealer prospect is identified or an application invitation is sent (US-2.1.1)
- When the event is recorded on the platform
- Then a HubSpot Deal is created in the appropriate pipeline
- And the Deal includes the dealer's business name, contact info, source, and assigned BD rep
- And the Deal stage is set to reflect the current status (e.g., "Invitation Sent")

---

**US-13.3.2: Sync Dealer Onboarding Status to HubSpot Deal**
> As a **System**, I want to automatically update the HubSpot Deal stage as a dealer progresses through onboarding, so that Sales and Marketing have real-time visibility into the acquisition pipeline.

**Acceptance Criteria:**
- Given a dealer's onboarding status changes on the platform (e.g., application submitted, NDA signed, merchant agreement signed, underwriting approved, partner enrollment complete, onboarding complete)
- When the status change is recorded
- Then the associated HubSpot Deal stage is updated to reflect the current onboarding step
- And key milestone dates are captured on the Deal record
- And if the application is declined, the Deal is moved to a "Lost" stage with the decline reason

---

**US-13.3.3: Sync Deal Revenue and Enrollment Data to HubSpot**
> As a **System**, I want to sync dealer enrollment and revenue-related data to the HubSpot Deal, so that Sales and Marketing can track deal value and report on acquisition performance.

**Acceptance Criteria:**
- Given a dealer completes onboarding and begins originating applications
- When enrollment and activity data is available
- Then the HubSpot Deal is updated with partner programs enrolled, projected deal value, and first application date
- And the Deal is moved to a "Won" stage upon full activation

---

**US-13.3.4: View HubSpot Deal Activity on Dealer Account**
> As a **Sales Representative**, I want to view HubSpot Deal activity and notes on a dealer's platform account, so that I have full context on the business development relationship.

**Acceptance Criteria:**
- Given a dealer account has an associated HubSpot Deal
- When I view the dealer account on the platform
- Then I see the current Deal stage, assigned owner, recent activity, and key dates
- And I can navigate to the full Deal record in HubSpot

---

## 13.4 ClickUp - Operational Support Tasks

**US-13.4.1: Create ClickUp Task for Buyout Request**
> As a **System**, I want to automatically create a ClickUp task when a homeowner requests a Premier Program buyout, so that the operational support team can track and manage the buyout process.

**Acceptance Criteria:**
- Given a homeowner submits a buyout request on the platform
- When the request is recorded
- Then a ClickUp task is created in the appropriate buyout list/space
- And the task includes homeowner name, account number, buyout amount, and request date
- And the task is assigned based on configured routing rules

---

**US-13.4.2: Create ClickUp Task for Maintenance Follow-Up**
> As a **System**, I want to automatically create a ClickUp task when a maintenance issue requires follow-up with a contractor, so that the operational support team can track resolution.

**Acceptance Criteria:**
- Given a maintenance request requires operational follow-up (e.g., contractor non-response, escalation, or dispute)
- When the follow-up is triggered
- Then a ClickUp task is created in the appropriate maintenance support list/space
- And the task includes homeowner details, contractor details, equipment info, and issue description
- And the task is assigned based on configured routing rules

---

**US-13.4.3: Sync ClickUp Task Status to Platform**
> As a **System**, I want to sync ClickUp task status updates back to the platform, so that customer service reps and homeowners can see the current status of their operational support items.

**Acceptance Criteria:**
- Given a ClickUp task associated with a platform account is updated
- When the status changes in ClickUp
- Then the corresponding record on the platform reflects the updated status
- And relevant parties (homeowner, dealer, CSR) are notified of significant status changes

---

**US-13.4.4: View ClickUp Task History on Account**
> As a **Customer Service Representative**, I want to view ClickUp operational support task history on a customer account, so that I have full context when assisting the customer.

**Acceptance Criteria:**
- Given a customer account has associated ClickUp tasks
- When I view the account
- Then I see a summary of all linked ClickUp tasks with their current status
- And I can navigate to the full task details in ClickUp

---

**US-13.4.5: Configure ClickUp Integration Routing Rules**
> As an **Administrator**, I want to configure how platform events map to ClickUp spaces, lists, and assignees, so that operational support tasks are routed correctly.

**Acceptance Criteria:**
- Given operational support workflows need to be configured
- When I set up routing rules (event type to ClickUp space/list, assignment rules, priority mapping)
- Then new tasks are created according to the configured rules
- And existing rules can be updated without code changes

---

## 13.5 Aircall - Call Management

**US-13.5.1: Display Account Context on Incoming Calls**
> As a **Customer Service Representative**, I want to see the caller's account information automatically when a call comes in through Aircall, so that I can assist them efficiently without manual lookup.

**Acceptance Criteria:**
- Given an incoming call is received through Aircall
- When the caller's phone number matches a platform contact (homeowner, dealer, or contractor)
- Then the associated account summary is displayed to the representative
- And recent activity, open issues, and account status are visible

---

**US-13.5.2: Log Aircall Calls to Account History**
> As a **System**, I want to automatically log Aircall call records to the associated platform account, so that all customer interactions are documented.

**Acceptance Criteria:**
- Given a call is completed through Aircall
- When the call record is available
- Then the call details (date, time, duration, representative, call type, notes) are logged to the account
- And the call recording link is associated with the account record

---

**US-13.5.3: Route Calls Based on Account Context**
> As a **System**, I want to route incoming Aircall calls based on account context, so that callers reach the right team (customer service, collections, or contractor support).

**Acceptance Criteria:**
- Given an incoming call is received
- When the caller's phone number is matched to an account
- Then the call is routed based on account type and status (e.g., delinquent accounts to collections, dealers to contractor support)
- And if no match is found, the call follows the default routing rules

---

**US-13.5.4: Initiate Outbound Calls from Platform**
> As a **Customer Service Representative**, I want to initiate an outbound call through Aircall directly from a customer's account on the platform, so that I can contact them without switching applications.

**Acceptance Criteria:**
- Given I am viewing a customer or dealer account
- When I click to call the contact's phone number
- Then an outbound call is initiated through Aircall
- And the call is automatically logged to the account

---

**US-13.5.5: Sync Aircall Call Dispositions to Platform**
> As a **System**, I want to sync call dispositions and tags from Aircall to the platform, so that call outcomes are captured for reporting and follow-up.

**Acceptance Criteria:**
- Given a representative completes a call and sets a disposition in Aircall
- When the disposition is recorded
- Then the disposition and any tags are synced to the platform account record
- And follow-up actions are triggered based on disposition (e.g., "callback requested" creates a task)

---

**US-13.5.6: Track Collections Call Activity**
> As an **Administrator**, I want to track collections call activity from Aircall, so that I can monitor collections efforts and compliance.

**Acceptance Criteria:**
- Given collections calls are made through Aircall
- When call activity is synced
- Then I can view collections call volume, outcomes, and contact rates by account and representative
- And call activity is correlated with delinquency status from Module 8
