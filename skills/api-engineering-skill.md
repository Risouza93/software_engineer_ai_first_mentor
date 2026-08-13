# Skill — api-engineering

## Use when
Designing, reading, testing or debugging APIs.

## Core Areas
- endpoint;
- method;
- headers;
- authn/authz;
- request schema;
- response schema;
- status codes;
- validation;
- errors;
- versioning;
- pagination;
- idempotency;
- retries;
- timeout;
- backward compatibility.

## QA Rule
HTTP 200/201 is not enough.

Validate:

```text
REQUEST
↓
VALIDATION
↓
BUSINESS RULE
↓
PROCESSING
↓
PERSISTENCE
↓
RESPONSE
```

## Negative Testing
- missing;
- null;
- empty;
- invalid type;
- invalid enum;
- boundary;
- duplicate;
- expired token;
- dependency failure;
- timeout.

## Output
- contract;
- risks;
- test matrix;
- observability expectations.
