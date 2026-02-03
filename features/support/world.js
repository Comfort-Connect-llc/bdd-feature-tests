/**
 * Cucumber World - Shared context for all test scenarios
 */

const { setWorldConstructor, World } = require('@cucumber/cucumber');
const { chromium } = require('@playwright/test');

class CustomWorld extends World {
  constructor(options) {
    super(options);

    // Configuration
    this.appURL = options.parameters.appURL || 'http://localhost:3000';
    this.apiURL = options.parameters.apiURL || 'http://localhost:4000';

    // Playwright instances
    this.browser = null;
    this.context = null;
    this.page = null;

    // Test data storage
    this.testData = {};
    this.response = null;
  }

  // Initialize browser for scenario
  async init() {
    this.browser = await chromium.launch({
      headless: process.env.HEADLESS !== 'false',
      slowMo: process.env.SLOW_MO ? parseInt(process.env.SLOW_MO) : 0
    });

    this.context = await this.browser.newContext({
      viewport: { width: 1280, height: 720 },
      recordVideo: process.env.RECORD_VIDEO ? { dir: 'reports/videos' } : undefined
    });

    this.page = await this.context.newPage();

    // Set default timeout
    this.page.setDefaultTimeout(30000);

    // Add console log capturing
    this.page.on('console', msg => {
      if (process.env.DEBUG) {
        console.log(`Browser console: ${msg.text()}`);
      }
    });

    return this.page;
  }

  // Cleanup after scenario
  async cleanup() {
    if (this.page) {
      await this.page.close();
    }
    if (this.context) {
      await this.context.close();
    }
    if (this.browser) {
      await this.browser.close();
    }
  }

  // Navigate to a page
  async goto(path) {
    const url = path.startsWith('http') ? path : `${this.appURL}${path}`;
    await this.page.goto(url);
  }

  // Store data for later use in scenario
  store(key, value) {
    this.testData[key] = value;
  }

  // Retrieve stored data
  retrieve(key) {
    return this.testData[key];
  }

  // Make API request
  async apiRequest(method, endpoint, data = null) {
    const url = endpoint.startsWith('http') ? endpoint : `${this.apiURL}${endpoint}`;

    const options = {
      method,
      headers: {
        'Content-Type': 'application/json'
      }
    };

    if (data) {
      options.body = JSON.stringify(data);
    }

    const response = await this.page.request.fetch(url, options);
    this.response = {
      status: response.status(),
      body: await response.json().catch(() => ({})),
      headers: response.headers()
    };

    return this.response;
  }
}

setWorldConstructor(CustomWorld);

module.exports = CustomWorld;
