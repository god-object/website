import { test, expect } from '@playwright/test';

// @em-1, @em-2, @em-3, @em-4 — Emello section and waitlist behaviour

test.describe('Emello section', () => {

  test.beforeEach(async ({ page }) => {
    await page.goto('/#emello');
    // Clear localStorage so duplicate guard doesn't interfere between tests
    await page.evaluate(() => localStorage.removeItem('emello-waitlist-email'));
  });

  test('Emello value proposition is visible @em-1', async ({ page }) => {
    const section = page.locator('#emello');
    await expect(section).toContainText('Emello');
    await expect(section).toContainText(/own hardware|self.host/i);
    await expect(section).toContainText(/privac/i);
    await expect(section).toContainText(/waitlist|coming soon|notify/i);
  });

  test('invalid email shows validation error @em-3', async ({ page }) => {
    await page.fill('#waitlist-email', 'not-an-email');
    await page.locator('#emello-waitlist-form button[type="submit"]').click();
    await expect(page.locator('#waitlist-email-error')).toBeVisible();
  });

  test('duplicate submission shows already-on-list message @em-4', async ({ page }) => {
    // Seed localStorage as if already submitted
    await page.evaluate(() => localStorage.setItem('emello-waitlist-email', 'test@example.com'));
    await page.reload();
    await expect(page.locator('#waitlist-duplicate')).toBeVisible();
    await expect(page.locator('#emello-waitlist-form')).not.toBeVisible();
  });

});
