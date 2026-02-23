# Figma Design Linking Convention

**Version:** 1.0  
**Date:** February 23, 2026  
**Purpose:** Eliminate Figma dependency by making this repo fully self-contained for UI/UX requirements

---

## Overview

This document establishes the convention for linking Figma designs directly to user stories, ensuring developers and testers can access complete requirements (business logic + UI/UX) from a single source.

---

## Convention Summary

| Layer | Where Figma Links Live | Format |
|-------|------------------------|--------|
| **Module-level** | BRD module file header | YAML front matter |
| **Story-level** | Inline after user story | `🎨 Design:` annotation |
| **Index** | `designs/figma-index.json` | Machine-readable JSON |

---

## Pattern 1: YAML Front Matter (Module-Level)

Add to the top of each BRD module file:

```yaml
---
figma:
  file: "https://figma.com/file/ABC123/Comfort-Connect"
  frames:
    - id: "module-05-overview"
      name: "Pricing & Equipment Overview"
      url: "https://figma.com/file/ABC123?node-id=1234-5678"
    - id: "quote-generation-flow"
      name: "Quote Generation Flow"
      url: "https://figma.com/file/ABC123?node-id=2345-6789"
---
```

**Why:** Provides module-level context and allows linking to flow diagrams, wireframes, or component libraries relevant to the entire module.

---

## Pattern 2: Inline Design Annotation (Story-Level)

Add after each user story's acceptance criteria:

```markdown
**US-5.1.1: Generate Payment Quote**
> As a **Dealer**, I want to generate a payment quote...

**Acceptance Criteria:**
- Given project amount and customer information
- When I generate a quote
- Then monthly payment amounts are calculated...

🎨 **Design:** [Quote Calculator Screen](https://figma.com/file/ABC123?node-id=3456-7890)
```

**Why:** 
- Non-intrusive (doesn't break existing tooling)
- Easy for POs to maintain
- Renders nicely in markdown viewers
- Searchable in the codebase

---

## Figma URL Format

Always use the **specific frame URL** format with `node-id`:

```
https://www.figma.com/file/{FILE_ID}/{FILE_NAME}?node-id={NODE_ID}
```

**How to get this URL in Figma:**
1. Select the frame/component in Figma
2. Right-click → "Copy link to selection"
3. Paste into the markdown file

**Example:**
```
https://www.figma.com/file/ABC123/Comfort-Connect-Platform?node-id=1234-5678&t=abcd1234
```

---

## Pattern 3: Figma Index (Optional, for Tooling)

Generate `designs/figma-index.json` for programmatic access:

```json
{
  "version": "1.0",
  "lastUpdated": "2026-02-23",
  "figmaFileId": "ABC123",
  "modules": [
    {
      "module": "Module_05_Pricing_Equipment",
      "frames": [
        {
          "storyId": "US-5.1.1",
          "title": "Generate Payment Quote",
          "figmaUrl": "https://figma.com/file/ABC123?node-id=3456-7890",
          "frameId": "3456-7890",
          "frameName": "Quote Calculator Screen"
        }
      ]
    }
  ]
}
```

---

## Quick Reference

### Adding a Design Link to a Story

1. Open the BRD module file (e.g., `BRD/modules/Module_05_Pricing_Equipment.md`)
2. Find the user story
3. Add after the acceptance criteria:
   ```
   🎨 **Design:** [Screen Name](figma-url-with-node-id)
   ```

### Adding Module-Level Frames

1. Add YAML front matter to the module file (if not present)
2. Add frame references under `figma.frames`

### Verifying Links

Run the validation script:
```bash
node scripts/validate-figma-links.js
```

---

## Conventions

| Convention | Example |
|------------|---------|
| Use specific frame links, not file root | ✅ `?node-id=1234-5678` not ❌ just file URL |
| Name links descriptively | ✅ `[Quote Calculator Screen]` not ❌ `[Link]` |
| One link per screen/flow | Group related screens in module header |
| Update links when Figma changes | Use Figma branches for versioning |

---

## Figma Best Practices for Design Team

To support this linking convention, the design team should:

1. **Use consistent frame naming** - Match user story IDs where possible (e.g., "US-5.1.1 Quote Calculator")
2. **Organize by module** - Keep module frames grouped in Figma pages
3. **Avoid renaming frames** - Figma URLs break if frames are deleted; renaming is okay
4. **Use Figma branches** - For major redesigns, create branches to preserve links

---

## Migration Checklist

- [ ] Add YAML front matter to all 12 BRD module files
- [ ] Add inline design links to user stories with UI components
- [ ] Create `designs/figma-index.json` index
- [ ] Add link validation script
- [ ] Update BRD README with linking instructions

---

## FAQ

**Q: What if a story has no UI component?**  
A: Skip the design link. API-only or batch processing stories don't need Figma references.

**Q: What if multiple stories share one screen?**  
A: Link to the same Figma frame from each story. Or create a "Shared Screens" section in the module header.

**Q: Can I link to Figma prototypes instead of frames?**  
A: Yes! Use the prototype URL. Format: `https://figma.com/proto/{FILE_ID}?node-id={NODE_ID}`

**Q: What happens if Figma links break?**  
A: Run the validation script periodically. Figma node-id links survive frame renaming but break on deletion.
