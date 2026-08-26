// src/content.config.ts
import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const news = defineCollection({
  loader: glob({ pattern: "**/*.md", base: "./src/content/news" }),
  schema: z.object({
    title: z.string(),
    publishDate: z.string(),
    summary: z.string(),
    tag: z.string().default("Update"),
    order: z.number().default(0),
  }),
});

export const collections = { news };