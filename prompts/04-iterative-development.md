# Phase 4: Iterative Development

> Satisfies: @dev-1, @dev-2, @dev-3, @dev-4, @dev-5, @dev-6

Claim a task before starting: `bd update <task-id> --claim`

## TDD loop

Follow this sequence strictly for every task:

1. **Read** the BDD scenarios the task satisfies (from its `Satisfies:` tags)
2. **Write failing tests** — reference the scenario tag in a test comment
3. **Verify tests fail** before writing any implementation code
4. **Implement** the minimum code to make the tests pass
5. **Verify all tests pass** — run the full suite, not just the new tests
6. **Commit** using `scripts/commit-msg <task-id>` as a starting point

Do not write implementation code before step 3.
Do not commit a red test suite.

## What counts as a test

| Product type | Test form |
|---|---|
| Code (app, library, API) | Unit/integration tests — pytest, jest, go test, etc. |
| Agent / prompts / config | Structural validators — scripts asserting required sections, formats, tags |
| Shell scripts / tools | Behaviour tests — call with known inputs, assert output matches expected |
| IaC | terraform validate, plan assertions, schema checks |

Maintain a `tests/` directory with a single entrypoint (`tests/run`) that
runs all tests and produces a clear pass/fail result.

## Intent-preserving comments

Every non-trivial block of code must have a comment explaining *why* it
exists, referencing the scenario tag that motivated it:

```python
# Produces the session briefing replacing per-session artifact re-reads.
# Satisfies: @req-3 — "Resuming a session skips elicitation"
def bootstrap_session():
```

Run `scripts/lint-intent` before committing to verify comment density.

## Committing and closing

```bash
scripts/commit-msg <task-id>   # generate, review, adjust if needed
git commit -m "..."
bd close <task-id> --reason "implemented and tested"
```

## Pull requests

```
## What
<one sentence>

## Why
Implements <task-id>. Satisfies: @tag-1, @tag-2

## Test plan
- [ ] All existing tests pass
- [ ] New tests cover the BDD scenarios listed above
```

## Infrastructure as code

- Define infrastructure using an IaC tool — record the choice in an ADR
- Commit IaC alongside application code; test where tooling supports it
- Always flag credential requirements before proceeding

## When you hit ambiguity

Stop and read `prompts/05-ambiguity-handling.md`.

## When an epic is complete

Read `prompts/06-epic-demos.md`.
