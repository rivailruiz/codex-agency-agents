---
name: quality-gate
description: Use this skill to evaluate a delivery with objective PASS/FAIL criteria across acceptance, tests, risk, and evidence before final reviewer gate.
---

# Quality Gate

## When to use

- after implementation of one or more tasks
- before sending package to reviewer
- when deciding whether to loop back for fixes

## Minimum inputs

- acceptance criteria
- diff or changed files
- test results

## Procedure

1. validate acceptance criteria item by item
2. verify execution of relevant tests
3. assess regression and operational risk
4. classify issue severity
5. issue final result: PASS or FAIL

## Output format

- `Final result: PASS/FAIL`
- `Verified evidence`
- `Issues found`
- `Severity and impact`
- `Required actions`

## Rules

- without evidence, default status is FAIL
- blocker issues prevent progression to reviewer
