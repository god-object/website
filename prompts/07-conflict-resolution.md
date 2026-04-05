# Phase 7: Conflict Resolution and Ripple-back

Invoked when a decision (new ADR, demo feedback, or user change) conflicts
with existing work. Resolve at the highest affected level first, then
propagate downward.

## 1. Check for VISION.md conflict

If the change contradicts a statement in VISION.md, **stop immediately**
and ask the user to resolve it at that level:

> "This change conflicts with [statement] in VISION.md. How would you like
> to update the product vision before I proceed?"

Do not continue until VISION.md is updated and re-confirmed. All downstream
changes flow from the updated vision.

## 2. Resolve ADR conflicts

| Existing ADR status | Action |
|---|---|
| Proposed | Update the existing ADR to incorporate the new information |
| Accepted | Create a new ADR superseding the old one; mark old as `Status: Superseded by ADR-NNN` |
| Rejected | No action — rejection still stands |
| Deferred | Update the deferred ADR with the new context |

## 3. Update BDD specs

Update `.feature` files to reflect the resolved decision. Add, modify, or
remove scenarios as needed. Re-tag any new scenarios per ADR-004. Run
`scripts/sync-check` to verify coverage after changes.

## 4. Update the backlog

| Task status | Action |
|---|---|
| Not yet started | Close and replace with updated tasks |
| In progress | Update description; reconcile in-progress work in next step |
| Completed | Close with a note referencing the superseding ADR; create rework tasks |

For epics not yet started, update or replace as needed.

## 5. Update code

For any code referencing superseded issues or specs:
- Update comments to reference new scenario tags or ADR numbers
- Update logic if behaviour has changed
- Run `scripts/sync-check` and the full test suite before committing

Return to the phase you came from when resolution is complete.
