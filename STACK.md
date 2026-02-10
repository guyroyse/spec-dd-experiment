# Tech Stack

## Frontend

- **Svelte** — Component framework
- **Vite** — Build tool and dev server
- **TypeScript** — Language

## Backend

- **Express** — HTTP server framework
- **TypeScript** — Language
- **Node.js** — Runtime

## Database

- **Redis** — Primary database for all persistent data (users, todos, sessions)

## Authentication

- **Session-based** — Sessions stored in Redis, session ID sent via HTTP-only cookie

## Deployment

- **Docker** — Dockerfiles for frontend and backend services
- **Docker Compose** — Single `docker-compose.yaml` to spin up all services together
- **Redis** — Use official `redis` image (includes Redis JSON, Redis Search, etc.)
- **Frontend** — Nginx serving static build output, with reverse proxy to backend for `/api` routes
- **Configuration** — Environment variables for Redis connection, session secret, and ports
