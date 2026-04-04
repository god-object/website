# Epic Summary: Client contact and conversion (demo-tra)

## What was built
A contact section with a three-field enquiry form (name, email, message) wired to Netlify Forms. Client-side validation catches missing required fields (@cl-2) and malformed email addresses (@cl-3). On successful submission the form is replaced by a confirmation message. A secondary column shows the contact email and expected response time. The hero CTA links smoothly to this section via the #contact anchor.

## Known gaps
- Netlify Forms email notification requires the Netlify site to be connected and a notification rule configured in the Netlify dashboard — this is not automated and must be done manually after deployment.
- No server-side spam protection beyond the Netlify honeypot field. Rate limiting is handled by Netlify's free tier limits.

## BDD scenarios satisfied
- @cl-1: Visitor submits a contact enquiry
- @cl-2: Visitor submits the form with missing required fields
- @cl-3: Visitor submits the form with an invalid email address
- @cl-4: Contact call-to-action is reachable from the hero

## Beads tasks closed
- demo-tra.1: Contact form — markup, validation, Netlify Forms integration
- demo-tra.2: Contact section layout and CTA link from hero
- demo-tra.3: Wrong email address in contact section

## Open proposal ADRs
- (none)

## Deferred decisions
- (none)
