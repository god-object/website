# ADR-004: BDD scenario tag prefix registry

**Status:** Accepted

## Decision
Each `.feature` file is assigned a short prefix. All scenario tags in that
file use `@prefix-N` format. New prefixes must be registered here before use.

## Context
Scenario tags link backlog tasks, commits, and code comments to the BDD
spec that motivated them. A central registry prevents prefix collisions
across feature files.

## Tag prefix table

| Prefix | Feature file                        | Area                        |
|--------|-------------------------------------|-----------------------------|
| co     | 01-company-presentation.feature     | Company presentation        |
| cl     | 02-client-conversion.feature        | Client enquiry / contact    |
| em     | 03-emello-waitlist.feature          | Emello waitlist             |

## Options considered
N/A — this is a registry, not a decision between alternatives.

## Rationale
Centralising prefixes in a single ADR makes collisions immediately visible
at review time without needing to scan all feature files.
