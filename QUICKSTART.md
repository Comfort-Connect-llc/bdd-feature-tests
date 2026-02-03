# Quick Start Guide

Get your BDD test suite running in 5 minutes!

## Step 1: Install Dependencies

```bash
npm install
npm run playwright:install
```

## Step 2: Configure Environment

```bash
cp .env.example .env
```

Edit `.env` and set your application URLs:

```bash
APP_URL=http://localhost:3000
API_URL=http://localhost:4000
```

## Step 3: Run Your First Test

```bash
# Run a single smoke test
npm run test:tags "@US-1-1-1"
```

## Step 4: View Results

Open the generated report:

```bash
open reports/cucumber-report.html
```

## What's Next?

### Run More Tests

```bash
# Run all tests in domain 1 (dealer onboarding)
npm run test:tags "@domain-01"

# Run smoke tests across all domains
npm run test:tags "@smoke"

# Run all tests (will take longer)
npm test
```

### Implement More Step Definitions

1. Look at the feature files in `features/domain-XX-*/`
2. Run a test to see which steps are undefined
3. Add step definitions to `features/step-definitions/`
4. Use the provided helpers in `features/support/helpers.js`

### Example: Adding a New Step

When you run a test with an undefined step, Cucumber will suggest:

```javascript
When('I do something new', async function () {
  // Write code here that turns the phrase above into concrete actions
});
```

Add this to the appropriate step definition file and implement it!

### Watch Mode During Development

```bash
# See browser actions (non-headless)
HEADLESS=false npm run test:tags "@domain-01"

# Slow down for visibility
SLOW_MO=1000 npm run test:tags "@US-1-1-1"
```

## Common Issues

### Port Already in Use

Make sure your app is running on the configured port, or update `.env`:

```bash
APP_URL=http://localhost:YOUR_PORT
```

### Playwright Browsers Not Installed

```bash
npm run playwright:install
```

### Step Definition Not Found

Check that your step definition file is in `features/step-definitions/` and uses the correct pattern matching.

## Need Help?

- Check the full [README.md](README.md) for detailed documentation
- Review example step definitions in `features/step-definitions/dealer-onboarding-steps.js`
- Look at the helpers in `features/support/helpers.js`
- Check [Cucumber docs](https://cucumber.io/docs/cucumber/)
- Check [Playwright docs](https://playwright.dev/)

## Pro Tips

1. **Tag your scenarios** with `@smoke` for critical path tests
2. **Use parallel execution** for faster runs: `npm run test:parallel`
3. **Check traceability** in `features/TRACEABILITY_MAP.json` to find tests by US-ID
4. **Regenerate features** after updating BRD: `node convert-to-features.js`

Happy Testing! 🎉
