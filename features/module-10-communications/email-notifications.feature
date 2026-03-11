# Feature file generated from BRD User Stories
# Domain 15: Notifications & Communications
# Section 15.1: Email Notifications

Feature: Email Notifications
  Notifications & Communications

  @US-15-1-1 @domain-15 @email @application
  Scenario: Send Application Status Email
    # As a System, I want to send email notifications when application status changes
    # so that stakeholders are informed
    Given an application status has changed
    When the notification is triggered
    Then the appropriate parties (homeowner, dealer) receive an email
    And the email contains relevant status information

  @US-15-1-2 @domain-15 @email @signature @document
  Scenario: Send Document Signing Request Email
    # As a System, I want to send an email with a document signing link
    # so that signers can complete their signatures
    Given a document is ready for signing
    When the signing request is triggered
    Then the recipient receives an email with a signing link
    And the email explains what needs to be signed

  @US-15-1-3 @domain-15 @email @payment
  Scenario: Send Payment Reminder Email
    # As a System, I want to send payment reminder emails
    # so that homeowners are reminded of upcoming or past due payments
    Given a payment is upcoming or past due
    When the reminder is triggered
    Then the homeowner receives an email with payment details
    And a link to make payment

  @US-15-1-4 @domain-15 @email
  Scenario: Send Welcome Email
    # As a System, I want to send welcome emails when accounts are activated
    # so that users know how to get started
    Given a new account has been activated
    When the welcome email is triggered
    Then the user receives an email with login instructions and helpful information

  @US-15-1-5 @domain-15
  Scenario: Send Adverse Action Letter
    # As a System, I want to send adverse action letters via email
    # so that declined applicants receive required disclosures
    Given an application has been declined
    When the adverse action letter is generated
    Then it is sent via email to the applicant
    And delivery is confirmed

  @US-10-1-7 @module-10 @momnt @email @welcome-call
  Scenario: Send Momnt Welcome Call Notification to Homeowner
    # As a System, I want to send a proactive notification to the homeowner after they
    # accept a Momnt loan offer, so that they are informed that a Welcome Call from Momnt
    # is the next step in finalizing their loan and can proactively complete it
    Given a homeowner has accepted a Momnt loan offer
    When the acceptance is recorded on the platform
    Then the system sends an email notification to the homeowner explaining that Momnt will conduct a Welcome Call within the next few days to verify their loan details
    And the notification includes guidance that the homeowner should expect a call from Momnt and should answer to avoid delays
    And the notification includes Momnt contact information so the homeowner can proactively reach out to complete the Welcome Call
    And the notification is sent only once per loan acceptance and not re-sent on subsequent status changes
    And the notification content is configurable by an administrator
