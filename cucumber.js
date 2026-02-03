/**
 * Cucumber Configuration for Comfort Connect BDD Tests
 */

const common = {
  requireModule: ['ts-node/register'],
  require: ['features/step-definitions/**/*.js', 'features/support/**/*.js'],
  format: [
    'progress-bar',
    'html:reports/cucumber-report.html',
    'json:reports/cucumber-report.json',
    'junit:reports/cucumber-report.xml'
  ],
  formatOptions: {
    snippetInterface: 'async-await'
  },
  dryRun: false,
  failFast: false,
  parallel: 1,
  worldParameters: {
    appURL: process.env.APP_URL || 'http://localhost:3000',
    apiURL: process.env.API_URL || 'http://localhost:4000'
  }
};

module.exports = {
  default: {
    ...common,
    paths: ['features/**/*.feature']
  },
  smoke: {
    ...common,
    paths: ['features/**/*.feature'],
    tags: '@smoke'
  },
  domain01: {
    ...common,
    paths: ['features/domain-01-dealer-onboarding/**/*.feature']
  },
  domain02: {
    ...common,
    paths: ['features/domain-02-user-management/**/*.feature']
  },
  domain03: {
    ...common,
    paths: ['features/domain-03-prequalification/**/*.feature']
  },
  domain04: {
    ...common,
    paths: ['features/domain-04-premier-origination/**/*.feature']
  },
  parallel: {
    ...common,
    parallel: 4
  }
};
