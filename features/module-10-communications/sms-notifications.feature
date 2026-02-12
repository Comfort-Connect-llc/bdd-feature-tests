# Feature file generated from BRD User Stories
# Domain 15: Notifications & Communications
# Section 15.2: SMS Notifications

Feature: SMS Notifications
  Notifications & Communications

  @US-15-2-1 @domain-15 @sms
  Scenario: Send OTP via SMS
    # As a System, I want to send one-time passwords via SMS
    # so that users can authenticate securely
    Given a user requests OTP authentication
    When the OTP is generated
    Then it is sent via SMS to the user's registered phone number
    And the OTP expires after a set time

  @US-15-2-2 @domain-15 @sms @application
  Scenario: Send Application Invitation via SMS
    # As a System, I want to send application invitations via SMS
    # so that homeowners receive them on their mobile devices
    Given a dealer sends an invitation with SMS option
    When the invitation is triggered
    Then the homeowner receives an SMS with a link to the application

  @US-15-2-3 @domain-15 @sms @payment
  Scenario: Send Payment Confirmation via SMS
    # As a System, I want to send payment confirmations via SMS
    # so that homeowners have immediate confirmation
    Given a payment has been processed
    When SMS notification is enabled
    Then the homeowner receives an SMS confirming the payment amount
