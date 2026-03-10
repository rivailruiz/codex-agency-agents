# Final Review Flow with Reviewer

## Objective

Define the mandatory final gate to approve or reject delivery before merge/release.

## Steps

1. `orchestrator` consolidates final handoff package.
2. `test-engineer` attaches evidence and PASS/FAIL result.
3. `reviewer` validates acceptance criteria, risk, and operational impact.
4. `reviewer` issues one decision:
   - `APPROVED`: ready for merge/release.
   - `CHANGES_REQUESTED`: return to owner with scoped corrections.
   - `BLOCKED`: release-preventing risk exists; requires technical/managerial decision.
5. `orchestrator` updates status and routes next cycle.

## Reviewer Checklist

- [ ] acceptance criteria are met
- [ ] relevant tests were executed
- [ ] no critical regression identified
- [ ] residual risks are documented
- [ ] rollback strategy is known (when applicable)

## Automatic Rejection Policy

Reject by default when any of the following is true:

- critical acceptance criterion failed
- missing test evidence
- unmitigated security risk
- operational impact without rollback plan

## Decision Format

```markdown
# Reviewer Decision

- Status: APPROVED | CHANGES_REQUESTED | BLOCKED
- Summary: <short objective paragraph>
- Blockers:
  - ...
- Required changes:
  - ...
- Next owner:
- Suggested due date:
```
