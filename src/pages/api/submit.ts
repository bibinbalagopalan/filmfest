// src/pages/api/submit.ts
import type { APIRoute } from 'astro';

export const prerender = false;

const GOOGLE_SCRIPT_URL =
  'https://script.google.com/macros/s/AKfycbzlpKoDdRHCr2z538jkI8yQdge-1uTZVIVXrV752BW91vUO4j5lzSDoghih5K7s41QN/exec';

export const POST: APIRoute = async ({ request }) => {
  try {
    const payload = await request.json();

    // Server-to-server request follows Google's 302 redirect automatically
    const googleResponse = await fetch(GOOGLE_SCRIPT_URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'text/plain;charset=utf-8',
      },
      body: JSON.stringify(payload),
      redirect: 'follow',
    });

    const result = await googleResponse.json();

    if (result && result.success) {
      return new Response(JSON.stringify(result), {
        status: 200,
        headers: { 'Content-Type': 'application/json' },
      });
    } else {
      return new Response(
        JSON.stringify({ error: result?.error || 'Failed to record in Google Sheet.' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }
  } catch (err: any) {
    return new Response(
      JSON.stringify({ error: err.message || 'Server forwarding error.' }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};