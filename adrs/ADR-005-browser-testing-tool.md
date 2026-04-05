# ADR-005: Browser testing tool

**Status:** Accepted

## Decision
Use Playwright for browser-based UI tests.

## Context
Shell script structural validators can verify file content and config but
cannot catch rendering failures, layout bugs, or interactive behaviour.
Several rendering issues (hero height, mobile layout) were caught by the
client rather than by tests. A browser testing tool is needed to close this
gap before deployment. The client specified Playwright or Selenium.

## Options considered

### Option A: Playwright
Microsoft-maintained, first-class TypeScript support, fast parallel test
execution, built-in mobile viewport emulation, and an Astro integration.
Installs browsers as dependencies — no external service required.

**Consequences:**
- Mobile viewport tests catch layout bugs before the client sees them
- TypeScript API is well-suited to an Astro/JS project
- Browser binaries add ~300MB to the dev dependency footprint
- Straightforward to run in Netlify CI via `npx playwright test`

### Option B: Selenium / WebDriver
Older, more verbose API. Requires a running browser driver (ChromeDriver,
GeckoDriver) separately. No built-in mobile emulation.

**Consequences:**
- Higher setup complexity than Playwright
- Slower test execution
- No advantage over Playwright for this project

## Rationale
Playwright is the right choice: it matches the project's TypeScript stack,
has first-class mobile viewport emulation (directly relevant to the issues
encountered), and is far simpler to set up and maintain than Selenium.
