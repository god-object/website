// @co-4 — Tailwind content paths cover all Astro/component files
/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,ts,tsx}'],
  theme: {
    extend: {
      colors: {
        // God Object brand palette
        'go-black': '#0a0a0a',
        'go-white': '#f5f5f5',
        'go-accent': '#e8e8e8',
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
        mono: ['JetBrains Mono', 'Fira Code', 'monospace'],
      },
    },
  },
  plugins: [],
};
