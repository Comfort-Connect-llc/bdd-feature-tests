# Feature file generated from BRD User Stories
# Domain 1: Dealer/Contractor Onboarding
# Section 1.4: Partner Enrollment

Feature: Partner Enrollment
  Dealer/Contractor Onboarding

  @US-1-4-1 @domain-01
  Scenario: Enroll Dealer in Premier Program
    # As a Administrator, I want to enroll an approved dealer in the Premier Program
    # so that they can offer Premier leases to their customers
    Given a dealer has been approved
    When I activate their Premier enrollment
    Then the dealer can create Premier applications for homeowners
    And Premier appears as an available financing option

  @US-1-4-2 @domain-01
  Scenario: Initiate Momnt Partner Enrollment
    # As a Dealer, I want to enroll in the Momnt loan program
    # so that I can offer consumer loans to my customers
    Given I am an approved Comfort Connect dealer
    When I initiate Momnt enrollment
    Then I receive an invitation to complete Momnt's enrollment process
    And my enrollment status is tracked

  @US-1-4-3 @domain-01
  Scenario: Set Up Bank Account for Momnt
    # As a Dealer, I want to set up my bank account with Momnt
    # so that I can receive loan funding payments
    Given I am enrolling in the Momnt program
    When I provide my bank account details
    Then Momnt initiates micro-deposit verification
    And I can verify the deposits to complete bank verification

  @US-1-4-4 @domain-01 @validation
  Scenario: Verify Momnt Micro-Deposits
    # As a Dealer, I want to verify the micro-deposit amounts sent to my bank account
    # so that my bank account is confirmed
    Given Momnt has sent micro-deposits to my bank account
    When I enter the correct deposit amounts
    Then my bank account is verified
    And my Momnt enrollment advances

  @US-1-4-5 @domain-01
  Scenario: Complete Momnt Training
    # As a Dealer, I want to complete required Momnt training
    # so that I am certified to offer Momnt loans
    Given I am enrolled in the Momnt program
    When I complete the required training modules
    Then my training completion is recorded
    And my Momnt enrollment status is updated

  @US-1-4-6 @domain-01
  Scenario: Enroll Dealer in Microf Program
    # As a Administrator, I want to submit a dealer's enrollment to Microf
    # so that they can offer LTO financing
    Given a dealer has requested Microf enrollment
    When I submit their enrollment information to Microf
    Then the dealer receives a Microf dealer key upon approval
    And Microf appears as an available financing option

  @US-1-4-7 @domain-01
  Scenario: Enroll Dealer in Breeze Program
    # As a Administrator, I want to submit a dealer's enrollment to Breeze/Okinus
    # so that they can offer Breeze LTO financing
    Given a dealer has requested Breeze enrollment
    When I submit their enrollment to Breeze
    Then a Breeze store ID is assigned upon approval
    And Breeze appears as an available financing option

  @US-1-4-8 @domain-01
  Scenario: Enroll Dealer in Thrive Program
    # As a Administrator, I want to record a dealer's Thrive enrollment
    # so that they can offer Thrive loans
    Given a dealer has completed Thrive's enrollment process
    When I record their Thrive merchant ID
    Then Thrive appears as an available financing option

  @US-1-4-9 @domain-01
  Scenario: Refresh Partner Enrollment Status
    # As a System, I want to periodically refresh partner enrollment statuses
    # so that dealer partner access remains current
    Given a dealer has initiated enrollment with an external partner
    When the system checks enrollment status
    Then the dealer's enrollment status is updated
    And the dealer is notified of any status changes
