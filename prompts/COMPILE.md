# Spec-Driven Development Mode

You are building an application entirely from specifications. The specs are the program. Your job is to interpret them and generate a working implementation.

## Project Structure

### Input (Read These)

- `/specs/` — Gherkin specifications (`.feature` files). These are the functional requirements, written in natural, human-readable language. Can be organized into subfolders. Interpret intent — do not expect regex-matchable step definitions.
- `/specs/GLOSSARY.md` — Domain terms and definitions. Reference this to understand the language of the specs.
- `/stack/STACK.md` — Tech stack: languages, frameworks, patterns, and architectural decisions. Use only what's defined here.

### Generated (You Create/Update These)

- `/schemas/` — One file per datastore, named after the technology (e.g., `POSTGRES.md`, `REDIS.md`, `KAFKA.md`). Each describes the physical schema for that datastore.
- `/src/` — All generated code including unit tests, if applicable. This is disposable — it can be deleted and regenerated at any time.

### Others (Do Not Modify)

Under no circumstance are you to put generated content in any other folder while compiling. All code, config, and tests that you generate must be in `/src/` and all schema files must be in `/schemas/`.

## Reading the Specs

- Specs define the behavior of the application. If a scenario is ambiguous, ask for clarification rather than guessing.
- They are not test scripts. Do not generate Cucumber step definitions or test runners from them.
- They do not specify UI layout, CSS, or visual design unless explicitly stated. Use good defaults.

## Schema Continuity

The application's data must survive recompilation. The `/src/` directory can be deleted and regenerated, but datastores retain data from previous compilations. Generated code must always be compatible with existing data.

**First compilation (no schema files exist):**
- Design the physical schema for each datastore based on `/stack/STACK.md` and the specs
- Generate a schema file for each datastore, capturing every decision: key patterns, field names, types, defaults, relationships, and conventions (e.g., naming, timestamp formats, ID generation)
- Generate application code that implements these schemas

**Subsequent compilations (schema files exist):**
- Read all schema files before generating any code
- Treat them as hard constraints — do not rename keys, change field types, alter data shapes, or restructure relationships
- Generated code must read and write data in exactly the format described

**When specs require schema changes:**
- Do not silently modify schema files
- Flag the conflict: explain what the spec requires and how it differs from the current schema
- Propose the change and wait for approval
- Once approved, update the relevant schema file and generate compatible code

## Your Approach

1. **Read all specs first.** Understand the full scope before writing any code.
2. **Work feature by feature.** Implement one `.feature` file at a time.
3. **Respect the stack.** Use only the technologies and patterns defined in `/stack/STACK.md`. Do not introduce dependencies or architectural patterns not specified there. If a spec conflicts with the stack, ask for clarification.
4. **Infer sensible defaults.** The specs describe what the user experiences. You decide the internal implementation details — data models, file structure, component decomposition — using your best judgment within the stack constraints.
5. **Flag gaps.** If you encounter a scenario that implies behavior not covered by any spec, note it and suggest a new scenario rather than silently making a decision.
6. **No gold plating.** Implement what the specs say. Nothing more.
7. **Existing code.** The `/src/` directory is compiled output. Overwrite, merge, or extend as needed — use whichever approach is most efficient.

## Output

All generated code goes in `/src/`. This includes source code, configuration, unit tests, and any other code artifacts. Use your judgment and the technologies specified in `/stack/STACK.md` to decide how to structure the contents.
