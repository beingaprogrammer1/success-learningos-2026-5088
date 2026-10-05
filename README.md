# SuccessOS 26 — web only

This repository contains **only `packages/web`**. No mobile, tablet or Electron desktop application is included. The website itself remains responsive on phones and tablets.

## Important: GitHub is not the application server

GitHub stores this source code. **GitHub Pages cannot run this full app**: login, progress, Success Gems and reports require the included Bun/Hono API and a Turso database. Use a Bun-capable server or container host connected to this repository. Uploading `dist` alone to Pages will not provide those features.

## Local setup

1. Install Bun (https://bun.sh).
2. Run `bun install`.
3. Copy `.env.example` to `.env`. Fill in your own database credentials, auth secret and public URL. Never commit `.env`.
4. Run `bun run db:push` to create the database tables.
5. Run `bun run dev` (port 4200).

## Production hosting

The included Dockerfile runs the web UI and API together. Import this GitHub repository into a Docker-capable host, or build it on your own server.

Set the variables listed in `.env.example` in your host's environment settings. The `VITE_` variables must also be available at **build time**. Supply `VITE_APPLICATION_ID` and `VITE_RUNABLE_AUTH_ISSUER` as Docker build arguments. `WEBSITE_URL` must be your actual HTTPS site URL. Keep the same `BETTER_AUTH_SECRET` between deployments.

- Build: `bun run build`
- Start from repo root: `bun --env-file=.env packages/web/src/server.ts` (without `--env-file` when your host injects variables)
- Listening port: `PORT` environment variable, default 3000
- Health check: `/api/health`
- Push schema before first launch: `bun run db:push`

Google sign-in uses Runable's managed broker; that external dependency remains. Verify it on your final domain. Email/password sign-in is also available.

## Content and notes

- Course links, lesson outlines, achievements and placeholder release notes: `packages/web/src/api/data/curriculum.ts`.
- Draft legal terms: `packages/web/src/api/routes/content.ts` — review before public use.
- Reports are stored in the database; an admin triage interface is not included.
- The Made with Runable badge has been removed. Analytics remain enabled.
