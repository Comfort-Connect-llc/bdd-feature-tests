# Feature file generated from BRD User Stories
# Module 12: Administration
# Section 12.8: Platform Branding & Naming Consistency

Feature: Platform Branding & Naming Consistency
  Ensure that the platform displays "Comfort Connect" as the default brand name
  across all interfaces, and "Premier Program" appears only when the user is
  actively working with a specific Premier Program application.

  Background:
    Given I am logged into the Comfort Connect platform

  # --- US-12.8.1: Default Platform Branding ---

  @US-12-8-1 @domain-12 @branding
  Scenario: Platform displays "Comfort Connect" on general dashboard
    # As a User, I want all platform interfaces to display "Comfort Connect"
    # so that I have a consistent brand experience across the portal
    Given I am on the main dashboard
    When I view the page header, navigation, and browser tab title
    Then the platform name displayed is "Comfort Connect"
    And "Premier Program" does not appear in the page title or navigation labels

  @US-12-8-1 @domain-12 @branding
  Scenario: Platform displays "Comfort Connect" in navigation and breadcrumbs
    Given I am navigating between platform screens
    When I view the sidebar navigation, breadcrumbs, and top-level menus
    Then all navigation elements reference "Comfort Connect" as the platform name
    And "Premier Program" does not appear as a navigation label or menu header

  @US-12-8-1 @domain-12 @branding
  Scenario: Platform displays "Comfort Connect" in footer and help text
    Given I am on any platform screen
    When I view the page footer, help text, and support references
    Then they reference "Comfort Connect" as the platform name
    And "Premier Program" is not used as the platform name in footer or help content

  # --- US-12.8.2: Premier Program Context-Specific Display ---

  @US-12-8-2 @domain-12 @branding
  Scenario: "Premier Program" appears on a Premier Program application detail screen
    # As a User, I want to see "Premier Program" only when actively viewing
    # a Premier Program application
    Given I am viewing a specific Premier Program application
    When I see the application detail screen
    Then the product type is displayed as "Premier Program"
    And the platform-level header still displays "Comfort Connect"

  @US-12-8-2 @domain-12 @branding
  Scenario: "Premier Program" label is removed when navigating away from application
    Given I am viewing a specific Premier Program application detail screen
    When I navigate back to the application list or dashboard
    Then "Premier Program" no longer appears as a page-level label
    And the UI reverts to displaying "Comfort Connect" as the platform name

  @US-12-8-2 @domain-12 @branding
  Scenario: Premier Program underwriting decision screen shows product label
    Given I am reviewing the underwriting decision for a Premier Program application
    When I view the decision details
    Then the product type is identified as "Premier Program"
    And the platform header and navigation continue to display "Comfort Connect"

  @US-12-8-2 @domain-12 @branding
  Scenario: Premier Program offer selection screen shows product label
    Given I am a homeowner selecting an offer on a Premier Program application
    When I view the offer selection screen
    Then the offers are identified as "Premier Program" offers
    And the page header and navigation display "Comfort Connect"

  @US-12-8-2 @domain-12 @branding
  Scenario: Premier Program document signing screen shows product label
    Given I am signing documents for a Premier Program application
    When I view the document signing screen
    Then the documents reference "Premier Program" as the product
    And the platform-level branding remains "Comfort Connect"

  @US-12-8-2 @domain-12 @branding
  Scenario: Premier Program billing details show product label
    Given I am viewing billing details for a Premier Program account
    When I see the billing account information
    Then the product type is labeled "Premier Program"
    And the billing portal header displays "Comfort Connect"

  # --- US-12.8.3: Multi-Product Contexts Use "Comfort Connect" ---

  @US-12-8-3 @domain-12 @branding
  Scenario: Product selection screen displays "Comfort Connect" as platform name
    # As a Dealer, I want product selection screens to reference "Comfort Connect"
    # rather than "Premier Program" as the platform name
    Given I am on the product selection screen for a new application
    When I view the available financing products
    Then the page header displays "Comfort Connect"
    And "Premier Program" appears only as one product option alongside Momnt, Thrive, Microf, and Breeze
    And the platform name in navigation and breadcrumbs is "Comfort Connect"

  @US-12-8-3 @domain-12 @branding
  Scenario: Application list spanning multiple products uses "Comfort Connect" branding
    Given I am viewing a list of applications across all product types
    When I see the application list page
    Then the page title and header display "Comfort Connect"
    And "Premier Program" appears only as a filter option or product type column value
    And "Premier Program" is not used as the page title or platform identifier

  @US-12-8-3 @domain-12 @branding
  Scenario: Multi-product reports use "Comfort Connect" as platform identifier
    Given I am generating a report that spans multiple financing products
    When I view the report title, headers, and filter labels
    Then the report identifies the platform as "Comfort Connect"
    And "Premier Program" appears only as a filterable product type value

  # --- US-12.8.4: Communications and Notifications ---

  @US-12-8-4 @domain-12 @branding
  Scenario: General platform emails use "Comfort Connect" as sender name
    # As a Homeowner, I want emails to reference "Comfort Connect" unless
    # the communication is specifically about my Premier Program account
    Given a general platform email is being sent (welcome, password reset, announcement)
    When the email is composed
    Then the sender name is "Comfort Connect"
    And the email header and body reference "Comfort Connect" as the platform
    And "Premier Program" is not used as the platform name in the email

  @US-12-8-4 @domain-12 @branding
  Scenario: Premier Program account-specific email references product within Comfort Connect branding
    Given an email is being sent about a specific Premier Program account (payment reminder, lease document)
    When the email is composed
    Then the sender name is still "Comfort Connect"
    And the email body may reference "Premier Program" as the product name
    And the platform-level branding in the email header and footer is "Comfort Connect"

  @US-12-8-4 @domain-12 @branding
  Scenario: SMS notifications use "Comfort Connect" as sender identity
    Given an SMS notification is being sent
    When the message is a general platform notification
    Then the message identifies the sender as "Comfort Connect"
    And "Premier Program" is not used as the sender identity

  @US-12-8-4 @domain-12 @branding
  Scenario: In-portal notifications display "Comfort Connect" branding
    Given I receive an in-portal notification
    When the notification is a general platform alert
    Then the notification references "Comfort Connect"
    And "Premier Program" only appears if the notification is specific to a Premier Program application

  # --- US-12.8.5: Dealer Portal Branding ---

  @US-12-8-5 @domain-12 @branding
  Scenario: Dealer portal dashboard displays "Comfort Connect" branding
    # As a Dealer, I want my portal to be branded "Comfort Connect"
    Given I am a dealer logged into the portal
    When I view my dashboard
    Then the portal header displays "Comfort Connect"
    And the sidebar navigation displays "Comfort Connect"
    And "Premier Program" does not appear in navigation items or the dashboard title

  @US-12-8-5 @domain-12 @branding
  Scenario: Dealer application pipeline uses "Comfort Connect" branding
    Given I am a dealer viewing my application pipeline
    When I view the pipeline screen
    Then the page header displays "Comfort Connect"
    And "Premier Program" appears only as a product type filter option or column value within individual application rows

  @US-12-8-5 @domain-12 @branding
  Scenario: Dealer training and help resources reference "Comfort Connect"
    Given I am a dealer accessing training modules or help documentation
    When I view the training or help content
    Then the platform is referenced as "Comfort Connect"
    And "Premier Program" only appears when the training content is specifically about the Premier Program product
