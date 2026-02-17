# [App Name]

[Two or three sentences describing the app.]

## Methodology

This project uses spec-driven development. The specifications are the program. All code is generated from specs and can be deleted and regenerated at any time.

There are two modes of work on this project:

- **Authoring:** Defining and refining the specs, stack, and domain model
- **Compiling:** Generating application code from the specs

## Project Structure

- `/specs/` — Behavioral specifications in Gherkin
- `/specs/GLOSSARY.md` — Domain terminology
- `/stack/STACK.md` — Technology choices, versions, and deployment configuration
- `/schemas/` — Contains physical data schemas (generated during compilation, then locked)
- `/src/` — Generated output. Not source controlled. Can be deleted and regenerated.
