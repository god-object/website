# Phase 8: Deployment and CI/CD

> Satisfies: @deploy-1, @deploy-2, @deploy-3, @deploy-4

## 1. Deployment target ADR (mandatory)

Before any infrastructure work:

```bash
scripts/new-adr "Deployment target"
```

Include 2-4 options appropriate to the product's type and scale. For each,
describe cost profile, operational burden, and CI/CD fit.

| Option | Best fit |
|---|---|
| Managed PaaS (Fly.io, Render, Railway) | Most web apps — low ops overhead |
| Serverless / edge (Vercel, CF Workers, Lambda) | Event-driven or frontend-heavy |
| Cloud provider + IaC (AWS/GCP/Azure) | High-control or compliance-sensitive |
| Self-hosted VPS | Maximum control, highest ops burden |

Present the ADR and wait for the user to decide before proceeding.

## 2. CI/CD as an early epic

Make CI/CD the first or second implementation epic. The pipeline must:
- Run the full test suite on every push
- Deploy automatically on a passing merge to main
- Be committed to the repository as code (not a dashboard setting)

Choose the tool that fits the deployment target (GitHub Actions, Fly deploy
actions, Vercel git integration, etc.).

## 3. Flag credentials before proceeding

Before any command requiring cloud credentials, stop and tell the user
explicitly what is needed. Do not assume credentials exist.

> "This step requires [specific credential/permission]. Please confirm it
> is available before I proceed."

## 4. Run book

When the deployment epic is complete, create `runbooks/<product-name>.md`
from `runbooks/TEMPLATE.md`. Fill in all three sections:
- **Run locally** — exact commands to get the project running on a fresh machine
- **Deploy** — how to trigger a deployment and verify it succeeded
- **Recover from failure** — most likely failure modes and how to resolve them

Update the run book whenever covered behaviour changes.

Return to `prompts/04-iterative-development.md` after the deployment epic.
