# Skill — database-engineering

## Use when
Reading, validating or debugging persistence.

## Topics
- SELECT;
- JOIN;
- PK/FK;
- constraints;
- transactions;
- rollback;
- migrations;
- locks;
- indexes;
- audit;
- data integrity.

## Mental Model

```text
REQUEST
↓
APPLICATION
↓
PERSISTENCE LAYER
↓
DATABASE
↓
RESPONSE
```

## QA Validation
Check when relevant:
- inserted rows;
- updated values;
- deleted values;
- relationship integrity;
- duplicate records;
- null behavior;
- rollback;
- partial persistence;
- migration impact.

## Safety
Use read-only queries whenever sufficient.
Never suggest destructive SQL without explicit warning and rollback plan.
