#!/usr/bin/env node

/**
 * Script to convert BRD User Stories (Markdown) to Gherkin Feature Files
 * Usage: node convert-to-features.js
 */

const fs = require('fs');
const path = require('path');

// Domain mapping
const DOMAIN_MAP = {
  '1': { name: 'Dealer/Contractor Onboarding', folder: 'domain-01-dealer-onboarding' },
  '2': { name: 'User & Profile Management', folder: 'domain-02-user-management' },
  '3': { name: 'Homeowner Prequalification', folder: 'domain-03-prequalification' },
  '4': { name: 'Premier Program Origination', folder: 'domain-04-premier-origination' },
  '5': { name: 'Loan Partner Origination', folder: 'domain-05-loan-partner-origination' },
  '6': { name: 'LTO Partner Origination', folder: 'domain-06-lto-partner-origination' },
  '7': { name: 'Pricing & Quotes', folder: 'domain-07-pricing-quotes' },
  '8': { name: 'Credit & Underwriting', folder: 'domain-08-credit-underwriting' },
  '9': { name: 'Income & Property Verification', folder: 'domain-09-verification' },
  '10': { name: 'Document Management & E-Signatures', folder: 'domain-10-document-management' },
  '11': { name: 'Billing & Payments', folder: 'domain-11-billing-payments' },
  '12': { name: 'Maintenance & Servicing', folder: 'domain-12-maintenance-servicing' },
  '13': { name: 'Equipment Management', folder: 'domain-13-equipment-management' },
  '14': { name: 'Installation & Funding', folder: 'domain-14-installation-funding' },
  '15': { name: 'Notifications & Communications', folder: 'domain-15-notifications-communications' },
  '16': { name: 'Customer Service & Support', folder: 'domain-16-customer-service' },
  '17': { name: 'Promotions & Incentives', folder: 'domain-17-promotions-incentives' },
  '18': { name: 'Learning Management', folder: 'domain-18-learning-management' },
  '19': { name: 'Account Lifecycle Management', folder: 'domain-19-account-lifecycle' },
  '20': { name: 'Configuration & Administration', folder: 'domain-20-configuration-admin' },
  '21': { name: 'Reporting & Analytics', folder: 'domain-21-reporting-analytics' }
};

// Parse a single user story
function parseUserStory(text) {
  const storyMatch = text.match(/\*\*US-(\d+)\.(\d+)\.(\d+):\s*(.+?)\*\*/);
  if (!storyMatch) return null;

  const [, domain, section, number, title] = storyMatch;
  const usId = `US-${domain}.${section}.${number}`;

  // Extract user story narrative (As a... I want... so that...)
  const narrativeMatch = text.match(/>\s*As (?:a|an)\s*\*\*(.+?)\*\*,?\s*I want\s+(.+?),?\s+so that\s+(.+?)(?:\.|$)/s);
  let role = '', want = '', soThat = '';

  if (narrativeMatch) {
    role = narrativeMatch[1].trim();
    want = narrativeMatch[2].trim();
    soThat = narrativeMatch[3].trim().replace(/\.$/, '');
  }

  // Extract acceptance criteria
  const criteriaMatch = text.match(/\*\*Acceptance Criteria:\*\*([\s\S]+?)(?=\n---|\n\*\*US-|\n##|$)/);
  let acceptanceCriteria = [];

  if (criteriaMatch) {
    const criteriaText = criteriaMatch[1];
    const lines = criteriaText.split('\n')
      .map(l => l.trim())
      .filter(l => l.startsWith('-'))
      .map(l => l.substring(1).trim());

    acceptanceCriteria = lines;
  }

  // Generate tags from title and domain
  const tags = [
    `@${usId.replace(/\./g, '-')}`,
    `@domain-${domain.padStart(2, '0')}`,
    ...generateTags(title)
  ];

  return {
    usId,
    domain,
    section,
    number,
    title: title.trim(),
    role,
    want,
    soThat,
    acceptanceCriteria,
    tags
  };
}

// Generate relevant tags from title
function generateTags(title) {
  const tags = [];
  const lowerTitle = title.toLowerCase();

  if (lowerTitle.includes('email') || lowerTitle.includes('notification')) tags.push('@email');
  if (lowerTitle.includes('sms')) tags.push('@sms');
  if (lowerTitle.includes('payment')) tags.push('@payment');
  if (lowerTitle.includes('credit')) tags.push('@credit');
  if (lowerTitle.includes('application')) tags.push('@application');
  if (lowerTitle.includes('approval')) tags.push('@approval');
  if (lowerTitle.includes('signature') || lowerTitle.includes('sign')) tags.push('@signature');
  if (lowerTitle.includes('document')) tags.push('@document');
  if (lowerTitle.includes('verify') || lowerTitle.includes('validation')) tags.push('@validation');
  if (lowerTitle.includes('report')) tags.push('@report');

  return tags;
}

// Convert acceptance criteria to Gherkin steps
function convertToGherkinSteps(criteria) {
  return criteria.map(line => {
    let trimmed = line.trim();

    // Already in Given/When/Then format
    if (/^(Given|When|Then|And|But)\s+/i.test(trimmed)) {
      // Capitalize first word
      return trimmed.charAt(0).toUpperCase() + trimmed.slice(1);
    }

    // Try to infer step type
    if (trimmed.toLowerCase().startsWith('i ')) {
      return 'When ' + trimmed;
    }

    return 'And ' + trimmed;
  }).join('\n    ');
}

// Group user stories by feature (section)
function groupStoriesByFeature(stories) {
  const featureGroups = {};

  stories.forEach(story => {
    const key = `${story.domain}.${story.section}`;
    if (!featureGroups[key]) {
      featureGroups[key] = {
        domain: story.domain,
        section: story.section,
        stories: []
      };
    }
    featureGroups[key].stories.push(story);
  });

  return featureGroups;
}

// Generate Gherkin feature file
function generateFeatureFile(featureGroup, sectionTitle) {
  const { domain, section, stories } = featureGroup;
  const domainInfo = DOMAIN_MAP[domain];

  let gherkin = `# Feature file generated from BRD User Stories
# Domain ${domain}: ${domainInfo.name}
# Section ${domain}.${section}: ${sectionTitle}

`;

  // Feature header (use first story's context)
  const firstStory = stories[0];
  gherkin += `Feature: ${sectionTitle}\n`;
  gherkin += `  ${domainInfo.name}\n\n`;

  // Add scenarios for each story
  stories.forEach((story, idx) => {
    if (idx > 0) gherkin += '\n';

    gherkin += `  ${story.tags.join(' ')}\n`;
    gherkin += `  Scenario: ${story.title}\n`;

    if (story.role && story.want) {
      gherkin += `    # As a ${story.role}, I want ${story.want}\n`;
      if (story.soThat) {
        gherkin += `    # so that ${story.soThat}\n`;
      }
    }

    if (story.acceptanceCriteria.length > 0) {
      gherkin += '    ' + convertToGherkinSteps(story.acceptanceCriteria) + '\n';
    } else {
      gherkin += '    Given [TODO: define precondition]\n';
      gherkin += '    When [TODO: define action]\n';
      gherkin += '    Then [TODO: define expected outcome]\n';
    }
  });

  return gherkin;
}

// Create kebab-case filename from title
function createFilename(title) {
  return title
    .toLowerCase()
    .replace(/[^a-z0-9\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-')
    .substring(0, 50) + '.feature';
}

// Parse markdown file and extract user stories
function parseMarkdownFile(filePath) {
  const content = fs.readFileSync(filePath, 'utf-8');
  const stories = [];
  const sections = {};

  // Split by user story markers
  const storyBlocks = content.split(/(?=\*\*US-\d+\.\d+\.\d+:)/);

  // Extract section headers
  const sectionMatches = [...content.matchAll(/###\s+(\d+)\.(\d+)\s+(.+?)(?=\n)/g)];
  sectionMatches.forEach(match => {
    const [, domain, section, title] = match;
    sections[`${domain}.${section}`] = title.trim();
  });

  storyBlocks.forEach(block => {
    const story = parseUserStory(block);
    if (story) {
      stories.push(story);
    }
  });

  return { stories, sections };
}

// Main conversion function
function convertToFeatures() {
  console.log('🚀 Converting BRD User Stories to Gherkin Feature Files...\n');

  const traceabilityMap = [];
  const brdFiles = [
    'BRD_User_Stories_Part1.md',
    'BRD_User_Stories_Part2.md',
    'BRD_User_Stories_Part3.md',
    'BRD_User_Stories_Part4.md',
    'BRD_User_Stories_Part5.md'
  ];

  let allStories = [];
  let allSections = {};

  // Parse all BRD files
  brdFiles.forEach(file => {
    const filePath = path.join(__dirname, 'BRD', file);
    if (!fs.existsSync(filePath)) {
      console.log(`⚠️  Skipping ${file} (not found)`);
      return;
    }

    console.log(`📖 Parsing BRD/${file}...`);
    const { stories, sections } = parseMarkdownFile(filePath);
    allStories = allStories.concat(stories);
    allSections = { ...allSections, ...sections };
  });

  console.log(`\n✅ Parsed ${allStories.length} user stories\n`);

  // Group stories by feature (section)
  const featureGroups = groupStoriesByFeature(allStories);

  let featureCount = 0;

  // Generate feature files
  Object.keys(featureGroups).forEach(key => {
    const featureGroup = featureGroups[key];
    const { domain, section } = featureGroup;
    const sectionTitle = allSections[key] || `Section ${section}`;

    const domainInfo = DOMAIN_MAP[domain];
    if (!domainInfo) {
      console.log(`⚠️  Unknown domain: ${domain}`);
      return;
    }

    const featureContent = generateFeatureFile(featureGroup, sectionTitle);
    const filename = createFilename(sectionTitle);
    const domainFolder = path.join(__dirname, 'features', domainInfo.folder);
    const featurePath = path.join(domainFolder, filename);

    // Ensure domain folder exists
    if (!fs.existsSync(domainFolder)) {
      fs.mkdirSync(domainFolder, { recursive: true });
    }

    // Write feature file
    fs.writeFileSync(featurePath, featureContent);
    featureCount++;

    console.log(`✅ Created: features/${domainInfo.folder}/${filename}`);

    // Add to traceability map
    featureGroup.stories.forEach(story => {
      traceabilityMap.push({
        usId: story.usId,
        title: story.title,
        domain: domainInfo.name,
        featureFile: `features/${domainInfo.folder}/${filename}`,
        tags: story.tags
      });
    });
  });

  // Write traceability map
  const traceabilityPath = path.join(__dirname, 'features', 'TRACEABILITY_MAP.json');
  fs.writeFileSync(
    traceabilityPath,
    JSON.stringify(traceabilityMap, null, 2)
  );
  console.log(`\n📋 Created traceability map: features/TRACEABILITY_MAP.json`);

  // Write summary
  const summaryPath = path.join(__dirname, 'features', 'CONVERSION_SUMMARY.md');
  const summary = `# BRD to Feature Conversion Summary

**Generated:** ${new Date().toISOString()}

## Statistics
- **Total User Stories:** ${allStories.length}
- **Feature Files Generated:** ${featureCount}
- **Domains Covered:** ${Object.keys(DOMAIN_MAP).length}

## Domain Breakdown
${Object.keys(DOMAIN_MAP).map(domain => {
  const count = allStories.filter(s => s.domain === domain).length;
  const info = DOMAIN_MAP[domain];
  return `- **Domain ${domain}:** ${info.name} (${count} stories)`;
}).join('\n')}

## Next Steps
1. Review generated feature files in \`features/\` directory
2. Customize scenarios as needed
3. Implement step definitions in \`features/step-definitions/\`
4. Run tests with: \`npm test\`

## Traceability
- Full mapping available in: [TRACEABILITY_MAP.json](TRACEABILITY_MAP.json)
- Each feature file includes US-ID tags for reference back to BRD
`;

  fs.writeFileSync(summaryPath, summary);
  console.log(`📄 Created summary: features/CONVERSION_SUMMARY.md`);

  console.log(`\n🎉 Conversion complete! Generated ${featureCount} feature files from ${allStories.length} user stories.\n`);
}

// Run conversion
try {
  convertToFeatures();
} catch (error) {
  console.error('❌ Error during conversion:', error);
  process.exit(1);
}
