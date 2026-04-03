# ADR-001: Tech stack — site framework and styling

**Status:** Accepted

## Decision
Use Astro as the site framework with Tailwind CSS for styling.

## Context
The God Object website is a marketing/company site: mostly static content,
a contact form, an email waitlist, and no authenticated users. It must load
fast, look distinctive, and be straightforward to maintain. No CMS is
required initially. The client has no framework preference and has deferred
the choice to the agent.

## Options considered

### Option A: Astro + Tailwind CSS
Astro is a static site framework that ships zero JavaScript by default,
adding interactivity only where needed ("component islands"). Tailwind CSS
provides utility-first styling with no runtime overhead. Both are
well-established, widely documented, and deploy as static files.

**Consequences:**
- Fast by default — no framework JS on the critical path
- Tailwind makes one-off dark-theme designs straightforward without bespoke CSS
- Excellent Lighthouse scores with minimal effort
- Slightly less React ecosystem familiarity, but no React is actually needed here

### Option B: Next.js + Tailwind CSS
Next.js is a React-based meta-framework with SSR, SSG, and API routes.
More powerful than needed for a static marketing site.

**Consequences:**
- Larger bundle than necessary for a mostly-static site
- API routes would handle form submissions natively
- Heavier dependency tree, slower cold starts on serverless
- Overkill for a site with no dynamic rendering requirements

## Rationale
Astro is the right tool for a fast, content-focused marketing site. The
performance characteristics align directly with VISION.md outcome: "the
overall impression is competence." A slow or bloated site undermines that.
Next.js adds complexity with no benefit given there are no dynamic rendering
requirements or authenticated routes.
