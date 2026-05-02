import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

export default defineConfig({
  site: 'https://webpoker.info',
  integrations: [sitemap()],
  trailingSlash: 'never',
});
