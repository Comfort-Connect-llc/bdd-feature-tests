# Feature file generated from BRD User Stories
# Domain 12: Maintenance & Servicing
# Section 12.1: Maintenance Requests

Feature: Maintenance Requests
  Maintenance & Servicing

  @US-12-1-1 @domain-12
  Scenario: Request Maintenance Service
    # As a Homeowner, I want to request maintenance service for my equipment
    # so that issues are addressed
    Given I have an active Premier enrollment
    When I submit a maintenance request
    Then the request is logged
    And the contractor is notified

  @US-12-1-2 @domain-12
  Scenario: Schedule Maintenance Appointment
    # As a Dealer, I want to schedule a maintenance appointment
    # so that service can be performed
    Given a maintenance request has been submitted
    When I schedule the appointment
    Then the homeowner is notified of the date and time
    And the appointment is tracked

  @US-12-1-3 @domain-12
  Scenario: Complete Maintenance Service
    # As a Dealer, I want to record that maintenance service is complete
    # so that the service is documented
    Given a maintenance appointment has occurred
    When I record completion
    Then the service details are documented
    And the homeowner receives confirmation
