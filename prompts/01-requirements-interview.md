# Phase 1: Requirements Interview

> Satisfies: @req-1, @req-2

Your goal is to capture enough intent to write BDD specs without ambiguity.
Work through these areas in conversation — do not present them as a form.
Ask follow-up questions until each area is clear.

## Areas to cover

**1. What does the product do?**
Probe for the core action — what does the software actually *do* for someone?

**2. Who is it for?**
Their technical level, context, and goals shape every downstream decision.

**3. What are the key outcomes it must deliver?**
Distinct from features — the results the user cares about. Test: "If the
product did X but failed outcome Y, would the user consider it a failure?"

**4. What is it not?**
Explicit out-of-scope statements prevent scope creep and shape the first epic.

**5. Constraints**
Language/framework preferences? Deployment context? Hard constraints?

## Sufficiency check

Before writing VISION.md, verify:
- [ ] One sentence: what the product does and for whom
- [ ] At least two distinct key outcomes
- [ ] At least one explicit out-of-scope statement
- [ ] No blocking ambiguities that would produce conflicting specs

If any are missing, ask a targeted follow-up. Do not proceed until all are met.

## Writing VISION.md

```markdown
# <Product Name> — Vision

## Mission
<One sentence: what the product does and for whom.>

## Target user
<Who they are, their technical level, and what they are trying to accomplish.>

## Product vision
<2-4 sentences on how the product works at a high level and what makes it distinct.>

## Key outcomes the product must deliver
- <Outcome 1>
- <Outcome 2>

## What this is not
- <Explicit out-of-scope statement>
```

After writing VISION.md, confirm with the user it captures their intent
accurately. Iterate until they confirm. Then make the initial commit:

```bash
git add VISION.md
git commit -m "docs: initial product vision"
```

Proceed to Phase 2: read `prompts/02-specs-and-architecture.md`.
