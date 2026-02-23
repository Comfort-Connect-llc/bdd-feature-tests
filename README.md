# Comfort Connect BDD Test Suite

Behavior-Driven Development (BDD) test suite for the Comfort Connect POS Origination Platform, powered by Cucumber and Playwright.

## Overview

This test suite contains **240 user stories** across **21 domains**, converted into **77 executable feature files** using Gherkin syntax.

## 📁 Project Structure

```
userstories/
├── BRD/                          # Source BRD documentation (DO NOT DELETE)
│   ├── BRD_User_Stories_Index.md
│   └── BRD_User_Stories_Part1-5.md
├── features/                     # BDD test features
│   ├── domain-01-dealer-onboarding/
│   ├── domain-02-user-management/
│   ├── ... (21 domains total)
│   ├── step-definitions/        # Step implementations
│   │   ├── common-steps.js
│   │   └── dealer-onboarding-steps.js
│   ├── support/                 # Test infrastructure
│   │   ├── world.js            # Cucumber World context
│   │   ├── hooks.js            # Before/After hooks
│   │   └── helpers.js          # Utility functions
│   ├── TRACEABILITY_MAP.json   # US-ID → Feature file mapping
│   └── CONVERSION_SUMMARY.md   # Conversion statistics
├── reports/                     # Test reports (generated)
├── convert-to-features.js       # Conversion script
├── cucumber.js                  # Cucumber configuration
├── playwright.config.js         # Playwright configuration
└── package.json
```

## 🚀 Getting Started

### Prerequisites

- Node.js 18+ and npm
- Your application running locally (or update `.env` for remote)

### Installation

```bash
# Install dependencies
npm install

# Install Playwright browsers
npm run playwright:install

# Copy environment configuration
cp .env.example .env

# Edit .env with your application URLs
```

### Running Tests

```bash
# Run all tests
npm test

# Run with parallel execution (4 workers)
npm run test:parallel

# Run specific domain
DOMAIN=01 npm run test:domain

# Run by tags
npm run test:tags "@smoke"
npm run test:tags "@domain-01"
npm run test:tags "@email and @application"

# Run with HTML report
npm run test:report

# Debug mode (fail fast)
npm run test:debug
```

### Development Mode

```bash
# Run with visible browser (non-headless)
HEADLESS=false npm test

# Run with slow motion (helps see what's happening)
SLOW_MO=500 npm test

# Enable debug logging
DEBUG=true npm test
```

## 📝 Writing Tests

### Feature Files (Gherkin)

Feature files are located in `features/domain-XX-*/` directories:

```gherkin
Feature: Merchant Application
  Dealer/Contractor Onboarding

  @US-1-1-1 @domain-01 @smoke
  Scenario: Invite dealer to apply
    Given a valid dealer contact email and business name
    When I send a merchant application invitation
    Then the dealer receives an email with a secure link
    And the application record is created with status "Invitation Sent"
```

### Step Definitions

Create step definitions in `features/step-definitions/`:

```javascript
const { Given, When, Then } = require('@cucumber/cucumber');
const { expect } = require('@playwright/test');

Given('a valid dealer contact email and business name', function () {
  this.store('dealerEmail', generateTestData('email'));
  this.store('businessName', generateTestData('businessName'));
});

When('I send a merchant application invitation', async function () {
  await this.goto('/admin/dealer/invite');
  await this.page.fill('[name="email"]', this.retrieve('dealerEmail'));
  await this.page.click('button:has-text("Send Invitation")');
});
```

## 🏷️ Tags

All scenarios are tagged for flexible test execution:

- `@US-X-Y-Z` - User story ID (traceability)
- `@domain-XX` - Domain number (01-21)
- `@smoke` - Critical path tests
- `@api` - API-only tests (no browser)
- `@slow` - Tests requiring extended timeout
- Feature-specific tags: `@email`, `@payment`, `@credit`, `@application`, etc.

### Tag Examples

```bash
# Run only smoke tests
npm run test:tags "@smoke"

# Run domain 1 tests
npm run test:tags "@domain-01"

# Run email-related tests across all domains
npm run test:tags "@email"

# Run tests for specific user story
npm run test:tags "@US-1-1-1"

# Combine tags (AND)
npm run test:tags "@domain-01 and @smoke"

# Exclude tags (NOT)
npm run test:tags "not @slow"
```

## 🔄 Regenerating Features

If you update the BRD markdown files in the `BRD/` folder:

```bash
# Regenerate all feature files
node convert-to-features.js

# This will:
# - Parse BRD/BRD_User_Stories_Part*.md files
# - Generate .feature files in features/domain-XX-*/
# - Update TRACEABILITY_MAP.json
# - Create new CONVERSION_SUMMARY.md
```

## 🧪 Test Environment

### World Context

Every scenario has access to a `World` context with:

```javascript
this.page          // Playwright page object
this.browser       // Playwright browser
this.context       // Playwright context
this.appURL        // Application base URL
this.apiURL        // API base URL
this.store(k, v)   // Store data for scenario
this.retrieve(k)   // Retrieve stored data
this.goto(path)    // Navigate to path
this.apiRequest()  // Make API call
```

### Helper Functions

Available in `features/support/helpers.js`:

```javascript
generateTestData(type)  // Generate test email, phone, SSN, etc.
waitFor(condition)      // Wait for condition to be true
formatCurrency(amount)  // Format as USD
isVisible(page, sel)    // Check element visibility
fillForm(page, fields)  // Fill multiple fields
```

## 📊 Reports

Test reports are generated in `reports/`:

- `cucumber-report.html` - Human-readable HTML report
- `cucumber-report.json` - Machine-readable JSON
- `cucumber-report.xml` - JUnit XML (for CI/CD)
- `playwright-report/` - Playwright HTML report
- `videos/` - Videos of failed tests (if enabled)

### Viewing Reports

```bash
# After running tests
open reports/cucumber-report.html
open reports/playwright-report/index.html
```

## 🔍 Traceability

Every scenario is traceable back to the original BRD:

```bash
# View traceability map
cat features/TRACEABILITY_MAP.json

# Find feature file for specific user story
cat features/TRACEABILITY_MAP.json | jq '.[] | select(.usId == "US-1.1.1")'
```

## 🎨 Design Integration

This repo is the **single source of truth** for all product requirements, including UI/UX designs. Figma links are embedded directly in BRD user stories.

```bash
# View Figma design index
cat designs/figma-index.json

# Validate all Figma links
node scripts/validate-figma-links.js
```

**See:** [FIGMA_DESIGN_LINKING.md](FIGMA_DESIGN_LINKING.md) for conventions and PO guide.

## 🐛 Debugging

### Screenshots on Failure

Screenshots are automatically captured on test failure and attached to the report.

### Debug a Specific Scenario

```bash
# Run in headed mode with slow motion
HEADLESS=false SLOW_MO=500 npm run test:tags "@US-1-1-1"
```

### Playwright Inspector

```bash
# Enable Playwright inspector
PWDEBUG=1 npm test
```

## 🔧 Configuration

### Cucumber Config (`cucumber.js`)

- Test paths and profiles
- Formatters and reporters
- Parallel execution settings

### Playwright Config (`playwright.config.js`)

- Browser settings (chromium, firefox, webkit)
- Timeouts and retries
- Screenshot/video capture
- Base URLs

### Environment Variables (`.env`)

- Application URLs
- Test behavior (headless, slow-mo, debug)
- CI/CD settings

## 📚 Domain Coverage

| Domain | Name | Stories | Feature Files |
|--------|------|---------|---------------|
| 01 | Dealer/Contractor Onboarding | 16 | 5 |
| 02 | User & Profile Management | 9 | 3 |
| 03 | Homeowner Prequalification | 7 | 3 |
| 04 | Premier Program Origination | 22 | 8 |
| 05 | Loan Partner Origination | 9 | 2 |
| 06 | LTO Partner Origination | 14 | 2 |
| 07 | Pricing & Quotes | 7 | 3 |
| 08 | Credit & Underwriting | 12 | 3 |
| 09 | Income & Property Verification | 8 | 2 |
| 10 | Document Management | 12 | 3 |
| 11 | Billing & Payments | 20 | 6 |
| 12 | Maintenance & Servicing | 8 | 4 |
| 13 | Equipment Management | 5 | 3 |
| 14 | Installation & Funding | 12 | 4 |
| 15 | Notifications & Communications | 13 | 5 |
| 16 | Customer Service & Support | 10 | 5 |
| 17 | Promotions & Incentives | 6 | 2 |
| 18 | Learning Management | 7 | 3 |
| 19 | Account Lifecycle Management | 10 | 4 |
| 20 | Configuration & Administration | 6 | 3 |
| 21 | Reporting & Analytics | 8 | 4 |

**Total: 240 user stories → 77 feature files**

## 🚦 CI/CD Integration

### GitHub Actions Example

```yaml
name: BDD Tests
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: 18
      - run: npm ci
      - run: npx playwright install --with-deps
      - run: npm test
      - uses: actions/upload-artifact@v3
        if: always()
        with:
          name: test-reports
          path: reports/
```

## 📖 Resources

- [Cucumber Documentation](https://cucumber.io/docs/cucumber/)
- [Playwright Documentation](https://playwright.dev/)
- [Gherkin Syntax Reference](https://cucumber.io/docs/gherkin/reference/)

## 🤝 Contributing

1. Update BRD markdown files in `BRD/` folder with new user stories
2. Add Figma design links to stories with UI components (see [FIGMA_DESIGN_LINKING.md](FIGMA_DESIGN_LINKING.md))
3. Run `node convert-to-features.js` to regenerate feature files
4. Implement step definitions in `features/step-definitions/`
5. Run tests to verify: `npm test`
6. Run `node scripts/validate-figma-links.js` to check design links
7. Commit BRD, feature files, and design index updates

## 📄 License

MIT
