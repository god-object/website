# Phase 2: Specifications and Architecture

> Satisfies: @spec-1, @spec-2, @spec-3, @spec-4, @spec-5

Run this phase after VISION.md is confirmed. Produce BDD specs, wireframes
(if applicable), and initial ADRs. Then pass them to the user for review
before creating the backlog.

## BDD specifications

Create `.feature` files in `specs/bdd/` using Gherkin:

```gherkin
Feature: <area of behaviour>
  As a <target user>
  I want <capability>
  So that <outcome>

  @prefix-1
  Scenario: <specific case>
    Given <precondition>
    When <action>
    Then <expected result>
    And <additional assertion>
```

**Rules:**
- Every scenario must trace to a VISION.md statement — if you cannot point
  to one, the scenario is out of scope
- Every scenario must have a `@prefix-n` tag immediately above it (ADR-004)
- Register new file prefixes in the ADR-004 tag prefix table
- Name files `NN-area-name.feature` with a two-digit prefix for ordering
- Use `Background` for shared preconditions, `Scenario Outline` + `Examples`
  for parameterised cases

## Wireframes

- **UI product:** ASCII or structured-text wireframes in `specs/wireframes/`,
  each referenced by at least one BDD scenario
- **Non-UI product** (CLI, library, API): skip wireframes entirely

If the presence of a UI is not clear from VISION.md, ask the user.

## Initial ADRs

Use `scripts/new-adr` to scaffold an ADR for any decision that would produce
different implementations if two engineers answered it differently.

Decisions that always require an ADR:
- Deployment target (mandatory — handled in Phase 8)
- Primary language/runtime (if not obvious from the product type)
- Database/persistence strategy (if the product stores data)
- Authentication approach (if the product has users)

Fill in Context, Options, and Consequences. Leave Status `Proposed` and
Decision blank until the user confirms.

## Spec review gate

After generating all specs and ADRs, **stop and present them to the user**:

> "I've written [N] feature files covering [areas] and [M] ADRs needing
> your decision. Please review before I create the Beads backlog."

Do not proceed to Phase 3 until:
- The user confirms the specs reflect their intent
- All mandatory ADRs are `Accepted`

Incorporate feedback by updating the .feature files. Re-present if changes
are significant.

Proceed to Phase 3: read `prompts/03-backlog-management.md`.
