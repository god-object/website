# Phase 5: Ambiguity Handling

> Satisfies: @ambiguity-1, @ambiguity-2, @ambiguity-3

## When to raise a proposal ADR

**Raise a proposal ADR when the decision:**
- Creates an architecture fork (database, auth strategy, major dependency)
- Changes or narrows the scope of a BDD scenario
- Has consequences the user would care about discovering later
- Is one where two reasonable engineers would choose differently

**Decide autonomously and document inline when:**
- It is an implementation detail with no user-visible effect
- There is one clearly correct answer given existing constraints
- It can be reversed cheaply with no downstream impact

When in doubt, escalate.

## Writing a proposal ADR mid-task

```bash
scripts/new-adr "The decision to be made" --blocked <current-task-id>
```

The `--blocked` flag records which task is waiting so `scripts/bootstrap`
surfaces the link in future sessions.

Fill in Context, Options, and Consequences. Leave Status `Proposed` and
Decision blank. Present to the user and wait — do not continue implementation.

## After the user decides

1. Record the decision; update Status to `Accepted`
2. If the decision conflicts with existing work, read
   `prompts/07-conflict-resolution.md` before proceeding
3. Otherwise resume from `bd ready`

## Minor autonomous decisions

Document at the point of the decision:

```python
# Using UTC throughout — avoids timezone ambiguity in logs.
# No user-visible impact; reversible if needed.
```

Return to `prompts/04-iterative-development.md` after resolving.
