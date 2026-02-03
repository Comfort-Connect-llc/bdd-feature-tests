/**
 * Helper functions for test scenarios
 */

/**
 * Generate random test data
 */
function generateTestData(type) {
  const timestamp = Date.now();

  const generators = {
    email: () => `test+${timestamp}@example.com`,
    phone: () => `555${Math.floor(Math.random() * 10000000).toString().padStart(7, '0')}`,
    ssn: () => `${Math.floor(Math.random() * 900 + 100)}-${Math.floor(Math.random() * 90 + 10)}-${Math.floor(Math.random() * 9000 + 1000)}`,
    businessName: () => `Test Business ${timestamp}`,
    ein: () => `${Math.floor(Math.random() * 90 + 10)}-${Math.floor(Math.random() * 9000000).toString().padStart(7, '0')}`,
    zipCode: () => Math.floor(Math.random() * 90000 + 10000).toString(),
    amount: () => (Math.random() * 10000 + 1000).toFixed(2),
    address: () => `${Math.floor(Math.random() * 9999 + 1)} Test Street`,
    city: () => ['Springfield', 'Riverside', 'Fairview', 'Madison', 'Georgetown'][Math.floor(Math.random() * 5)],
    state: () => ['CA', 'TX', 'FL', 'NY', 'IL'][Math.floor(Math.random() * 5)]
  };

  return generators[type] ? generators[type]() : null;
}

/**
 * Wait for condition to be true
 */
async function waitFor(condition, timeout = 5000, interval = 100) {
  const startTime = Date.now();

  while (Date.now() - startTime < timeout) {
    if (await condition()) {
      return true;
    }
    await sleep(interval);
  }

  throw new Error(`Timeout waiting for condition after ${timeout}ms`);
}

/**
 * Sleep for specified milliseconds
 */
function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

/**
 * Format currency
 */
function formatCurrency(amount) {
  return new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD'
  }).format(amount);
}

/**
 * Parse currency string to number
 */
function parseCurrency(currencyString) {
  return parseFloat(currencyString.replace(/[$,]/g, ''));
}

/**
 * Format date
 */
function formatDate(date, format = 'MM/DD/YYYY') {
  const d = new Date(date);
  const month = String(d.getMonth() + 1).padStart(2, '0');
  const day = String(d.getDate()).padStart(2, '0');
  const year = d.getFullYear();

  return format
    .replace('MM', month)
    .replace('DD', day)
    .replace('YYYY', year);
}

/**
 * Deep compare objects
 */
function deepEqual(obj1, obj2) {
  return JSON.stringify(obj1) === JSON.stringify(obj2);
}

/**
 * Extract text from element
 */
async function getTextContent(page, selector) {
  const element = await page.locator(selector);
  return await element.textContent();
}

/**
 * Check if element is visible
 */
async function isVisible(page, selector, timeout = 5000) {
  try {
    await page.locator(selector).waitFor({ state: 'visible', timeout });
    return true;
  } catch {
    return false;
  }
}

/**
 * Fill form fields
 */
async function fillForm(page, fields) {
  for (const [selector, value] of Object.entries(fields)) {
    await page.locator(selector).fill(value);
  }
}

/**
 * Select dropdown option
 */
async function selectOption(page, selector, option) {
  await page.locator(selector).selectOption(option);
}

/**
 * Wait for navigation
 */
async function waitForNavigation(page, action, timeout = 30000) {
  await Promise.all([
    page.waitForNavigation({ timeout }),
    action()
  ]);
}

module.exports = {
  generateTestData,
  waitFor,
  sleep,
  formatCurrency,
  parseCurrency,
  formatDate,
  deepEqual,
  getTextContent,
  isVisible,
  fillForm,
  selectOption,
  waitForNavigation
};
