// @ts-check
import { defineConfig } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';
import cloudflare from '@astrojs/cloudflare';

// https://astro.build/config
export default defineConfig({
  output: 'static', // Change this to 'server' or 'hybrid' if you use SSR
  adapter: cloudflare(),
  vite: {
    plugins: [tailwindcss()],
  },
});