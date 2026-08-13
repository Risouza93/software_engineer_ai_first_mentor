# Skill — debugging-systematic

## Use when
Something fails, behaves unexpectedly, does not start, returns an error, or differs between environments.

## Core Flow

```text
SYMPTOM
↓
REPRODUCTION
↓
LAYER
↓
EVIDENCE
↓
HYPOTHESIS
↓
HYPOTHESIS TEST
↓
CAUSE
↓
FIX
↓
REGRESSION
```

## Evidence First
Capture when applicable:
- timestamp;
- environment;
- client;
- request;
- response;
- logs;
- stack trace;
- branch;
- commit;
- version;
- DB state;
- container status.

## Mandatory distinction
- OBSERVED FACT
- TECHNICAL HYPOTHESIS

Never present a hypothesis as root cause until supported.

## Investigation layers
UI → Network → API → Logs → Service → Database → Infrastructure.

## Output
- symptom;
- confirmed evidence;
- hypotheses ordered by probability;
- next diagnostic action;
- conclusion;
- regression check.
