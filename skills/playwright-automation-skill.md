# Skill — playwright-automation

## Use when
Creating or reviewing Playwright automation.

## Stack
- Playwright
- TypeScript
- VS Code

## Priority
Use the lowest reliable layer.

```text
API
→ Integration
→ UI
```

UI only when the risk truly depends on UI behavior.

## Core Practices
- isolated tests;
- resilient locators;
- web-first assertions;
- fixtures;
- hooks;
- trace;
- screenshots/videos when useful;
- deterministic test data;
- CI-friendly execution.

## Layers
### API
GET / POST / PUT / PATCH / DELETE

### UI
navigation / forms / permission / critical flows

### Hybrid
create via API → validate UI

## Output
- automation candidate;
- rationale;
- test code;
- setup;
- validation;
- CI considerations.
