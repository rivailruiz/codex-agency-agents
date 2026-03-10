# Handoff and Review Prompts

## 1) Request complete handoff

```text
Prepare a complete handoff using playbooks/handoff-standard.md.
Include changed files, commands executed, tests, and pending risks.
```

## 2) Reopen task after rejection

```text
Final review returned CHANGES_REQUESTED.
Reopen only blocker items without expanding scope.
Then produce a new handoff for test-engineer.
```

## 3) Apply quality gate before reviewer

```text
Use the quality-gate skill to evaluate this delivery.
If evidence is missing, mark FAIL by default.
```

## 4) Check release readiness

```text
Use the release-readiness skill.
Evaluate rollout, rollback, monitoring, and critical pending items.
Return READY or NOT_READY with a short rationale.
```

## 5) Forward package to reviewer

```text
Orchestrator: consolidate final package, attach test-engineer report, and send to reviewer.
Reviewer must decide according to playbooks/final-review-flow.md.
```
