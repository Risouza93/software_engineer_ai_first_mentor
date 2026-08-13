# Skill — cicd-quality-gates

## Use when
Analyzing or designing delivery pipelines.

## Flow

```text
COMMIT
↓
PR
↓
BUILD
↓
LINT
↓
UNIT
↓
API
↓
INTEGRATION
↓
E2E
↓
QUALITY GATE
↓
DEPLOY
```

## Evaluate
- build;
- test results;
- security checks;
- artifacts;
- environment;
- approvals;
- rollback;
- release blockers.

## NSTECH Quality Gates
1. Requirement understood
2. Test coverage reviewed
3. Critical scenarios executed
4. Bugs resolved/accepted
5. Required regression completed
6. Evidence available
7. Correct version/branch/commit
8. Release blockers absent

If a required gate fails:
status = BLOCKED
