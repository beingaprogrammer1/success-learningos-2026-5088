FROM oven/bun:1.3.14 AS build
WORKDIR /app
COPY . .
RUN bun install --frozen-lockfile
ARG VITE_APPLICATION_ID=success-ovi7jfw
ARG VITE_RUNABLE_AUTH_ISSUER=https://api.runable.com/api/auth
ENV VITE_APPLICATION_ID=$VITE_APPLICATION_ID
ENV VITE_RUNABLE_AUTH_ISSUER=$VITE_RUNABLE_AUTH_ISSUER
RUN bun run build
ENV NODE_ENV=production
ENV PORT=3000
EXPOSE 3000
CMD ["bun", "packages/web/src/server.ts"]
