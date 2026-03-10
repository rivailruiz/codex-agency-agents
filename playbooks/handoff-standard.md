# Standard Agent Handoff

Use this format for any work transfer between agents.

## Template

```markdown
# Handoff

## Metadata
- From:
- To:
- Date:
- Task/Issue:
- Priority:

## Objective
- Expected result:
- Acceptance criteria:

## Technical Context
- Summary of work completed:
- Changed files:
- Relevant technical decisions:

## Evidence
- Commands executed:
- Tests executed:
- Test results:

## Risks and Pending Items
- Known risks:
- Pending items:
- Suggested mitigations:

## Next Step
- Expected action from next agent:
- Definition of done for this handoff:
```

## Handoff Quality Rules

- never transfer without explicit acceptance criteria
- never omit changed files
- avoid generic statements like "tested" without evidence
- state clearly if there is any blocker
