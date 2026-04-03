# ADR-002: Form and waitlist backend

**Status:** Accepted

## Decision
Use Netlify Forms for both the client contact form and the Emello waitlist signup.

## Context
The site has two form submissions: a client contact enquiry and an Emello
waitlist signup. The site is otherwise static. We need a way to receive
form data without a custom server. Submissions must be stored (waitlist)
and trigger email notifications (contact enquiry). This decision is
independent of ADR-001 (framework) and ADR-003 (hosting).

## Options considered

### Option A: Netlify Forms (built-in, if hosted on Netlify)
Netlify intercepts HTML form submissions at the CDN edge. No extra service
or API key required. Submissions appear in the Netlify dashboard and can
trigger email notifications. Free tier allows 100 submissions/month.

**Consequences:**
- Zero additional services or dependencies
- Locked to Netlify hosting (couples this decision to ADR-003)
- 100 submissions/month free; paid plans needed beyond that
- No programmatic API for waitlist data export without Netlify's API

### Option B: Formspree
A dedicated form backend service. Works with any static host. Each form
gets an endpoint; submissions are emailed and stored in the dashboard.
Free tier: 50 submissions/month per form.

**Consequences:**
- Host-agnostic — no coupling to deployment platform
- Two separate forms (contact + waitlist) each consume free tier quota
- Programmatic export available via REST API
- Small additional service to manage

### Option C: Custom serverless function + database
Write a small API endpoint (e.g. Netlify/Vercel function) that stores
submissions in a database (e.g. Supabase free tier).

**Consequences:**
- Full control over data and logic (e.g. duplicate waitlist check from @em-4)
- Significantly more implementation work for an early-stage site
- Introduces a database dependency before any users exist
- Overkill until submission volume justifies it

## Rationale
Option B (Formspree) is recommended: it handles both forms independently,
is host-agnostic, and satisfies all scenarios (@cl-1, @em-2, @em-4) within
free tier limits for an early-stage site. The duplicate-email check (@em-4)
can be handled client-side initially and replaced with a serverless function
later if needed. Option A is acceptable if Netlify hosting is confirmed in
ADR-003. Option C is deferred until there is real submission volume.
