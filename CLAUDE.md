# Project Chimera Rules File

## Project Context

This is Project Chimera, an autonomous influencer system.  
The system is designed to orchestrate AI agents that fetch trends, generate content, store metadata, and analyse engagement.  
All development must align with the specifications defined in the `specs/` directory.

---

## The Prime Directive

**NEVER generate code without checking `specs/` first.**  
Every implementation must trace back to the specifications:

- `specs/_meta.md` → vision and constraints
- `specs/functional.md` → user stories
- `specs/technical.md` → API contracts and database schema
- `specs/openclaw_integration.md` → optional integration plan

---

## Traceability

Before writing any code:

1. **Explain the plan** in natural language.  
   - Which spec file(s) you are referencing.  
   - What functionality you intend to implement.  
   - How the code will satisfy the requirements.  
2. **Map the code to the spec**.  
   - Include comments in the code referencing the relevant spec section.  
   - Example: `# Ref: specs/technical.md - Trend Fetcher Agent API Contract`.

---

## Additional Guidelines

- **Consistency:** Follow the project’s coding standards and naming conventions.  
- **Transparency:** Document assumptions and decisions in commit messages.  
- **Validation:** Ensure all JSON contracts and database schemas match the definitions in `specs/technical.md`.  
- **Safety:** Respect constraints (GDPR compliance, API rate limits, ethical boundaries).  
- **Collaboration:** Treat this rules file as the “brain” of the IDE agent — update it if the specs evolve.

---

## Example Workflow

1. Read the relevant spec file.  
2. Write a short plan in comments or commit message.  
3. Generate code aligned with the plan.  
4. Cross‑check outputs against the spec.  
5. Document traceability in the code and commit.
