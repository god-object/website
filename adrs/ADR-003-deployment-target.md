# ADR-003: Deployment target

**Status:** Accepted

## Decision
Deploy on Netlify. Use Netlify Forms for form handling (see ADR-002).

## Context
The site is a static build (per ADR-001: Astro). It needs a hosting platform
with a global CDN, automatic deploys from git, HTTPS by default, and a custom
domain. The client has no existing hosting preference. This decision interacts
with ADR-002: if Netlify is chosen, Netlify Forms becomes available as a
form backend without a separate service.

## Options considered

### Option A: Netlify
A static site hosting platform with a global CDN, automatic git-triggered
deploys, HTTPS, custom domains, and built-in form handling. Free tier covers
the site's needs indefinitely at current scale.

**Consequences:**
- Free tier: 100GB bandwidth/month, 300 build minutes/month — more than
  sufficient for a company marketing site
- Built-in Netlify Forms unlocks ADR-002 Option A (no extra service needed)
- Simple deploy config: `netlify.toml` with build command and publish dir
- Custom domain and HTTPS included at no cost

### Option B: Vercel
Similar to Netlify. Excellent Astro support. Global CDN, automatic deploys,
HTTPS, custom domains. No built-in form handling.

**Consequences:**
- Free tier is equally generous for a static site
- No form backend advantage over Netlify (requires external service either way)
- Marginally better Next.js integration — irrelevant given ADR-001 choice
- No meaningful differentiator from Netlify for this use case

## Rationale
Netlify is recommended: it is equivalent to Vercel for static Astro sites,
but the built-in form handling simplifies ADR-002 by eliminating a third-party
dependency. Both options are free at current scale. If Netlify is accepted
here, ADR-002 should default to Option A (Netlify Forms).
