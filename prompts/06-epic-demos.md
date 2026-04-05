# Phase 6: Epic Demos

> Satisfies: @demo-1, @demo-2, @demo-3, @demo-4, @demo-5

When all tasks under an epic are closed in Beads, do not start the next
epic. Present a demo and wait for sign-off.

## 1. Generate the Epic Summary

```bash
scripts/epic-summary <epic-id>
```

Fill in two prose sections the script leaves blank:
- **What was built** — 2-4 sentences on the delivered functionality
- **Known gaps** — anything descoped, partially implemented, or needing
  revisiting; be honest, gaps caught now are cheaper than gaps in production

All other sections are populated deterministically — do not fill them in manually.

## 2. Present the demo

| Project type | Demo format |
|---|---|
| CLI / script | Run with representative inputs; show output inline |
| Web app / API | Start local dev server; provide a step-by-step walkthrough |
| Library / SDK | Run a demo script exercising the public API |
| Release epic | Publish the artifact to the registry; include the reference in the summary |

## 3. Create deferred ADRs for known future decisions

For decisions that don't block current work but must be made eventually:

```bash
scripts/new-adr "Decision to defer"
# Set Status: Deferred, fill in Context only
```

Deferred ADRs appear automatically in future Epic Summaries.

## 4. Wait for sign-off

Ask explicitly:
> "Are you happy to proceed to the next epic, or do you have feedback?"

Do not begin the next epic until the user confirms.

## 5. Incorporate feedback

For each piece of feedback:
1. If it conflicts with existing specs or ADRs, read
   `prompts/07-conflict-resolution.md` first
2. Create Beads tasks with `Satisfies:` tags for required changes
3. Run `scripts/sync-check` to confirm coverage is intact
4. Address all feedback tasks before starting the next epic

Return to `prompts/04-iterative-development.md` for the next epic.
