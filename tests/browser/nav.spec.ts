import { test, expect } from '@playwright/test';

// @co-1, @co-4 — nav visible and functional on all viewports

test.describe('Navigation', () => {

  test.beforeEach(async ({ page }) => {
    await page.goto('/');
  });

  test('nav is visible and contains company name @co-1', async ({ page }) => {
    const nav = page.getByRole('navigation', { name: 'Main navigation' });
    await expect(nav).toBeVisible();
    await expect(nav).toContainText('GOD OBJECT');
  });

  test('desktop nav links are visible @co-1', async ({ page, viewport }) => {
    if ((viewport?.width ?? 0) >= 640) {
      await expect(page.getByRole('link', { name: 'Work' })).toBeVisible();
      await expect(page.getByRole('link', { name: 'Emello' })).toBeVisible();
      await expect(page.getByRole('link', { name: 'Contact' })).toBeVisible();
    }
  });

  test('mobile hamburger opens menu @co-4', async ({ page, viewport }) => {
    if ((viewport?.width ?? 1280) < 640) {
      const toggle = page.getByRole('button', { name: /open navigation/i });
      await expect(toggle).toBeVisible();
      await toggle.click();
      await expect(page.getByRole('link', { name: 'Work' })).toBeVisible();
    }
  });

  test('nav stays fixed while scrolling @co-4', async ({ page }) => {
    await page.evaluate(() => window.scrollTo(0, 600));
    const nav = page.getByRole('navigation', { name: 'Main navigation' });
    await expect(nav).toBeVisible();
    const box = await nav.boundingBox();
    expect(box!.y).toBe(0);
  });

});
