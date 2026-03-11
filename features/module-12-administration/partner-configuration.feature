# Feature file generated from BRD User Stories
# Domain 20: Configuration & Administration
# Section 20.1: Partner Configuration

Feature: Partner Configuration
  Configuration & Administration

  @US-20-1-1 @domain-20
  Scenario: Enable Partner for Company
    # As a Administrator, I want to enable financing partners for a company
    # so that they can offer those products
    Given a company is enrolled
    When I enable a partner (Premier, Momnt, Microf, Breeze, Thrive)
    Then the partner appears as an option for that company
    And their users can create applications for that partner

  @US-20-1-2 @domain-20
  Scenario: Disable Partner for Company
    # As a Administrator, I want to disable a financing partner for a company
    # so that they can no longer use it
    Given a company has a partner enabled
    When I disable the partner
    Then new applications cannot be created for that partner
    And existing applications continue to be serviced

  @US-20-1-3 @domain-20
  Scenario: Configure Global Partner Access
    # As a Administrator, I want to globally enable or disable partner access
    # so that I can control platform-wide availability
    Given a partner needs to be globally controlled
    When I configure the global access setting
    Then the setting takes precedence over company-level settings
    And all users are affected

  @US-12-3-6 @module-12 @momnt @charge-timing @configuration
  Scenario: Configure Momnt Charge Request Timing Rules
    # As an Administrator, I want to configure the rules that determine whether a Momnt
    # charge request should be initiated immediately or scheduled for a future date,
    # so that the platform can guide dealers on optimal charge timing based on installation proximity
    Given charge timing rules need to be configured for Momnt loans
    When I access the Momnt charge configuration settings
    Then I can set an immediate charge threshold in days where if the planned installation date is within this threshold the platform recommends immediate charge initiation
    And I can set a scheduled charge lead time in days before planned installation for when the installation date is beyond the immediate threshold
    And I can configure a minimum and maximum lead time for scheduled charges
    And I can enable or disable the scheduling option entirely forcing all charges to be immediate
    And changes to timing rules apply only to new charge requests and do not affect already-initiated or scheduled charges
    And I can view the current configuration with a summary of how many pending applications would be affected by a change
