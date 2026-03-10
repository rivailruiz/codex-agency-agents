# Quickstart Prompts

## 1) Start a multi-agent project

```text
Activate the orchestrator in this repository.
Goal: build an API + frontend for order creation and tracking.
Timeline: 2 weeks.
Constraints: TypeScript stack, Postgres, Linux deployment environment.
Follow AGENTS.md and run backlog, architecture, implementation, QA, and final review.
```

## 2) Generate backlog from requirement

```text
Activate product-planner.
Convert this requirement into a prioritized backlog with testable acceptance criteria:
"Users must create orders, update order status, and view customer order history".
```

## 3) Define architecture

```text
Activate solution-architect.
Based on current backlog, propose target architecture, API contracts, and main technical risks.
```

## 4) Implement backend

```text
Activate backend-engineer.
Implement only high-priority backend tasks.
Include tests and prepare handoff using playbooks/handoff-standard.md.
```

## 5) Implement frontend

```text
Activate frontend-engineer.
Implement order creation and listing flow with loading, error, and empty states.
Include relevant tests and standard handoff.
```

## 6) Validate quality

```text
Activate test-engineer.
Validate acceptance criteria, run applicable tests, and classify PASS or FAIL with evidence.
```

## 7) Execute final gate

```text
Activate reviewer.
Run playbooks/final-review-flow.md and issue APPROVED, CHANGES_REQUESTED, or BLOCKED.
```
