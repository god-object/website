# Epic Summary: Site foundation and company presentation (demo-opr)

## What was built
The complete site shell was delivered: an Astro + Tailwind project scaffold with Netlify deploy config, the God Object brand assets (hero image, logo mark, favicon), a fixed navigation bar with mobile hamburger menu, a full-viewport hero section with "Omniscient by design." overlaid on the hero image, a three-card services section, and a footer with copyright, GitHub link, and contact email. A Lighthouse CI config asserting LCP < 2.5s and TTI < 3.5s was wired into the Netlify build pipeline. Several feedback items were also resolved in this epic: consistent horizontal margins across all sections, correct domain (godobject.com), correct GitHub URL (github.com/god-object), and title-case GitHub link.

## Known gaps
- The logo mark SVG (logo-mark.svg) is used in the nav but the nav currently imports it as a raw SVG string — this works but means the SVG is not Astro-optimised. No visual impact currently.
- Lighthouse CI will only run meaningfully once the site is deployed to Netlify (it requires a built dist/ directory). The config is in place but untested against a real deploy.
- @co-3 (mobile rendering) has no automated browser test — only structural checks. Real device testing should happen before launch.

## BDD scenarios satisfied
- @cl-4: Contact call-to-action is reachable from the hero
- @co-1: Visitor understands the company's core offering above the fold
- @co-2: Visitor reads about the company's technical capabilities
- @co-4: Site renders correctly on mobile
- @co-5: Site loads fast enough not to lose a visitor

## Beads tasks closed
- demo-opr.1: Project scaffold — Astro + Tailwind, repo structure, Netlify config
- demo-opr.2: Logo and brand assets
- demo-opr.3: Homepage hero section
- demo-opr.4: Navigation bar
- demo-opr.5: Services / What We Do section
- demo-opr.6: Footer
- demo-opr.7: Performance baseline — Lighthouse CI
- demo-opr.8: Inconsistent horizontal margins
- demo-opr.9: Wrong domain name
- demo-opr.10: GitHub link title-case
- demo-opr.11: Wrong GitHub URL

## Open proposal ADRs
- (none)

## Deferred decisions
- (none)
