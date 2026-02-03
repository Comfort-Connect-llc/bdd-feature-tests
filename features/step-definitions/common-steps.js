/**
 * Common step definitions used across multiple domains
 */

const { Given, When, Then } = require('@cucumber/cucumber');
const { expect } = require('@playwright/test');
const { generateTestData, isVisible } = require('../support/helpers');

// ============================================================================
// Navigation Steps
// ============================================================================

Given('I am on the {string} page', async function (pageName) {
  const pageMap = {
    'home': '/',
    'login': '/login',
    'dashboard': '/dashboard',
    'merchant application': '/merchant/application',
    'dealer onboarding': '/dealer/onboarding'
  };

  const path = pageMap[pageName.toLowerCase()] || `/${pageName.toLowerCase().replace(/ /g, '-')}`;
  await this.goto(path);
});

When('I navigate to {string}', async function (path) {
  await this.goto(path);
});

// ============================================================================
// Authentication Steps
// ============================================================================

Given('I am logged in as an {string}', async function (role) {
  await this.goto('/login');

  // Mock credentials based on role
  const credentials = {
    'Administrator': { email: 'admin@comfortconnect.com', password: 'Admin123!' },
    'Dealer': { email: 'dealer@example.com', password: 'Dealer123!' },
    'Customer Service Representative': { email: 'csr@comfortconnect.com', password: 'CSR123!' },
    'Underwriter': { email: 'underwriter@comfortconnect.com', password: 'UW123!' }
  };

  const creds = credentials[role] || credentials['Dealer'];

  await this.page.fill('[name="email"]', creds.email);
  await this.page.fill('[name="password"]', creds.password);
  await this.page.click('button[type="submit"]');

  // Wait for dashboard
  await this.page.waitForURL(/\/dashboard/);
});

Given('I am not logged in', async function () {
  // Clear cookies/session
  await this.context.clearCookies();
});

// ============================================================================
// Form Interaction Steps
// ============================================================================

When('I fill in {string} with {string}', async function (fieldName, value) {
  const selector = `[name="${fieldName}"], [id="${fieldName}"], [placeholder*="${fieldName}"]`;
  await this.page.fill(selector, value);
});

When('I select {string} from {string}', async function (option, dropdown) {
  const selector = `[name="${dropdown}"], [id="${dropdown}"]`;
  await this.page.selectOption(selector, option);
});

When('I check {string}', async function (checkboxLabel) {
  const checkbox = this.page.locator(`text=${checkboxLabel}`).locator('..').locator('input[type="checkbox"]');
  await checkbox.check();
});

When('I uncheck {string}', async function (checkboxLabel) {
  const checkbox = this.page.locator(`text=${checkboxLabel}`).locator('..').locator('input[type="checkbox"]');
  await checkbox.uncheck();
});

When('I click {string}', async function (buttonText) {
  await this.page.click(`button:has-text("${buttonText}"), a:has-text("${buttonText}")`);
});

When('I click the {string} button', async function (buttonText) {
  await this.page.click(`button:has-text("${buttonText}")`);
});

// ============================================================================
// Validation Steps
// ============================================================================

Then('I should see {string}', async function (text) {
  await expect(this.page.locator(`text=${text}`)).toBeVisible();
});

Then('I should not see {string}', async function (text) {
  await expect(this.page.locator(`text=${text}`)).not.toBeVisible();
});

Then('I should be on the {string} page', async function (pageName) {
  const currentUrl = this.page.url();
  const expectedPath = pageName.toLowerCase().replace(/ /g, '-');
  expect(currentUrl).toContain(expectedPath);
});

Then('I should see an error message', async function () {
  const errorSelectors = [
    '.error-message',
    '.alert-error',
    '[role="alert"]',
    '.notification.error'
  ];

  let errorFound = false;
  for (const selector of errorSelectors) {
    if (await isVisible(this.page, selector, 2000)) {
      errorFound = true;
      break;
    }
  }

  expect(errorFound).toBe(true);
});

Then('I should see a success message', async function () {
  const successSelectors = [
    '.success-message',
    '.alert-success',
    '.notification.success'
  ];

  let successFound = false;
  for (const selector of successSelectors) {
    if (await isVisible(this.page, selector, 2000)) {
      successFound = true;
      break;
    }
  }

  expect(successFound).toBe(true);
});

Then('the {string} field should contain {string}', async function (fieldName, expectedValue) {
  const selector = `[name="${fieldName}"], [id="${fieldName}"]`;
  const value = await this.page.inputValue(selector);
  expect(value).toBe(expectedValue);
});

Then('the {string} field should be empty', async function (fieldName) {
  const selector = `[name="${fieldName}"], [id="${fieldName}"]`;
  const value = await this.page.inputValue(selector);
  expect(value).toBe('');
});

Then('the {string} button should be disabled', async function (buttonText) {
  const button = this.page.locator(`button:has-text("${buttonText}")`);
  await expect(button).toBeDisabled();
});

Then('the {string} button should be enabled', async function (buttonText) {
  const button = this.page.locator(`button:has-text("${buttonText}")`);
  await expect(button).toBeEnabled();
});

// ============================================================================
// Data Storage Steps
// ============================================================================

When('I store the {string} as {string}', async function (selector, key) {
  const value = await this.page.textContent(selector);
  this.store(key, value.trim());
});

Then('the stored {string} should match {string}', async function (key, pattern) {
  const value = this.retrieve(key);
  expect(value).toMatch(new RegExp(pattern));
});

// ============================================================================
// Wait Steps
// ============================================================================

When('I wait for {int} second(s)', async function (seconds) {
  await this.page.waitForTimeout(seconds * 1000);
});

When('I wait for {string} to be visible', async function (text) {
  await this.page.locator(`text=${text}`).waitFor({ state: 'visible' });
});
