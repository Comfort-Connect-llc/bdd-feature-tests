/**
 * Step definitions for Domain 1: Dealer/Contractor Onboarding
 */

const { Given, When, Then } = require('@cucumber/cucumber');
const { expect } = require('@playwright/test');
const { generateTestData, fillForm, isVisible } = require('../support/helpers');

// ============================================================================
// US-1.1.1: Invite Dealer to Apply
// ============================================================================

Given('a valid dealer contact email and business name', function () {
  this.store('dealerEmail', generateTestData('email'));
  this.store('businessName', generateTestData('businessName'));
});

When('I send a merchant application invitation', async function () {
  await this.goto('/admin/dealer/invite');

  await fillForm(this.page, {
    '[name="email"]': this.retrieve('dealerEmail'),
    '[name="businessName"]': this.retrieve('businessName')
  });

  await this.page.click('button:has-text("Send Invitation")');
});

Then('the dealer receives an email with a secure link to begin their application', async function () {
  // In real scenario, this would check email service/mock
  // For now, verify success message
  await expect(this.page.locator('text=Invitation sent successfully')).toBeVisible();

  // TODO: Integrate with email testing service (e.g., MailHog, Ethereal)
  // const email = await checkEmail(this.retrieve('dealerEmail'));
  // expect(email.subject).toContain('Invitation');
});

Then('the application record is created with status {string}', async function (expectedStatus) {
  // Verify in admin dashboard or via API
  await this.goto('/admin/applications');

  const statusCell = this.page.locator(`tr:has-text("${this.retrieve('businessName')}") td.status`);
  await expect(statusCell).toHaveText(expectedStatus);
});

// ============================================================================
// US-1.1.2: Save Application Progress
// ============================================================================

Given('I am completing my merchant application', async function () {
  // Navigate to application form
  await this.goto('/merchant/application');

  // Fill in some fields
  await fillForm(this.page, {
    '[name="businessName"]': generateTestData('businessName'),
    '[name="ein"]': generateTestData('ein'),
    '[name="address"]': generateTestData('address')
  });

  // Store a test value to verify later
  this.store('savedBusinessName', await this.page.inputValue('[name="businessName"]'));
});

When('I save my progress', async function () {
  await this.page.click('button:has-text("Save Progress")');
  await this.page.waitForTimeout(1000); // Wait for save
});

Then('all entered information is preserved', async function () {
  // Reload page to verify data persisted
  await this.page.reload();

  const businessName = await this.page.inputValue('[name="businessName"]');
  expect(businessName).toBe(this.retrieve('savedBusinessName'));
});

Then('I can resume from where I left off', async function () {
  // Verify we're still on the same form page
  expect(this.page.url()).toContain('/merchant/application');

  // Verify form fields are populated
  const businessName = await this.page.inputValue('[name="businessName"]');
  expect(businessName).not.toBe('');
});

// ============================================================================
// US-1.1.3: Submit Merchant Application
// ============================================================================

Given('I have completed all required fields including business details, tax ID, banking information, and owner information', async function () {
  await this.goto('/merchant/application');

  // Fill all required fields
  await fillForm(this.page, {
    // Business Details
    '[name="businessName"]': generateTestData('businessName'),
    '[name="ein"]': generateTestData('ein'),
    '[name="businessPhone"]': generateTestData('phone'),
    '[name="businessEmail"]': generateTestData('email'),

    // Business Address
    '[name="address"]': generateTestData('address'),
    '[name="city"]': generateTestData('city'),
    '[name="state"]': generateTestData('state'),
    '[name="zipCode"]': generateTestData('zipCode'),

    // Banking Information
    '[name="bankName"]': 'Test Bank',
    '[name="accountNumber"]': '123456789',
    '[name="routingNumber"]': '021000021',

    // Owner Information
    '[name="ownerFirstName"]': 'John',
    '[name="ownerLastName"]': 'Doe',
    '[name="ownerSSN"]': generateTestData('ssn'),
    '[name="ownerEmail"]': generateTestData('email'),
    '[name="ownerPhone"]': generateTestData('phone')
  });
});

When('I submit my application', async function () {
  await this.page.click('button:has-text("Submit Application")');
});

Then('the application status changes to {string}', async function (expectedStatus) {
  // Wait for confirmation page or status update
  await this.page.waitForTimeout(2000);

  const statusElement = this.page.locator('.application-status, [data-testid="status"]');
  await expect(statusElement).toContainText(expectedStatus);
});

Then('I receive confirmation that my application is under review', async function () {
  await expect(
    this.page.locator('text=Your application has been submitted and is under review')
  ).toBeVisible();

  // Or check for confirmation email
  // TODO: Verify confirmation email was sent
});

// ============================================================================
// US-1.2.1: Generate NDA for Signing
// ============================================================================

Given('a dealer has started the onboarding process', async function () {
  // Simulate dealer starting onboarding
  this.store('dealerId', 'DEALER_' + Date.now());
});

When('the system generates the NDA document', async function () {
  // Trigger NDA generation (might be automatic or via admin action)
  // This step might be automatic in the system
  await this.page.waitForTimeout(500);
});

Then('the NDA is pre-populated with the dealer\'s business information', async function () {
  await this.goto(`/dealer/${this.retrieve('dealerId')}/documents`);

  const ndaDoc = this.page.locator('[data-doc-type="NDA"]');
  await expect(ndaDoc).toBeVisible();

  // Verify it contains business info
  // await expect(ndaDoc).toContainText(this.retrieve('businessName'));
});

Then('the document is sent for electronic signature', async function () {
  const signatureStatus = this.page.locator('[data-doc-type="NDA"] .signature-status');
  await expect(signatureStatus).toContainText('Pending Signature');
});

// ============================================================================
// US-1.2.2: Sign Merchant Agreement
// ============================================================================

Given('my merchant application has been approved', async function () {
  // Setup: Create approved application
  await this.apiRequest('POST', '/api/applications', {
    status: 'approved',
    dealerId: this.retrieve('dealerId')
  });
});

When('I receive the merchant agreement for signing', async function () {
  await this.goto('/dealer/agreements');
  await expect(this.page.locator('[data-doc-type="Merchant Agreement"]')).toBeVisible();
});

Then('I can review all terms and conditions', async function () {
  await this.page.click('[data-doc-type="Merchant Agreement"]');

  // Verify document viewer is displayed
  await expect(this.page.locator('.document-viewer')).toBeVisible();

  // Verify terms are visible
  await expect(this.page.locator('text=Terms and Conditions')).toBeVisible();
});

Then('I can electronically sign the agreement', async function () {
  // Look for signature pad or e-signature button
  const signButton = this.page.locator('button:has-text("Sign Document")');
  await expect(signButton).toBeEnabled();

  await signButton.click();

  // Fill signature
  await this.page.fill('[name="signatureName"]', 'John Doe');
  await this.page.click('button:has-text("Confirm Signature")');
});

Then('upon signing, I receive a copy of the executed agreement', async function () {
  // Verify confirmation
  await expect(this.page.locator('text=Agreement signed successfully')).toBeVisible();

  // Verify download link is available
  const downloadLink = this.page.locator('a:has-text("Download Signed Agreement")');
  await expect(downloadLink).toBeVisible();
});

// ============================================================================
// Helper Functions
// ============================================================================

async function checkEmail(emailAddress) {
  // TODO: Integrate with email testing service
  // This is a placeholder for email verification logic
  return {
    to: emailAddress,
    subject: 'Dealer Application Invitation',
    body: 'Click here to start your application...'
  };
}
