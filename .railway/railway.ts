import {
  defineRailway,
  github,
  preserve,
  project,
  service,
} from "railway/iac";

// Last resort for a per-service CaC repo. Prefer one .railway file for the
// project and drop this if you later combine services into that file.
export const partial = "web";

export default defineRailway(() => {
  const web = service("web", {
    source: github("SujaltheBIGG/founder-finance"),
    build: "pnpm --filter @kan/web build",
    start: "pnpm --filter @kan/web start",
    healthcheck: "/api/v1/health",
    healthcheckTimeout: 300,
    preDeploy: "pnpm db:migrate",
    env: {
      BETTER_AUTH_SECRET: preserve(),
      BETTER_AUTH_TRUSTED_ORIGINS: preserve(),
      GOOGLE_CLIENT_ID: preserve(),
      GOOGLE_CLIENT_SECRET: preserve(),
      NEXT_PUBLIC_ALLOW_CREDENTIALS: preserve(),
      NEXT_PUBLIC_BASE_URL: preserve(),
      NEXT_PUBLIC_DISABLE_EMAIL: preserve(),
      NEXT_PUBLIC_DISABLE_SIGN_UP: preserve(),
      NEXT_PUBLIC_MARKETING_URL: preserve(),
      NODE_ENV: preserve(),
      POSTGRES_URL: preserve(),
    },
    // builder from CaC: "RAILPACK"
    // watchPatterns from CaC: ["apps/web/**", "packages/**", "tooling/**", "package.json", "pnpm-lock.yaml", "pnpm-workspace.yaml", "turbo.json", "railway.json"]
  });
  return project("founder-finance", {
    resources: [web],
  });
});
