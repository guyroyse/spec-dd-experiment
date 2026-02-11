# Spec-Driven Development Mode

You are building an application entirely from specifications. The specs are the program. Your job is to interpret them and generate a working implementation.

## How This Works

- The **tech stack** is defined in `STACK.md`
- The **functional requirements** are expressed as Gherkin `.feature` files in `/specs`
- These Gherkin files are **pure specifications**, not test automation. They are written in natural, human-readable language. Do not expect regex-matchable step definitions. Interpret intent.
- If a scenario is ambiguous, ask for clarification rather than guessing. Treat the specs as a contract with the product owner.

## Schema Continuity

The application's data must survive recompilation. The `/src` directory can be deleted 
and regenerated at any time, but the database retains data from previous compilations. 
Generated code must always be compatible with existing data.

### SCHEMA.md

`SCHEMA.md` is a generated artifact that describes the physical data schema — key 
patterns, data shapes, field names, types, and relationships as they exist in the 
actual database or databases. It lives in the project root alongside `STACK.md`.

**First compilation (SCHEMA.md does not exist):**
- Design the physical schema based on `STACK.md` and the specs
- Generate `SCHEMA.md` capturing every decision: key patterns, field names, 
  types, defaults, relationships, and any conventions (e.g. naming, timestamp 
  formats, ID generation)
- Generate application code that implements this schema

**Subsequent compilations (SCHEMA.md exists):**
- Read `SCHEMA.md` before generating any code
- Treat it as a hard constraint — do not rename keys, change field types, 
  alter data shapes, or restructure relationships
- Generated code must read and write data in exactly the format described

**When specs require schema changes:**
- Do not silently modify `SCHEMA.md`
- Flag the conflict: explain what the spec requires and how it differs from 
  the current schema
- Propose the change and wait for approval
- Once approved, update `SCHEMA.md` and add an entry to the migration log

### migrations/

The `migrations/` directory contains a chronological log of schema changes. 
Each entry is a markdown file describing what changed, why, and what action 
is needed on existing data.

When a schema change is approved:
1. Create a new file: `migrations/NNN-description.md`
2. Document: what changed, which spec drove the change, and any data 
   migration steps needed (e.g. "rename field X to Y in all existing records")
3. Update `SCHEMA.md` to reflect the new state
4. Generate code compatible with the updated schema
5. If the migration requires a data transformation, generate a standalone 
   migration script in `migrations/scripts/` that can be run against the 
   live database

## Your Approach

1. **Read all specs first.** Understand the full scope before writing any code.
2. **Work feature by feature.** Implement one `.feature` file at a time.
3. **Respect the stack.** Use only the technologies and patterns defined in `STACK.md`. Do not introduce dependencies or architectural patterns not specified there. If a spec conflicts with the stack, ask for clarification.
4. **Infer sensible defaults.** The specs describe what the user experiences. You decide the internal implementation details — data models, file structure, component decomposition — using your best judgment within the stack constraints.
5. **Flag gaps.** If you encounter a scenario that implies behavior not covered by any spec, note it and suggest a new scenario rather than silently making a decision.
6. **No gold plating.** Implement what the specs say. Nothing more.
7. **Existing code.** The `/src` directory is compiled output. Overwrite, merge, or extend as needed — use whichever approach is most efficient.

## What the Specs Are Not

- They are not test scripts. Do not generate Cucumber step definitions or test runners from them.
- They are not pseudocode. They describe outcomes, not implementation steps.
- They do not need to be precise about UI layout, CSS, or visual design unless they explicitly say so. Use good defaults.

## Output

- All output should be in the `/src` directory. This is the implementation of the specs. All source code, configuration, unit tests, and any code artifacts you generate should be placed in this directory.

- Use your judgement and the technologies specified in the `STACK.md` to decide how to structure the contents of the `/src` directory.
