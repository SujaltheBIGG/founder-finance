<div align="center">
  <h1>Founder Finance</h1>
  <p>A consulting operations workspace — boards, cards and workflows for running client work.</p>
</div>

## Stack

| Layer | Choice |
| --- | --- |
| App | Next.js (pages router), React, TypeScript |
| API | tRPC |
| Data | PostgreSQL via Drizzle ORM |
| Auth | Better Auth (credentials, magic link, Google) |
| Monorepo | Turborepo + pnpm workspaces |
| Hosting | Railway |

```
apps/web        Next.js app and marketing landing page
packages/api    tRPC routers
packages/db     Drizzle schema and migrations
packages/auth   Better Auth configuration
```

## Local development

Requires Node 20.18+, pnpm 9, and a PostgreSQL instance.

```bash
pnpm install
cp .env.example .env     # fill in POSTGRES_URL and BETTER_AUTH_SECRET
pnpm db:migrate
pnpm dev:next
```

The app runs at `http://localhost:3006`. `/` serves the marketing landing page;
`/login` and `/signup` are the app entry points.

## Configuration

Required:

```bash
POSTGRES_URL=postgresql://user:password@localhost:5432/your_db
BETTER_AUTH_SECRET=<random 32+ character secret>
NEXT_PUBLIC_BASE_URL=http://localhost:3006
```

Optional: `GOOGLE_CLIENT_ID` / `GOOGLE_CLIENT_SECRET` for Google sign-in, SMTP
variables for email, S3 variables for uploads, and `NEXT_PUBLIC_MARKETING_URL`
to send users somewhere other than `/` after signing out. See `.env.example`
for the full list.

## Deployment

Deployed on Railway from `main`; pushes build and release automatically.
Configuration lives in `.railway/railway.ts`, and `DEPLOYMENT.md` covers the
service setup and required variables.

## Editing the landing page

The landing page served at `/` is `apps/web/public/marketing/index.html`, with
its images under `apps/web/public/marketing/images/`.

## License

Licensed under the GNU AGPL-3.0 — see [LICENSE](LICENSE).

Built on [Kan](https://github.com/kanbn/kan), an open source kanban project,
also AGPL-3.0.
