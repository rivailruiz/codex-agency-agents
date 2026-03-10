# Codex Delivery Agents

This repository defines a multi-agent system focused on real software delivery in Codex.

## Goal

Ship production-ready software with an explicit flow:

1. scope understanding
2. task decomposition
3. implementation
4. technical and functional validation
5. independent final review

## Principles

- Prioritize execution over persona.
- Every task must have measurable acceptance criteria.
- Every handoff must include required minimum context.
- No delivery is complete without final reviewer approval.

## Structure

- `agents/`: core and specialist agent profiles.
- `agents/specialists/`: extended specialist catalog by division.
- `skills/`: reusable skills (`SKILL.md`).
- `playbooks/`: handoff protocol and final review flow.
- `examples/prompts/`: ready-to-run activation prompts.

## Core Agents (8)

- `orchestrator`: coordinates end-to-end execution flow.
- `product-planner`: turns product goals into executable backlog.
- `solution-architect`: defines architecture and technical decisions.
- `backend-engineer`: implements APIs, business logic, and persistence.
- `frontend-engineer`: implements UI, state handling, and API integration.
- `test-engineer`: validates functionality, regressions, and quality evidence.
- `devops-engineer`: handles pipeline, deployment, and observability.
- `reviewer`: final quality gate before merge/release.

## Extended Specialist Catalog (68)

- Location: `agents/specialists/`
- Divisions: `design`, `engineering`, `marketing`, `product`, `project-management`, `support`, `testing`, `spatial-computing`, `specialized`
- Index: `agents/specialists/README.md`
- Usage rule: activate specialists on demand for domain depth, while `orchestrator` remains the central coordinator.

## Operating Mode

1. Activate `orchestrator` with initial project context.
2. `orchestrator` routes planning to `product-planner` and `solution-architect`.
3. Implementation runs in parallel across `backend-engineer`, `frontend-engineer`, and `devops-engineer` when appropriate.
4. `test-engineer` validates acceptance and raises failures when needed.
5. `reviewer` performs final independent gate.
6. If rejected, work returns to the responsible owner through standard handoff.

## Handoff Contract

Every transfer between agents must follow `playbooks/handoff-standard.md` and include:

- task context and objective
- changed files
- acceptance criteria
- execution evidence
- risks and pending items
- next owner and expected action

## Mandatory Final Gate

No work is marked complete without passing `playbooks/final-review-flow.md`.
