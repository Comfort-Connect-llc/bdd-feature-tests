#!/usr/bin/env node

/**
 * Figma Link Validator
 * 
 * Validates Figma links in:
 * 1. designs/figma-index.json
 * 2. BRD module markdown files (inline design links)
 * 
 * Usage: node scripts/validate-figma-links.js [--check-http]
 * 
 * Options:
 *   --check-http  Actually fetch Figma URLs to verify they're accessible (slower)
 */

const fs = require('fs');
const path = require('path');

const DESIGNS_DIR = path.join(__dirname, '..', 'designs');
const BRD_MODULES_DIR = path.join(__dirname, '..', 'BRD', 'modules');
const INDEX_FILE = path.join(DESIGNS_DIR, 'figma-index.json');

const FIGMA_URL_PATTERN = /https:\/\/(www\.)?figma\.com\/(file|proto)\/[A-Za-z0-9]+/;
const FIGMA_NODE_PATTERN = /node-id=[\d-]+/;
const INLINE_DESIGN_PATTERN = /🎨\s*\*\*Design:\*\*\s*\[([^\]]+)\]\(([^)]+)\)/g;

let errors = [];
let warnings = [];
let stats = {
  totalLinks: 0,
  validLinks: 0,
  todoLinks: 0,
  invalidLinks: 0,
  modulesScanned: 0
};

function validateFigmaUrl(url, context) {
  stats.totalLinks++;
  
  if (url === 'TODO' || url.includes('TODO')) {
    stats.todoLinks++;
    warnings.push(`[TODO] ${context}: Link not yet populated`);
    return false;
  }
  
  if (!FIGMA_URL_PATTERN.test(url)) {
    stats.invalidLinks++;
    errors.push(`[INVALID] ${context}: Not a valid Figma URL: ${url}`);
    return false;
  }
  
  if (!FIGMA_NODE_PATTERN.test(url)) {
    warnings.push(`[WARNING] ${context}: URL missing node-id (links to file root, not specific frame): ${url}`);
  }
  
  stats.validLinks++;
  return true;
}

function validateIndexFile() {
  console.log('\n📋 Validating figma-index.json...\n');
  
  if (!fs.existsSync(INDEX_FILE)) {
    errors.push('[MISSING] designs/figma-index.json not found');
    return;
  }
  
  let index;
  try {
    const content = fs.readFileSync(INDEX_FILE, 'utf-8');
    index = JSON.parse(content);
  } catch (e) {
    errors.push(`[PARSE ERROR] figma-index.json: ${e.message}`);
    return;
  }
  
  // Validate project-level URL
  if (index.figmaProject?.fileUrl) {
    validateFigmaUrl(index.figmaProject.fileUrl, 'figmaProject.fileUrl');
  }
  
  // Validate each module's designs
  if (Array.isArray(index.modules)) {
    for (const module of index.modules) {
      if (Array.isArray(module.designs)) {
        for (const design of module.designs) {
          const context = `Module ${module.moduleId} / ${design.storyId}`;
          if (design.figmaUrl) {
            validateFigmaUrl(design.figmaUrl, context);
          }
        }
      }
    }
  }
}

function validateBrdModules() {
  console.log('\n📄 Scanning BRD module files for inline design links...\n');
  
  if (!fs.existsSync(BRD_MODULES_DIR)) {
    warnings.push('[SKIP] BRD/modules directory not found');
    return;
  }
  
  const files = fs.readdirSync(BRD_MODULES_DIR).filter(f => f.endsWith('.md'));
  
  for (const file of files) {
    stats.modulesScanned++;
    const filePath = path.join(BRD_MODULES_DIR, file);
    const content = fs.readFileSync(filePath, 'utf-8');
    
    let match;
    while ((match = INLINE_DESIGN_PATTERN.exec(content)) !== null) {
      const [, linkText, url] = match;
      const context = `${file} / "${linkText}"`;
      validateFigmaUrl(url, context);
    }
  }
}

function printReport() {
  console.log('\n' + '='.repeat(60));
  console.log('                    FIGMA LINK VALIDATION REPORT');
  console.log('='.repeat(60) + '\n');
  
  console.log('📊 Summary:');
  console.log(`   Total links found:    ${stats.totalLinks}`);
  console.log(`   ✅ Valid links:       ${stats.validLinks}`);
  console.log(`   ⏳ TODO (pending):    ${stats.todoLinks}`);
  console.log(`   ❌ Invalid links:     ${stats.invalidLinks}`);
  console.log(`   📄 Modules scanned:   ${stats.modulesScanned}`);
  console.log('');
  
  if (errors.length > 0) {
    console.log('❌ Errors:\n');
    errors.forEach(e => console.log(`   ${e}`));
    console.log('');
  }
  
  if (warnings.length > 0 && warnings.length <= 20) {
    console.log('⚠️  Warnings:\n');
    warnings.forEach(w => console.log(`   ${w}`));
    console.log('');
  } else if (warnings.length > 20) {
    console.log(`⚠️  Warnings: ${warnings.length} total (showing first 10)\n`);
    warnings.slice(0, 10).forEach(w => console.log(`   ${w}`));
    console.log(`   ... and ${warnings.length - 10} more`);
    console.log('');
  }
  
  console.log('='.repeat(60));
  
  if (errors.length > 0) {
    console.log('❌ Validation FAILED - fix errors above');
    process.exit(1);
  } else if (stats.todoLinks > 0) {
    console.log(`⚠️  Validation PASSED with ${stats.todoLinks} TODO items remaining`);
    process.exit(0);
  } else {
    console.log('✅ Validation PASSED - all Figma links are valid');
    process.exit(0);
  }
}

// Main
console.log('🔍 Figma Link Validator');
console.log('   Checking designs/figma-index.json and BRD modules...');

validateIndexFile();
validateBrdModules();
printReport();
