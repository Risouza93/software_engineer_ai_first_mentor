# Skill — github-pr-analysis

## Use when
- analyzing a Pull Request;
- reading a `.diff`;
- comparing PBI intent to implementation;
- identifying changed rules;
- deriving QA risks;
- preparing regression analysis.

## Inputs
When available:
- PBI / requirement;
- acceptance criteria;
- PR URL;
- branch;
- commits;
- `.diff`;
- changed files.

## NSTECH helper
A PR diff can be obtained by appending `.diff` to the Pull Request URL and saving the result as `[PR].diff` or `diff[PR].txt`.

## Analysis Flow

```text
PBI
↓
ACCEPTANCE CRITERIA
↓
PR
↓
COMMITS
↓
CHANGED FILES
↓
DIFF
↓
IMPLEMENTED RULE
↓
IMPACT
↓
RISK
↓
TEST
```

## Output
### Confirmed Intent
### Relevant Changes
### Business Rules Changed
### Technical Impact
### Functional Risks
### Regression Surface
### Missing / Conflicting Information
### Recommended Tests
### Questions for DEV/PO

## Classification
Use:
- CONFIRMED
- INFERRED
- MISSING
- CONFLICTING
- RISK

## Rules
- Do not invent requirement behavior.
- Do not perform generic developer review unless requested.
- Prefer QA impact analysis.
- Compare expected behavior versus actual implementation.
