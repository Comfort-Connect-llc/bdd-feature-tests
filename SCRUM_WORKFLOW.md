# Scrum Workflow & Sprint Management

**Version:** 1.0  
**Date:** February 23, 2026  
**Purpose:** Define how to run Agile Scrum effectively using BDD user stories as the source of truth

---

## Executive Summary

This document establishes the workflow for managing Product Backlog, Sprint Backlog, and sprint execution while maintaining alignment between:
- **BDD Specs** (source of truth for requirements)
- **Sprint Tracking Tool** (execution visibility)
- **GitHub** (code and PRs)

---

## Tool Recommendation: Keep ClickUp (with Structure Changes)

### Assessment

| Tool | Scrum Support | BDD Integration | Team Visibility | Verdict |
|------|---------------|-----------------|-----------------|---------|
| **ClickUp** | ✅ Good (Sprints, Board, List views) | ⚠️ Manual sync | ✅ Excellent | **Recommended** |
| **Jira** | ✅ Excellent | ⚠️ Manual sync | ✅ Good | Overkill for your team size |
| **Linear** | ✅ Good | ✅ GitHub-native | ✅ Excellent | Consider if team grows |
| **GitHub Projects** | ⚠️ Basic | ✅ Native | ⚠️ Limited | Not for sprint execution |
| **Shortcut** | ✅ Good | ✅ Good | ✅ Good | Alternative to ClickUp |

### Why ClickUp is Sufficient

1. **Sprint Folders** — Native sprint support with start/end dates
2. **Multiple Views** — Board, List, Timeline, Workload
3. **Custom Fields** — Can add `US-ID`, `Module`, `BDD Status` fields
4. **Automations** — Can trigger status changes, notifications
5. **Docs** — Can link to BDD repo or embed specs
6. **Team already knows it** — Migration cost is real

### What Needs to Change in ClickUp

| Current Problem | Solution |
|-----------------|----------|
| No clear Product vs Sprint Backlog separation | Create dedicated Spaces |
| Stories don't map to BDD specs | Add `US-ID` custom field |
| Completed stories mixed with active | Use `Done` status + archive quarterly |
| No module/context organization | Use Folders per Module |

---

## Recommended ClickUp Structure

```
📁 COMFORT CONNECT (Workspace)
│
├── 📂 PRODUCT BACKLOG (Space)
│   │
│   ├── 📁 Module 01 - Identity & Access (Folder)
│   │   ├── 📋 US-1.1.1: Register Dealer User Account
│   │   ├── 📋 US-1.1.2: Authenticate via OTP
│   │   └── ... (all stories for this module)
│   │
│   ├── 📁 Module 02 - Dealer Management (Folder)
│   ├── 📁 Module 03 - Prequalification & Origination (Folder)
│   ├── 📁 Module 04 - Underwriting & Verification (Folder)
│   ├── 📁 Module 05 - Pricing & Equipment (Folder)
│   ├── 📁 Module 06 - Document Management (Folder)
│   ├── 📁 Module 07 - Installation & Funding (Folder)
│   ├── 📁 Module 08 - Billing & Payments (Folder)
│   ├── 📁 Module 09 - Account Servicing (Folder)
│   ├── 📁 Module 10 - Communications (Folder)
│   ├── 📁 Module 11 - Promotions (Folder)
│   ├── 📁 Module 12 - Administration (Folder)
│   │
│   └── 📁 Future Modules (Folder)
│       ├── 📋 [New stories added here before sprint planning]
│       └── ...
│
├── 📂 SPRINT EXECUTION (Space)
│   │
│   ├── 📁 Sprint 2026-05 (Feb 24 - Mar 7) (Folder)
│   │   ├── 📋 Sprint Goal: [Clear objective]
│   │   ├── 📋 US-5.1.1: Generate Payment Quote
│   │   ├── 📋 US-5.1.2: Calculate Premier Program Payments
│   │   └── ... (committed stories for this sprint)
│   │
│   ├── 📁 Sprint 2026-06 (Mar 10 - Mar 21) (Folder)
│   └── ...
│
└── 📂 SPRINT ARCHIVE (Space)
    ├── 📁 Sprint 2026-01 (Completed)
    ├── 📁 Sprint 2026-02 (Completed)
    └── ...
```

---

## Custom Fields (Required)

Add these custom fields to every task in ClickUp:

| Field | Type | Purpose | Example |
|-------|------|---------|---------|
| **US-ID** | Text | Links to BDD spec | `US-5.1.1` |
| **Module** | Dropdown | Bounded context | `Module 05 - Pricing` |
| **BDD Status** | Dropdown | Spec readiness | `Draft`, `Ready`, `Automated` |
| **Story Points** | Number | Estimation | `3` |
| **GitHub PR** | URL | Link to implementation | `github.com/.../pull/123` |
| **Figma** | URL | Design link | `figma.com/file/...` |

---

## Story Statuses (Kanban Columns)

```
┌─────────────┐  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐
│   BACKLOG   │  │   READY     │  │ IN PROGRESS │  │   REVIEW    │  │    DONE     │
│             │  │             │  │             │  │             │  │             │
│ Not yet     │  │ Groomed,    │  │ Developer   │  │ PR open,    │  │ Merged,     │
│ refined     │  │ estimated,  │  │ actively    │  │ tests pass, │  │ deployed,   │
│             │  │ ready for   │  │ coding      │  │ awaiting    │  │ verified    │
│             │  │ sprint      │  │             │  │ approval    │  │             │
└─────────────┘  └─────────────┘  └─────────────┘  └─────────────┘  └─────────────┘
```

---

## Workflow: Story Lifecycle

### Phase 1: Story Creation (Product Owner)

```
1. PO identifies new capability needed
   │
2. PO writes user story in BDD repo
   │  └── BRD/modules/Module_XX_Name.md
   │      └── Add: US-X.Y.Z with acceptance criteria
   │
3. PO adds Figma design link (if UI story)
   │  └── 🎨 **Design:** [Screen Name](figma-url)
   │
4. PO creates corresponding task in ClickUp
   │  └── Product Backlog > Module Folder
   │  └── Set US-ID, Module, BDD Status = "Draft"
   │
5. PO commits BDD changes to repo
   └── git commit -m "Add US-X.Y.Z: [Story Title]"
```

### Phase 2: Backlog Refinement (Team)

```
Weekly refinement session (1 hour):

1. Review stories in "Backlog" status
   │
2. For each story:
   │  ├── Clarify acceptance criteria
   │  ├── Identify technical dependencies
   │  ├── Estimate story points (Planning Poker)
   │  └── Update BDD spec if needed
   │
3. Move refined stories to "Ready" status
   │
4. Update ClickUp:
   │  ├── Set Story Points
   │  ├── Set BDD Status = "Ready"
   │  └── Add any technical notes
   │
5. Commit BDD updates to repo
```

### Phase 3: Sprint Planning (Team)

```
Sprint Planning (2 hours at sprint start):

1. Review sprint goal with stakeholders
   │
2. PO presents prioritized "Ready" stories
   │
3. Team pulls stories into Sprint Backlog
   │  └── Move from Product Backlog to Sprint Folder
   │  └── Total points ≤ team velocity
   │
4. For each committed story:
   │  ├── Break into tasks if needed
   │  ├── Identify who will work on it
   │  └── Flag any blockers
   │
5. Team commits to sprint goal
```

### Phase 4: Sprint Execution (Developers)

```
Daily workflow:

1. Developer picks story from Sprint Backlog
   │  └── Move to "In Progress"
   │  └── Assign to self
   │
2. Developer reads BDD spec
   │  └── Open: BRD/modules/Module_XX.md
   │  └── Find: US-X.Y.Z
   │  └── Review: Acceptance criteria + Figma design
   │
3. Developer implements
   │  ├── Create feature branch: `feature/US-X-Y-Z-short-name`
   │  ├── Write/update tests based on BDD scenarios
   │  ├── Implement functionality
   │  └── Ensure tests pass
   │
4. Developer opens PR
   │  ├── Title: `US-X.Y.Z: [Story Title]`
   │  ├── Link to ClickUp task
   │  ├── Link to BDD spec
   │  └── Request review
   │
5. Update ClickUp
   │  └── Move to "Review"
   │  └── Add PR link to GitHub PR field
   │
6. Code Review + Approval
   │
7. Merge to main
   │  └── Move to "Done" in ClickUp
   │
8. Update BDD Status = "Automated" (if tests added)
```

### Phase 5: Sprint Review & Retro

```
Sprint Review (1 hour):

1. Demo completed stories to stakeholders
   │  └── Show working functionality
   │  └── Reference original BDD acceptance criteria
   │
2. PO accepts/rejects each story
   │  └── Accepted → stays "Done"
   │  └── Rejected → back to "Backlog" with notes
   │
3. Update TRACEABILITY_MAP.json if needed
   └── node convert-to-features.js

Sprint Retro (1 hour):

1. What went well?
2. What could improve?
3. Action items for next sprint
```

---

## Alignment: BDD Repo ↔ ClickUp ↔ GitHub

### Single Source of Truth Principle

| Artifact | Source of Truth | Synced To |
|----------|-----------------|-----------|
| **Requirements** | BDD Repo (`BRD/modules/*.md`) | ClickUp (summary only) |
| **Acceptance Criteria** | BDD Repo | Feature files |
| **Sprint Status** | ClickUp | — |
| **Code** | GitHub | — |
| **Test Results** | GitHub Actions | ClickUp (link) |

### Sync Rules

1. **US-ID is the key** — Every story has one ID used everywhere
2. **BDD is canonical** — If ClickUp and BDD disagree, BDD wins
3. **ClickUp is operational** — Sprint status, assignments, velocity
4. **GitHub is implementation** — PRs, commits, deployments

### Linking Convention

**ClickUp Task:**
```
Title: US-5.1.1: Generate Payment Quote
Description: 
  BDD Spec: https://github.com/.../BRD/modules/Module_05_Pricing_Equipment.md#us-511
  
  [Copy acceptance criteria summary here]

Custom Fields:
  US-ID: US-5.1.1
  Module: Module 05 - Pricing
  Figma: https://figma.com/...
  GitHub PR: [added when PR opened]
```

**GitHub PR:**
```
Title: US-5.1.1: Generate Payment Quote

## Summary
Implements quote generation for dealers.

## BDD Spec
- [US-5.1.1](link-to-bdd-file)

## ClickUp
- [Task Link](clickup-url)

## Acceptance Criteria
- [x] Given project amount and customer info, quotes are calculated
- [x] Quote displays term length, payment amount, total cost
```

**Git Branch:**
```
feature/US-5-1-1-generate-payment-quote
```

**Git Commit:**
```
US-5.1.1: Implement quote calculation service

- Add QuoteService with payment calculation
- Add QuoteController endpoint
- Add unit tests for quote scenarios
```

---

## Scaling Best Practices

### As Team Grows (5+ developers)

1. **Split by Module** — Each bounded context gets its own Scrum team
2. **Shared Sprint Cadence** — All teams sprint together for integration
3. **Cross-team Backlog Refinement** — Weekly sync for dependencies
4. **Module Ownership** — Each module has a technical lead

### As Product Grows (new modules)

1. **Add Module folder** in BDD repo first
2. **Add Module folder** in ClickUp Product Backlog
3. **Update figma-index.json** with new module
4. **Update DDD_CONTEXT_MAP.md** with bounded context

### Recommended Cadence

| Team Size | Sprint Length | Refinement | Planning | Review | Retro |
|-----------|---------------|------------|----------|--------|-------|
| 2-4 devs | 2 weeks | 1h/week | 2h | 1h | 45min |
| 5-8 devs | 2 weeks | 2h/week | 3h | 1.5h | 1h |
| 9+ devs | 2 weeks (split teams) | 1h/team/week | 2h/team | 1h/team | 45min/team |

### Velocity Tracking

Track in ClickUp:
- **Committed Points** — What team planned
- **Completed Points** — What got to Done
- **Velocity** — Rolling 3-sprint average

Use for capacity planning:
```
Next Sprint Capacity = Average Velocity × (Available Days / Sprint Days)
```

---

## Quarterly Maintenance

### End of Quarter Checklist

- [ ] Archive completed sprints to Sprint Archive space
- [ ] Review Product Backlog for stale stories
- [ ] Update BDD specs for any completed modules
- [ ] Run `node scripts/validate-figma-links.js`
- [ ] Update TRACEABILITY_MAP.json
- [ ] Review and update DDD_CONTEXT_MAP.md
- [ ] Conduct quarterly planning for next quarter's modules

---

## Quick Reference

### For Product Owners

```bash
# Adding a new story
1. Edit BRD/modules/Module_XX.md
2. Add user story with acceptance criteria
3. Add Figma link: 🎨 **Design:** [Name](url)
4. Commit: git commit -m "Add US-X.Y.Z: [Title]"
5. Create ClickUp task with US-ID
```

### For Developers

```bash
# Starting a story
1. Move ClickUp task to "In Progress"
2. Read BDD spec in BRD/modules/
3. Create branch: git checkout -b feature/US-X-Y-Z-name
4. Implement and test
5. Open PR with US-ID in title
6. Update ClickUp with PR link
```

### For Scrum Master

```bash
# Sprint health check
1. All "In Progress" stories have assignees
2. No story in "In Progress" > 3 days without update
3. All "Review" stories have PR links
4. Sprint burndown on track
```

---

## Appendix: ClickUp Setup Checklist

- [ ] Create "Product Backlog" Space
- [ ] Create "Sprint Execution" Space  
- [ ] Create "Sprint Archive" Space
- [ ] Create Folder per Module (12 folders)
- [ ] Add custom fields: US-ID, Module, BDD Status, Story Points, GitHub PR, Figma
- [ ] Create status workflow: Backlog → Ready → In Progress → Review → Done
- [ ] Set up Board view for Sprint Execution
- [ ] Set up Sprint dashboards for velocity tracking
- [ ] Configure automations (optional):
  - When status → Review, notify reviewer
  - When status → Done, log completion date
