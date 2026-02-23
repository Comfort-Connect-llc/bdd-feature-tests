#!/usr/bin/env node

/**
 * Add Figma Front Matter to BRD Module Files
 * 
 * This script adds YAML front matter with Figma placeholder links
 * to BRD module files that don't already have it.
 * 
 * Usage: node scripts/add-figma-frontmatter.js [--dry-run]
 */

const fs = require('fs');
const path = require('path');

const BRD_MODULES_DIR = path.join(__dirname, '..', 'BRD', 'modules');
const DRY_RUN = process.argv.includes('--dry-run');

const MODULE_FIGMA_PAGES = {
  'Module_01_Identity_Access.md': 'Module 01 - Identity & Access',
  'Module_02_Dealer_Management.md': 'Module 02 - Dealer Management',
  'Module_03_Prequalification_Origination.md': 'Module 03 - Prequalification & Origination',
  'Module_04_Underwriting_Verification.md': 'Module 04 - Underwriting & Verification',
  'Module_05_Pricing_Equipment.md': 'Module 05 - Pricing & Equipment',
  'Module_06_Document_Management.md': 'Module 06 - Document Management',
  'Module_07_Installation_Funding.md': 'Module 07 - Installation & Funding',
  'Module_08_Billing_Payments.md': 'Module 08 - Billing & Payments',
  'Module_09_Account_Servicing.md': 'Module 09 - Account Servicing',
  'Module_10_Communications.md': 'Module 10 - Communications',
  'Module_11_Promotions.md': 'Module 11 - Promotions',
  'Module_12_Administration.md': 'Module 12 - Administration'
};

function generateFrontMatter(fileName) {
  const pageName = MODULE_FIGMA_PAGES[fileName] || 'Unknown Module';
  
  return `---
figma:
  file: "https://www.figma.com/file/FIGMA_FILE_ID/Comfort-Connect-Platform"
  page: "${pageName}"
  frames:
    - id: "overview"
      name: "${pageName} Overview"
      url: "TODO"
---

`;
}

function hasYamlFrontMatter(content) {
  return content.trimStart().startsWith('---');
}

function processFile(filePath, fileName) {
  const content = fs.readFileSync(filePath, 'utf-8');
  
  if (hasYamlFrontMatter(content)) {
    console.log(`⏭️  Skipping ${fileName} (already has front matter)`);
    return false;
  }
  
  const frontMatter = generateFrontMatter(fileName);
  const newContent = frontMatter + content;
  
  if (DRY_RUN) {
    console.log(`🔍 Would update ${fileName}`);
    console.log('   Front matter to add:');
    console.log(frontMatter.split('\n').map(l => '   ' + l).join('\n'));
  } else {
    fs.writeFileSync(filePath, newContent, 'utf-8');
    console.log(`✅ Updated ${fileName}`);
  }
  
  return true;
}

function main() {
  console.log('📋 Figma Front Matter Generator');
  console.log(`   Mode: ${DRY_RUN ? 'DRY RUN (no changes)' : 'LIVE'}`);
  console.log('');
  
  if (!fs.existsSync(BRD_MODULES_DIR)) {
    console.error('❌ BRD/modules directory not found');
    process.exit(1);
  }
  
  const files = fs.readdirSync(BRD_MODULES_DIR)
    .filter(f => f.startsWith('Module_') && f.endsWith('.md'));
  
  let updated = 0;
  let skipped = 0;
  
  for (const fileName of files) {
    const filePath = path.join(BRD_MODULES_DIR, fileName);
    if (processFile(filePath, fileName)) {
      updated++;
    } else {
      skipped++;
    }
  }
  
  console.log('');
  console.log(`📊 Summary: ${updated} updated, ${skipped} skipped`);
  
  if (DRY_RUN && updated > 0) {
    console.log('');
    console.log('💡 Run without --dry-run to apply changes');
  }
}

main();
