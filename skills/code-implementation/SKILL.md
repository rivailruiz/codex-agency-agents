---
name: code-implementation
description: Use this skill to drive implementation in small increments with execution evidence, contract stability, and controlled regression risk.
---

# Code Implementation

## When to use

- starting technical implementation
- performing refactors with regression risk
- delivering bug fixes that require strict validation

## Minimum inputs

- task with acceptance criteria
- relevant technical contracts (API, schema, interface)
- current code context

## Procedure

1. define the smallest functional increment
2. implement while preserving contract compatibility
3. add/update relevant tests
4. execute tests and record commands
5. produce handoff with changed files and risks

## Delivery checklist

- [ ] acceptance criteria met
- [ ] tests updated
- [ ] no known contract break
- [ ] execution evidence recorded

## Rules

- do not mix unrelated improvements
- prefer small, reviewable changes
