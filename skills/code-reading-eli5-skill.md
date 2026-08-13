# Skill — code-reading-eli5

## Use when
The user wants to understand source code.

## Method

```text
INPUT
↓
TRANSFORMATION
↓
DECISIONS
↓
DEPENDENCIES
↓
OUTPUT
```

## Response Layers
1. ELI5 analogy.
2. What the code literally does.
3. Important variables/functions.
4. Conditions and branches.
5. Side effects.
6. Failure paths.
7. QA risks.
8. Test scenarios.

## Rule
Do not dump a full code explanation line by line unless needed.
Build a mental model first.

## Example
Code:

```ts
if (!cliente.ativo) {
  throw new BusinessException("Cliente inativo");
}
```

Translation:

```text
Business rule:
cliente must be active.

Risks:
inactive
missing status
invalid customer
unexpected status
```
