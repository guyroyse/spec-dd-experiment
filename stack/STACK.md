# Technical Stack

This file contains the technologies, frameworks, and architectural decisions for this application. You and the coding agent will use this to determine how to build the application — languages, datastores, patterns, deployment targets, and conventions.

## Frontend

- **Svelte 5.x** — Component framework
  - Version: `^5.0.0` (latest stable)
  - Docs: https://svelte.dev/docs/svelte/overview

- **Vite 6.x** — Build tool and dev server
  - Version: `^6.0.0` (required by @sveltejs/vite-plugin-svelte@5.x)
  - Docs: https://vite.dev/guide/
  - Note: Vite 7.x is available but @sveltejs/vite-plugin-svelte@5.x requires Vite 6.x as a peer dependency

- **Vitest 3.x** — Testing framework
  - Version: `^3.0.0` (compatible with Vite 6.x)
  - Docs: https://vitest.dev/guide/
  - Note: Vitest 4.x requires Vite 7.x; use Vitest 3.x with Vite 6.x

- **TypeScript 5.9.x** — Language
  - Version: `^5.9.0` (latest stable)
  - Docs: https://www.typescriptlang.org/docs/

## Backend

- **Node.js 24.x LTS** — Runtime
  - Version: `24.x` (Active LTS "Krypton", supported until 2027)
  - Docs: https://nodejs.org/docs/latest-v24.x/api/
  - Alternative: Node.js 25.x (Current) if bleeding-edge features needed

- **Express 5.x** — HTTP server framework
  - Version: `^5.0.0` (latest stable)
  - Docs: https://expressjs.com/en/5x/api.html
  - Note: Express 5 is recently released; Express 4.x is also acceptable if compatibility is a concern

- **TypeScript 5.9.x** — Language
  - Version: `^5.9.0` (latest stable)
  - Docs: https://www.typescriptlang.org/docs/

- **Vitest 4.x** — Testing framework
  - Version: `^4.0.0` (latest stable)
  - Docs: https://vitest.dev/guide/

- **Node Redis 5.x** — Redis client for Node.js
  - Version: `^5.0.0` (latest stable, breaking changes from v4)
  - Docs: https://github.com/redis/node-redis
  - Note: v5 has breaking changes from v4. See migration guide if upgrading from an older version.

## Database

- **Redis 8.x** — Primary database for all persistent data (users, todos, sessions). Use JSON and search where possible.
  - Version: `8.6` or `8-alpine` (latest stable)
  - Docs: https://redis.io/docs/latest/
  - Note: Use official `redis:8-alpine` image which includes JSON, search, probabilistic data structures, and timeseries. Do not use Redis Stack as that has been deprecated. Expose Redis on port 6379.

## Authentication

- **Session-based** — Sessions stored in Redis, session ID sent via HTTP-only cookie.

- **bcrypt 6.x** — Password hashing algorithm
  - Version: `^6.0.0` (latest stable)
  - Docs: https://www.npmjs.com/package/bcrypt

## Deployment

**Docker** — Dockerfiles for frontend and backend services that install dependencies using `npm install`, run the unit tests, build the application, and start it in a container. If any step fails, including the unit tests, the Docker build should fail.

**Docker Compose** — Single `docker-compose.yaml` to spin up all services together.

**Environment Variables** — Use environment variables for configuration. Create a .env file with values for local use that can be overridden in production.

**Frontend** — Nginx serving static build output, with reverse proxy to backend for `/api` routes.
  - Nginx Version: `1.28-alpine` (stable)
  - Docs: https://nginx.org/en/docs/
  - Exposed on port 8080

**Backend** — Express server for API routes. Exposed on port 3000.

**Redis** — See Database section above for version and configuration.
