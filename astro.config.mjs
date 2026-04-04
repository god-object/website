// @co-4, @co-5 — minimal config: no JS shipped by default (Astro static output)
import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';

export default defineConfig({
  integrations: [tailwind()],
  output: 'static',
});
