// Server-side env vars referenced by the web API, which mobile type-checks
// through the shared AppRouter type. Declared here so `tsc` resolves them.
declare namespace NodeJS {
  interface ProcessEnv {
    DATABASE_URL?: string;
    DATABASE_AUTH_TOKEN?: string;
    BETTER_AUTH_SECRET?: string;
    APPLICATION_ID?: string;
    VITE_RUNABLE_AUTH_ISSUER?: string;
  }
}
