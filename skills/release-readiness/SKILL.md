---
name: release-readiness
description: Use this skill to check release readiness with focus on operational risk, rollback, observability, and critical pending items.
---

# Release Readiness

## When to use

- before merge to main branch
- before production deployment
- during high-impact hotfixes

## Minimum inputs

- delivery changelog
- test status
- deploy and rollback strategy

## Procedure

1. review known blockers
2. validate rollout and rollback plans
3. confirm baseline observability signals
4. review user impact and external dependencies
5. issue decision: READY or NOT_READY

## Checklist

- [ ] no open blocker
- [ ] rollback validated
- [ ] minimum monitoring defined
- [ ] incident ownership is clear

## Rules

- if rollback is not clear, classify as NOT_READY
- document pending items with action and owner
