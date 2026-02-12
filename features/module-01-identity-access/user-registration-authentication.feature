# Feature file generated from BRD User Stories
# Domain 2: User & Profile Management
# Section 2.1: User Registration & Authentication

Feature: User Registration & Authentication
  User & Profile Management

  @US-2-1-1 @domain-02
  Scenario: Register Dealer User Account
    # As a Dealer Employee, I want to register for an account on the platform
    # so that I can access dealer portal features
    Given I have been invited by my company's administrator
    When I complete the registration process
    Then my account is created
    And I receive a one-time password (OTP) to verify my identity

  @US-2-1-2 @domain-02
  Scenario: Authenticate via OTP
    # As a User, I want to authenticate using a one-time password
    # so that I can securely access my account
    Given I am attempting to log in
    When I request an OTP
    Then I receive a code via SMS or email
    And when I enter the correct code, I am granted access

  @US-2-1-3 @domain-02
  Scenario: Register Homeowner Account
    # As a Homeowner, I want to create an account
    # so that I can view my financing details and manage my account
    Given I have an active financing agreement
    When I register using my email and account information
    Then my account is created
    And I can access my homeowner portal
