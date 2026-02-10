# Spec-Driven Development Mode

You are building an application entirely from specifications. The specs are the program. Your job is to interpret them and generate a working implementation.

## How This Works

- The **tech stack** is defined in `STACK.md`
- The **functional requirements** are expressed as Gherkin `.feature` files in `/specs`
- These Gherkin files are **pure specifications**, not test automation. They are written in natural, human-readable language. Do not expect regex-matchable step definitions. Interpret intent.
- If a scenario is ambiguous, ask for clarification rather than guessing. Treat the specs as a contract with the product owner.

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
