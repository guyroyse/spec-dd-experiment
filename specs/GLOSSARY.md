# Glossary of Domain Terms

This file contains domain terms and definitions used in the specs. You and the coding agent will reference this to understand the language of the application. Only include terms specific to this domain — not obvious words like "user" or "button."

## User

A person who has registered an account with the application. Users authenticate via username and password.

## Username

A unique identifier for a user. Usernames are case-insensitive — "Alice", "alice", and "ALICE" are considered the same username. The original casing entered during registration is preserved for display purposes.

## Todo

A task belonging to a user. Todos are private — a user can only see and manage their own todos. Each todo has:
- **Text** (required): The task description
- **Status**: Done or not done (toggleable)
- **Priority** (required): Low, Medium, or High — defaults to Medium
- **Due date** (optional): When the task should be completed

## Priority

The importance level of a todo. Can be Low, Medium, or High. Defaults to Medium when not specified.

## Session

A server-side record that tracks an authenticated user. The session ID is stored in an HTTP-only cookie and maps to session data in Redis.
