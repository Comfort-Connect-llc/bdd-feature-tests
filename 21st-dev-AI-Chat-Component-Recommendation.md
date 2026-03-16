# 21st.dev AI Chat Component Recommendation
## For Comfort Connect Portal 2.0

**Date:** 2026-03-12
**Components Reviewed:** 78 total in AI Chat category
**Components Inspected in Detail:** 7

---

## Executive Summary

After reviewing all 78 AI Chat components on 21st.dev, the **shadcn-chat library by Jakob Hoeg Mark** (`jakobhoeg`) is the strongest fit for Comfort Connect Portal 2.0. It provides a modular, composable chat system built on shadcn/ui primitives that can be themed to match our Portal 2.0 design system with minimal effort.

**Primary Recommendation:** `jakobhoeg/expandable-chat` (with its sibling components)
**Secondary Recommendation:** `ahmedmayara/ai-assistant-card` (for a simpler quick-actions panel)

---

## Detailed Evaluation

### Components Inspected

| # | Component | Author | Views | Verdict |
|---|-----------|--------|-------|---------|
| 1 | **Expandable Chat** | jakobhoeg | 353 | **PRIMARY PICK** — Floating chat widget with full message system |
| 2 | **Chat Message List** | jakobhoeg | 148 | **COMPLEMENTARY** — Core message display, part of same library |
| 3 | **AI Assistant Card** | ahmedmayara | 84 | **SECONDARY PICK** — Clean task-card with quick actions |
| 4 | **V0 AI Chat** | kokonutd | 265 | Not suitable — Generative coding tool pattern (v0-style) |
| 5 | **Chat Interface** | tonyzebastian | — | Not suitable — Stylized messaging, warm-toned aesthetic |
| 6 | **Bolt Style Chat** | Abuhuraira | 215 | Not suitable — Dark coding assistant pattern (bolt.new-style) |
| 7 | **AI Voice Input** | ilyichv | 510 | Not suitable — Voice-only input component, no chat UI |

### Components Eliminated Without Inspection

Most of the remaining 71 components fall into categories that don't fit Comfort Connect's needs: AI code generation interfaces (v0/bolt/cursor clones), voice-only inputs, text animation effects (shimmer, typewriter), full-page dark-themed AI apps, and highly opinionated aesthetic choices. The chat widget / support panel pattern we need narrows the field considerably.

---

## Primary Recommendation: shadcn-chat by jakobhoeg

### Why This Library

The `shadcn-chat` ecosystem is not a single component — it's a **modular chat system** consisting of composable pieces that can be mixed and matched:

| Sub-component | Purpose | Install Command |
|--------------|---------|-----------------|
| `ExpandableChat` | Floating chat widget container (bottom-right bubble → expandable panel) | `npx shadcn@latest add "https://21st.dev/r/jakobhoeg/expandable-chat"` |
| `ChatMessageList` | Scrollable message container with auto-scroll hook | `npx shadcn@latest add "https://21st.dev/r/jakobhoeg/chat-message-list"` |
| `ChatBubble` | Individual message bubble (AI left-aligned, User right-aligned) | Included with ExpandableChat |
| `ChatBubbleAvatar` | Avatar circle for AI/user messages | Included with ExpandableChat |
| `ChatBubbleMessage` | Message text content with loading state | Included with ExpandableChat |
| `ChatInput` | Text input with attachment & mic icon slots | Included with ExpandableChat |

### Key Strengths for Comfort Connect

1. **Floating Widget Pattern** — The `ExpandableChat` renders as a bottom-right chat bubble that expands into a panel. This is the exact pattern needed for an in-portal support assistant that doesn't disrupt the main workflow (e.g., while a dealer is processing a loan application).

2. **shadcn/ui Native** — Built on the same Radix + Tailwind foundation as our existing component stack. Theming is done through CSS variables, which means we can map our Portal 2.0 design tokens directly:
   - `--cc-navy` (#002F6C) → chat header background
   - `--cc-green` (#6CC24A) → send button / active states
   - `--cc-blue-main` (#009CDE) → link colors in messages
   - `--bg-general` (#F9FAFB) → message area background

3. **Vercel AI SDK Integration** — Has a ready-made example repo at `github.com/jakobhoeg/shadcn-chat/tree/master/examples/shadcn-chat-example-vercel-ai` showing how to wire up streaming AI responses. This is directly compatible with Claude API / Anthropic SDK for building an AI-powered dealer assistant.

4. **Minimal Dependencies** — Only requires `lucide-react` (which we already use) and standard shadcn primitives.

5. **Auto-scroll Hook** — The `useAutoScroll` hook handles the tricky UX of auto-scrolling to new messages while allowing users to scroll up through history — a detail that's easy to get wrong.

### Use Cases in Comfort Connect

| Use Case | Implementation |
|----------|---------------|
| **Dealer Support Chat** | Floating widget on all portal pages — dealers can ask questions about loan flows, lender requirements, status updates |
| **Application Guidance** | Context-aware assistant during prequal/origination flow — suggests next steps, explains underwriting requirements |
| **Homeowner Chat** | Customer-facing chat on the borrower portal for payment questions, document submission help |
| **Admin Notifications** | Could repurpose the message list component for a notification/activity feed panel |

---

## Secondary Recommendation: AI Assistant Card by ahmedmayara

### Why This Component

The `AI Assistant Card` provides a different but complementary pattern — a **task-focused assistant panel** rather than a conversational chat widget.

**Install:** `npx shadcn@latest add "https://21st.dev/r/ahmedmayara/ai-assistant-card"`

### Key Features
- Personalized welcome message ("Hi [Name], Welcome back!")
- Quick action chips (customizable — could be "Check Loan Status", "Submit Documents", "Calculate Payment", etc.)
- Model selector dropdown (could repurpose as "Topic" or "Department" selector)
- Attachment support
- Clean card-based layout with close/minimize controls
- Only dependency: `lucide-react`

### Best Fit
This is ideal for a **dashboard landing page assistant** — a proactive help card that appears when a dealer first logs in, offering quick actions relevant to their workflow. Think of it as the "concierge" pattern vs. the "support chat" pattern of the Expandable Chat.

---

## Integration Roadmap

### Phase 1: Prototype (Current HTML Wireframes)
For our current single-file HTML prototype workflow, these components aren't directly usable (they're React/TypeScript). However, I can:
- **Build an HTML mockup** of the chat widget that mirrors the Expandable Chat's UI using our Portal 2.0 design system
- Include it in the design library as a reference component
- Wire up simulated message flow with vanilla JS

### Phase 2: React Migration
When the project moves to the React/TypeScript build:
```bash
# Install the full shadcn-chat suite
npx shadcn@latest add "https://21st.dev/r/jakobhoeg/expandable-chat"

# This installs all sub-components:
# - expandable-chat.tsx
# - chat-bubble.tsx
# - chat-message-list.tsx
# - chat-input.tsx
```

Then theme it with Portal 2.0 tokens:
```css
/* In your globals.css or tailwind theme */
:root {
  --chat-header-bg: #002F6C;      /* cc-navy */
  --chat-bubble-ai: #F9FAFB;      /* bg-general */
  --chat-bubble-user: #EDF4FF;    /* bg-primary */
  --chat-send-btn: #6CC24A;       /* cc-green */
  --chat-accent: #009CDE;         /* cc-blue-main */
}
```

### Phase 3: AI Backend
Connect to an AI backend using the Vercel AI SDK pattern:
```typescript
// Example: Dealer Assistant with Claude
import { useChat } from 'ai/react';

export function DealerAssistant() {
  const { messages, input, handleInputChange, handleSubmit, isLoading } = useChat({
    api: '/api/chat',
    initialMessages: [{
      id: '1',
      role: 'assistant',
      content: 'Hi! I\'m your Comfort Connect assistant. How can I help with your financing workflow today?'
    }]
  });
  // ... render with ExpandableChat components
}
```

---

## Summary Matrix

| Criteria | Expandable Chat (jakobhoeg) | AI Assistant Card (ahmedmayara) | V0 AI Chat | Bolt Style Chat |
|----------|:---:|:---:|:---:|:---:|
| Portal support widget | ★★★★★ | ★★★☆☆ | ★☆☆☆☆ | ★☆☆☆☆ |
| shadcn/ui compatible | ★★★★★ | ★★★★★ | ★★★★☆ | ★★★☆☆ |
| Themeable to Portal 2.0 | ★★★★★ | ★★★★★ | ★★☆☆☆ | ★☆☆☆☆ |
| Modular / composable | ★★★★★ | ★★★☆☆ | ★★☆☆☆ | ★★☆☆☆ |
| AI SDK integration | ★★★★★ | ★★★☆☆ | ★★★★☆ | ★★★★☆ |
| Minimal dependencies | ★★★★★ | ★★★★★ | ★★★☆☆ | ★★☆☆☆ |
| Community adoption | ★★★★☆ (353+148) | ★★★☆☆ (84) | ★★★★☆ (265) | ★★★★☆ (215) |

**Bottom line:** Use **Expandable Chat** for the primary dealer/homeowner support chat widget, and consider **AI Assistant Card** for a dashboard welcome/quick-actions panel.

---

*Generated 2026-03-12 — Comfort Connect Portal 2.0 Design Process*
