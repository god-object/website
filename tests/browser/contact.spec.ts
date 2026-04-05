import { test, expect } from '@playwright/test';

// @cl-1, @cl-2, @cl-3 — contact form behaviour

test.describe('Contact form', () => {

  test.beforeEach(async ({ page }) => {
    await page.goto('/#contact');
  });

  test('contact form is visible @cl-1', async ({ page }) => {
    await expect(page.locator('#contact form')).toBeVisible();
  });

  test('submitting empty form shows validation errors @cl-2', async ({ page }) => {
    await page.getByRole('button', { name: /send/i }).click();
    await expect(page.locator('#name-error')).toBeVisible();
    await expect(page.locator('#email-error')).toBeVisible();
    await expect(page.locator('#message-error')).toBeVisible();
  });

  test('invalid email shows error @cl-3', async ({ page }) => {
    await page.fill('#contact-name', 'Test User');
    await page.fill('#contact-email', 'not-an-email');
    await page.fill('#contact-message', 'Hello');
    await page.getByRole('button', { name: /send/i }).click();
    await expect(page.locator('#email-error')).toBeVisible();
  });

  test('missing name shows only name error @cl-2', async ({ page }) => {
    await page.fill('#contact-email', 'test@example.com');
    await page.fill('#contact-message', 'Hello');
    await page.getByRole('button', { name: /send/i }).click();
    await expect(page.locator('#name-error')).toBeVisible();
    await expect(page.locator('#email-error')).not.toBeVisible();
  });

});
