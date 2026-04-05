# Phase 3: Backlog Management

> Satisfies: @backlog-1, @backlog-2, @backlog-3, @backlog-4, @backlog-5

Run this phase after specs are approved and all mandatory ADRs are accepted.

## Creating epics and tasks

Map each `.feature` file to one Beads epic. Break each epic into tasks —
one per scenario or per coherent cluster of related scenarios. Every task
description must include a `Satisfies:` line with the scenario tags:

```bash
bd create "Epic name" --type epic --priority 1
bd create "Task title" --type task --priority 2 \
  --parent <epic-id> \
  --description "What this does. Satisfies: @prefix-1, @prefix-2"
```

## Setting dependencies

Wire epic and task dependencies explicitly:

```bash
bd dep add <later-epic-id> --depends-on <earlier-epic-id>
```

Use `bd graph` to verify the dependency graph is correct.

## Coverage check

After creating all tasks, run:

```bash
scripts/sync-check
```

Fix any gaps before proceeding. Every tagged scenario must have at least
one task referencing its tag.

## Backlog as roadmap

Run `bd list --type epic` and present the output when the user asks what
is planned. No separate roadmap document is created or maintained.

## Updating the backlog

**After an ADR decision:** create new tasks for derived work; close
superseded tasks; re-run `scripts/sync-check`.

**After epic demo feedback:** create tasks for each piece of feedback linked
to the relevant epic; update affected BDD scenarios; re-run `scripts/sync-check`.

Proceed to Phase 4: read `prompts/04-iterative-development.md`.
