# Technical Stack

This file contains the technologies, frameworks, and architectural decisions for this application. You and the coding agent will use this to determine how to build the application — languages, datastores, patterns, deployment targets, and conventions.

## Frontend

- **Svelte** — Component framework
- **Vite** — Build tool and dev server
- **TypeScript** — Language

## Backend

- **Express** — HTTP server framework
- **TypeScript** — Language
- **Node.js** — Runtime

## Database

- **Redis** — Primary database for all persistent data (users, todos, sessions). Use JSON and search where possible.

## Authentication

- **Session-based** — Sessions stored in Redis, session ID sent via HTTP-only cookie.
- **bcrypt** — Password hashing algorithm.

## Deployment

- **Docker** — Dockerfiles for frontend and backend services.
- **Docker Compose** — Single `docker-compose.yaml` to spin up all services together.
- **Environment Variables** — Use environment variables for configuration. Create a .env file with values for local use that can be overridden in production.
- **Frontend** — Nginx serving static build output, with reverse proxy to backend for `/api` routes. Exposed on port 8080.
- **Backend** — Express server for API routes. Exposed on port 3000.
- **Redis** — Use official `redis:latest` image which includes JSON, Search, etc. Do not use Redis Stack as that has been deprecated. Your training data is probably out of date with regard to Redis capabilities. Check online if you are confused. Expose Redis on port 6379.
