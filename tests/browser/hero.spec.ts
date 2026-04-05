import { test, expect } from '@playwright/test';

// @co-1 — hero section visible and content present above the fold
// @co-4 — mobile layout correct
// @cl-4 — CTA scrolls to contact section

test.describe('Hero section', () => {

  test.beforeEach(async ({ page }) => {
    await page.goto('/');
  });

  test('headline is visible above the fold @co-1', async ({ page }) => {
    const heading = page.getByRole('heading', { name: /omniscient by design/i });
    await expect(heading).toBeVisible();
    // Must be within the viewport without scrolling
    const box = await heading.boundingBox();
    const viewportHeight = page.viewportSize()!.height;
    expect(box!.y + box!.height).toBeLessThan(viewportHeight);
  });

  test('hero image fills the section @co-1', async ({ page }) => {
    const img = page.locator('section[aria-label="Hero"] img');
    await expect(img).toBeVisible();
    const box = await img.boundingBox();
    const viewportWidth = page.viewportSize()!.width;
    // Image should span (nearly) the full viewport width
    expect(box!.width).toBeGreaterThan(viewportWidth * 0.95);
  });

  test('mobile hero height is roughly 65% of viewport @co-4', async ({ page }) => {
    // Only assert on mobile project — desktop uses min-h-screen
    const viewportHeight = page.viewportSize()!.height;
    const section = page.locator('section[aria-label="Hero"]');
    const box = await section.boundingBox();
    if (viewportWidth(page) < 640) {
      expect(box!.height).toBeLessThan(viewportHeight * 0.80);
    }
  });

  test('CTA button is visible and links to #contact @cl-4', async ({ page }) => {
    const cta = page.getByRole('link', { name: /get in touch/i });
    await expect(cta).toBeVisible();
    await expect(cta).toHaveAttribute('href', '#contact');
  });

  test('CTA scrolls to contact section @cl-4', async ({ page }) => {
    await page.getByRole('link', { name: /get in touch/i }).click();
    const contact = page.locator('#contact');
    await expect(contact).toBeInViewport();
  });

});

function viewportWidth(page: import('@playwright/test').Page): number {
  return page.viewportSize()?.width ?? 1280;
}
