# Deployment

This repo is ready to deploy on Railway from GitHub. Railway configuration is
defined in `.railway/railway.ts`.

## Railway

1. Create a new Railway project from `https://github.com/SujaltheBIGG/founder-finance.git`.
2. Add a PostgreSQL service to the same Railway project.
3. Generate a public domain for the web service and set its target port to
   `8080`.
4. Add these variables to the web service:

```bash
NODE_ENV=production
NEXT_PUBLIC_BASE_URL=https://${{RAILWAY_PUBLIC_DOMAIN}}
BETTER_AUTH_SECRET=<random 32+ character secret>
POSTGRES_URL=${{Postgres.DATABASE_URL}}
NEXT_PUBLIC_ALLOW_CREDENTIALS=true
NEXT_PUBLIC_DISABLE_SIGN_UP=false
```

If the Postgres service is named something other than `Postgres`, update the
`POSTGRES_URL` reference to match that service name.

The `.railway/railway.ts` config builds the `@kan/web` app, runs
`pnpm db:migrate` before each deployment, starts the Next.js server, and checks
`/api/v1/health` before promoting the release.

Optional features such as SMTP, OAuth, Redis, and S3 uploads can be enabled by
adding the matching variables from `.env.example`.

## Google Sign-In

To show the Google sign-in button, set these variables on the Railway `web`
service and in local `.env`:

```bash
GOOGLE_CLIENT_ID=<google-oauth-client-id>
GOOGLE_CLIENT_SECRET=<google-oauth-client-secret>
```

Use this Google OAuth redirect URI for the deployed app:

```text
https://founder-finance-production.up.railway.app/api/auth/callback/google
```
