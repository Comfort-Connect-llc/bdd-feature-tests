# Comfort Connect — Component Reference

> This document is the authoritative reference for building Portal 2.0 screens.
> Read this file before composing any new page or prototype.

---

## Quick Start

```tsx
// Import CC-specific components from the barrel:
import { PortalLayout, TrackerPills, StatusBadge } from "@/components/cc";

// Import base shadcn/ui components from ui/:
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";

// Import icons from lucide-react:
import { Home, FileText, DollarSign } from "lucide-react";
```

---

## Page Layout Pattern

Every portal screen uses the same shell. Wrap your page content in `PortalLayout`:

```tsx
import { PortalLayout } from "@/components/cc";
import type { SidebarNavItem } from "@/components/cc";

const navItems: SidebarNavItem[] = [
  { icon: Home, label: "Dashboard", active: true },
  { icon: ClipboardList, label: "Applications" },
  { icon: Users, label: "Customers" },
  { icon: Star, label: "Promotions" },
  { icon: FileText, label: "Reports" },
  { icon: HelpCircle, label: "Help" },
];

const bottomNavItems: SidebarNavItem[] = [
  { icon: Settings, label: "Settings" },
  { icon: LogOut, label: "Logout" },
];

export default function MyPage() {
  return (
    <PortalLayout
      sidebarItems={navItems}
      sidebarBottomItems={bottomNavItems}
      userName="Jane Dealer"
      userRole="Senior Dealer"
      notificationCount={3}
    >
      {/* Your page content here */}
    </PortalLayout>
  );
}
```

**Layout structure:** Dark navy sidebar (60px) | Navy topbar (48px) | Light gray (#f0f2f5) scrollable content area with `p-6` padding.

---

## Custom CC Components

All custom components live in `src/components/cc/` and follow shadcn/ui conventions (forwardRef, cn utility, cva for variants).

### PortalLayout

Full page shell combining sidebar + topbar + content.

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `sidebarItems` | `SidebarNavItem[]` | required | Main nav items |
| `sidebarBottomItems` | `SidebarNavItem[]` | `undefined` | Bottom nav (settings, logout) |
| `userName` | `string` | `undefined` | Topbar user name |
| `userRole` | `string` | `undefined` | Topbar role label |
| `brandName` | `string` | `"ComfortConnect"` | Brand text in topbar |
| `notificationCount` | `number` | `undefined` | Notification badge count |
| `contentClassName` | `string` | `undefined` | Extra classes on content area |
| `children` | `ReactNode` | required | Page content |

### PortalSidebar

Dark navy icon-only sidebar.

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `items` | `SidebarNavItem[]` | required | Main nav items |
| `bottomItems` | `SidebarNavItem[]` | `undefined` | Bottom-anchored items |
| `logo` | `ReactNode` | CC house icon | Custom logo element |

```ts
interface SidebarNavItem {
  icon: LucideIcon;
  label: string;
  href?: string;
  active?: boolean;
  onClick?: () => void;
}
```

### PortalTopbar

Navy branded header bar.

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `brandName` | `string` | `"ComfortConnect"` | Brand name |
| `userName` | `string` | `"User"` | Display name |
| `userRole` | `string` | `undefined` | Role label |
| `notificationCount` | `number` | `0` | Badge count |
| `onProfileClick` | `() => void` | `undefined` | Profile click handler |
| `onNotificationClick` | `() => void` | `undefined` | Bell click handler |

---

### TrackerPills

7-stage horizontal lifecycle bar (Apply → Sign → Pay → Authorize → Install → Review → Fund).

```tsx
<TrackerPills currentStage={3} />
<TrackerPills currentStage={3} size="lg" />
<TrackerPills stages={["Submit", "Review", "Approve"]} currentStage={1} />
```

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `stages` | `readonly string[]` | `DEFAULT_STAGES` (7 stages) | Stage labels |
| `currentStage` | `number` | required | Zero-indexed active stage |
| `size` | `"sm" \| "md" \| "lg"` | `"md"` | Height variant |

**Colors:** completed = `--cc-green`, active = `--cc-navy`, pending = `--gray-200`.

---

### PortalStepper

Vertical or horizontal step indicator with circles and connector lines.

```tsx
<PortalStepper
  steps={[
    { label: "Applicant Info", description: "Enter details" },
    { label: "Equipment", description: "Select equipment" },
    { label: "Review", description: "Review & submit" },
  ]}
  currentStep={1}
  orientation="vertical"
/>
```

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `steps` | `StepItem[]` | required | Step definitions |
| `currentStep` | `number` | required | Zero-indexed active step |
| `orientation` | `"vertical" \| "horizontal"` | `"vertical"` | Layout |
| `size` | `"sm" \| "md" \| "lg"` | `"md"` | Size |

```ts
interface StepItem {
  label: string;
  description?: string;
}
```

**States:** completed (green circle + checkmark), active (navy circle + ring shadow), pending (white circle + gray border). Connected by 3px rounded lines.

---

### StatusBadge

Semantic status badge with leading dot indicator. Maps to 15 CC-specific statuses.

```tsx
<StatusBadge status="approved" />
<StatusBadge status="pending_review" size="md" />
<StatusBadge status="funded" label="Custom Label" />
```

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `status` | `CCStatus` | required | Semantic status key |
| `label` | `string` | auto from status | Override label |
| `size` | `"sm" \| "md"` | `"sm"` | Size |
| `hideDot` | `boolean` | `false` | Hide the leading dot |

**Available statuses:** `draft`, `submitted`, `pending`, `pending_review`, `in_progress`, `approved`, `conditionally_approved`, `declined`, `expired`, `active`, `funded`, `completed`, `cancelled`, `on_hold`, `error`

---

### NotificationBanner

Color-coded alert banner with optional dismiss.

```tsx
<NotificationBanner variant="success" title="Application Approved">
  The loan application has been approved by Momnt.
</NotificationBanner>

<NotificationBanner variant="warning" title="Missing Documents" dismissible onDismiss={() => {}}>
  Please upload proof of income to continue.
</NotificationBanner>
```

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `variant` | `"info" \| "success" \| "warning" \| "error"` | `"info"` | Color variant |
| `title` | `string` | `undefined` | Bold title text |
| `dismissible` | `boolean` | `false` | Show dismiss button |
| `onDismiss` | `() => void` | `undefined` | Dismiss callback |
| `children` | `ReactNode` | `undefined` | Body content |

---

### StatCard

KPI / metric summary card with optional trend indicator.

```tsx
<StatCard
  label="Total Applications"
  value="1,247"
  icon={<FileText className="w-5 h-5" />}
  trend={{ value: 12, direction: "up" }}
  variant="navy"
/>
```

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `label` | `string` | required | Metric label |
| `value` | `string` | required | Formatted display value |
| `icon` | `ReactNode` | `undefined` | Icon element |
| `trend` | `{ value: number; direction: "up" \| "down" \| "flat" }` | `undefined` | Trend info |
| `variant` | `"default" \| "navy" \| "success" \| "warning" \| "error"` | `"default"` | Accent color |
| `description` | `string` | `undefined` | Subtitle text |

---

### InfoPanel

Two-column key-value summary panel.

```tsx
<InfoPanel
  title="Loan Summary"
  icon={<Info className="w-3.5 h-3.5" />}
  items={[
    { label: "Approved Amount", value: "$12,500.00" },
    { label: "Loan Term", value: "120 months" },
    { label: "APR", value: "9.99%" },
    { label: "Monthly Payment", value: "$165.23" },
  ]}
/>
```

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `title` | `string` | `undefined` | Panel heading |
| `icon` | `ReactNode` | `undefined` | Icon next to title |
| `items` | `InfoPanelItem[]` | required | Key-value pairs |
| `variant` | `"subtle" \| "outlined" \| "navy"` | `"subtle"` | Visual variant |

---

### ReadinessCard

Account readiness status card with blocker detection.

```tsx
<ReadinessCard
  title="Momnt Account Readiness"
  items={[
    { label: "Welcome Call", status: "completed" },
    { label: "Portal Setup", status: "incomplete" },
  ]}
  blockerMessage="Charge request may be rejected until readiness conditions are met."
/>
```

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `title` | `string` | `"Account Readiness"` | Card heading |
| `items` | `ReadinessItem[]` | required | Status items |
| `blockerMessage` | `string` | `undefined` | Warning text when blocked |
| `hasBlocker` | `boolean` | auto-detected | Force blocker state |

**Readiness statuses:** `scheduled`, `attempted`, `completed`, `complete`, `incomplete`, `failed`, `pending`

---

### Timeline / TimelineItem

Vertical event timeline.

```tsx
<Timeline>
  <TimelineItem
    icon={<FileText className="w-4 h-4" />}
    label="Application Submitted"
    time="Mar 10, 2026 at 2:15 PM"
    status="completed"
  />
  <TimelineItem
    icon={<Send className="w-4 h-4" />}
    label="Charge Request Initiated"
    time="Mar 11, 2026 at 9:30 AM"
    status="active"
  />
</Timeline>
```

| Prop (TimelineItem) | Type | Default | Description |
|---------------------|------|---------|-------------|
| `icon` | `ReactNode` | required | Circle icon |
| `label` | `string` | required | Event label |
| `time` | `string` | required | Timestamp text |
| `description` | `string` | `undefined` | Extra detail |
| `status` | `"completed" \| "active" \| "pending"` | `"pending"` | Visual state |

---

### FormSection

Orange-labeled form group container (Portal 2.0 distinctive pattern).

```tsx
<FormSection label="Applicant Information">
  <div className="grid grid-cols-2 gap-4">
    <Input placeholder="First Name" />
    <Input placeholder="Last Name" />
  </div>
</FormSection>
```

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `label` | `string` | required | Orange uppercase label |
| `description` | `string` | `undefined` | Subtitle text |
| `action` | `ReactNode` | `undefined` | Right-side action element |
| `children` | `ReactNode` | `undefined` | Form fields |

---

## Base shadcn/ui Components (43 installed)

These are pre-installed and themed with CC tokens. Import from `@/components/ui/`:

**Layout:** `Card`, `Separator`, `Tabs`, `Accordion`, `Collapsible`, `ResizablePanel`, `ScrollArea`, `AspectRatio`

**Forms:** `Button`, `Input`, `Textarea`, `Label`, `Checkbox`, `RadioGroup`, `Select`, `Switch`, `Slider`, `Form` (react-hook-form), `Calendar`

**Data Display:** `Badge`, `Table`, `Avatar`, `Progress`, `Skeleton`, `HoverCard`, `Carousel`

**Overlay:** `Dialog`, `Sheet`, `Drawer`, `Popover`, `Tooltip`, `DropdownMenu`, `ContextMenu`, `Menubar`, `NavigationMenu`, `Command`, `AlertDialog`

**Feedback:** `Alert`, `Toast/Toaster` (sonner), `Toggle`, `ToggleGroup`, `Breadcrumb`

---

## Design Tokens Quick Reference

### Colors (use CSS custom properties)

| Token | Value | Usage |
|-------|-------|-------|
| `--cc-navy` | #002F6C | Primary brand, headings, sidebar, topbar |
| `--cc-green` | #6CC24A | Primary CTA buttons, success |
| `--cc-navy-dark` | #002147 | Sidebar background |
| `--cc-orange` | #EE8F1E | Form section labels, secondary accent |
| `--cc-red` | #DD331D | Error, destructive actions |
| `--cc-amber` | #E8B93F | Warning states |
| `--cc-blue-main` | #009CDE | Links, info elements |

### Typography

- **Font:** Nunito Sans (Google Fonts)
- **Headings:** `font-bold`, sizes: H1 57.3px, H2 47.78px, H3 39.81px, H4 27.65px, H5 23.04px, H6 19.2px
- **Body:** Medium 16px | Small 13.33px | XS 11.11px
- **Text colors:** `--text-heading` (#14181F), `--text-body` (#414750), `--text-placeholder` (#8B939F)

### Key Patterns

1. **Green buttons** for primary CTAs: `className="bg-[var(--cc-green)] hover:bg-[var(--cc-green)]/90 text-white"`
2. **Navy buttons** for secondary: use `<Button>` (default variant maps to navy)
3. **Orange form labels:** use `<FormSection>` component
4. **White cards** on gray background: cards use default white, page background is `#f0f2f5`
5. **TrackerPills** appears on all post-approval screens
6. **StatusBadge** for any loan/application/account status display

---

## File Structure

```
src/
├── components/
│   ├── cc/                     # Custom Comfort Connect components
│   │   ├── index.ts            # Barrel export
│   │   ├── portal-layout.tsx
│   │   ├── portal-sidebar.tsx
│   │   ├── portal-topbar.tsx
│   │   ├── portal-stepper.tsx
│   │   ├── tracker-pills.tsx
│   │   ├── form-section.tsx
│   │   ├── notification-banner.tsx
│   │   ├── readiness-card.tsx
│   │   ├── stat-card.tsx
│   │   ├── status-badge.tsx
│   │   ├── info-panel.tsx
│   │   └── timeline.tsx
│   └── ui/                     # shadcn/ui base (43 components)
│       ├── button.tsx
│       ├── card.tsx
│       ├── input.tsx
│       └── ... (40 more)
├── lib/
│   └── utils.ts                # cn() utility
├── index.css                   # Design tokens + Tailwind
├── App.tsx                     # Momnt charge workflow demo
├── Demo.tsx                    # Component storybook page
└── main.tsx                    # Entry point
```
