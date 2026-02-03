/**
 * Cucumber Hooks - Before/After scenario actions
 */

const { Before, After, BeforeAll, AfterAll, Status } = require('@cucumber/cucumber');

BeforeAll(async function () {
  console.log('🚀 Starting Comfort Connect BDD Test Suite');
  console.log(`📍 App URL: ${process.env.APP_URL || 'http://localhost:3000'}`);
  console.log(`📍 API URL: ${process.env.API_URL || 'http://localhost:4000'}`);
});

AfterAll(async function () {
  console.log('✅ Test suite complete');
});

Before(async function ({ pickle }) {
  console.log(`\n🧪 Starting scenario: ${pickle.name}`);
  console.log(`   Tags: ${pickle.tags.map(t => t.name).join(', ')}`);

  // Initialize browser for this scenario
  await this.init();
});

After(async function ({ result, pickle }) {
  // Take screenshot on failure
  if (result.status === Status.FAILED && this.page) {
    const screenshot = await this.page.screenshot({ fullPage: true });
    await this.attach(screenshot, 'image/png');

    // Capture page HTML on failure
    const html = await this.page.content();
    await this.attach(html, 'text/html');

    console.log(`❌ Scenario failed: ${pickle.name}`);
    console.log(`   Error: ${result.message}`);
  } else if (result.status === Status.PASSED) {
    console.log(`✅ Scenario passed: ${pickle.name}`);
  }

  // Cleanup browser
  await this.cleanup();
});

// Tag-specific hooks
Before({ tags: '@api' }, async function () {
  console.log('   Running API-only scenario (no browser needed)');
  // Skip browser initialization for API tests
});

Before({ tags: '@smoke' }, async function () {
  console.log('   Running smoke test');
});

Before({ tags: '@slow' }, async function () {
  console.log('   Running slow test - increasing timeout');
  this.page?.setDefaultTimeout(60000);
});
