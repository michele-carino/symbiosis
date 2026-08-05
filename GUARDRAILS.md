# Symbiosis Operating Guardrails

> **MANDATORY SYSTEM DIRECTIVE FOR AI AGENTS**
> 
> You MUST execute the following deterministic algorithm sequentially upon every interaction with this repository.

---

## 1. Specification History Protocol (`specs/`)

All human intent must be recorded as an immutable, chronologically ordered Markdown specification file inside the `specs/` directory (e.g., `specs/YYYY/MM/YYYY-MM-DD-task-name.md`). 

* **Chronological Navigation:** You may read previously created specification files in `specs/` to understand historical design decisions, architectural evolutions, and past context.
* **No Spec, No Action:** You are strictly forbidden from writing code or executing changes based on conversational prompts alone. Every task must be anchored to a specification file in `specs/`.

---

## 2. Agent Skills & Justfile Protocol

The project `Justfile` serves as your **executable contract** and registry of capabilities (Skills) within this repository.

1. **Skill Discovery First:** Whenever you need to execute an operational command (e.g., building, testing, linting, running migrations, or scaffolding), you MUST first inspect the `Justfile` recipes (`just --list`) and use the existing Skill instead of executing raw terminal commands.
2. **No Raw Unscripted Commands:** You are STRICTLY FORBIDDEN from running complex, unscripted raw CLI commands (e.g., `npm test`, `cargo build`, `pytest`) if a corresponding abstraction should exist in the `Justfile`.
3. **Missing Skill Protocol:** If an operation is required to complete or verify a task but no corresponding recipe exists in the `Justfile`, you MUST NOT guess or invent raw commands. Instead, you MUST HALT, enter Mode: [ASK], and request the human developer to add the required recipe/skill to the `Justfile`.

   *Example Halt Response:*
   > "Guardrail Halt: I need to run database migrations to verify this spec, but no `just db-migrate` recipe exists in the `Justfile`. Please add the appropriate recipe to the `Justfile` so I can proceed."

---

## 3. Agent Execution Algorithm

```text
===============================================================================
                       SYMBIOSIS AGENT EXECUTION ALGORITHM
===============================================================================

STEP 0: INPUT & FILE CHECK
  Preconditions to accepting the request.

  IF root Justfile (or Makefile) is missing:
      HALT execution immediately.
      RESPOND: "Violation of Core Principles: A root `Justfile` with local build/run recipes (e.g., `just build`, `just test`) is required before development can proceed."
  IF user provided or pointed to a valid Markdown spec in specs/ (e.g., specs/YYYY/MM/YYYY-MM-DD-title.md):
      READ the target specification file.
      (OPTIONAL) READ previous specs in specs/ if historical context is required.
      GOTO STEP 1.
  ELSE:
      HALT execution immediately.
      RESPOND: "Please provide a Markdown specification file inside specs/ (e.g., specs/YYYY/MM/YYYY-MM-DD-task.md) using the template at specs/_template.md."

-------------------------------------------------------------------------------

STEP 1: INTENT CLASSIFICATION & SPECIFICATION AUDIT
  Read and evaluate the target Markdown specification file.

  CONDITION 1A: Ambiguity or Gaps Detected
      IF the specification contains unstated assumptions, vague requirements, or missing architectural details:
          ENTER Mode: [REFINE]
          DO NOT write or modify any codebase files.
          RESPOND: List specific, targeted questions to guide the human in updating the spec file.
          HALT until the updated spec file is provided.

  CONDITION 1B: Pure Analysis/Audit Requested
      IF intent is codebase analysis, investigation, or evaluation WITHOUT code modification:
          ENTER Mode: [ASK]
          DO NOT write or modify any codebase files.
          PROVIDE: Read-only diagnostics, architectural feedback, and probing questions.
          GOTO STEP 3.

  CONDITION 1C: Code Implementation Requested & Specification Is Unambiguous
      IF specification is complete, clear, and human-implementable with near-zero doubt:
          ENTER Mode: [EXECUTE]
          GOTO STEP 2.

-------------------------------------------------------------------------------

STEP 2: INCREMENTAL EXECUTION & VERIFICATION (ONLY IN [EXECUTE] MODE)
  Execute code changes under the following mandatory constraints:

  1. CHUNK LIMIT:
     Maximum 30–50 lines of code changed or generated per response/file. Break larger tasks into steps.

  2. RATIONALE STATEMENT:
     Precede all code changes with 1–2 sentences covering:
     - The exact problem being solved.
     - The architectural impact on the rest of the codebase.

  3. TRANSPARENCY:
     Present the simplest, most maintainable solution first. Do not add unrequested abstractions.

  4. LOCAL VERIFICATION VIA SKILLS:
     Execute `just test` (or the appropriate verification recipe in `Justfile`) to validate changes.
     IF a required recipe is missing, HALT per the Missing Skill Protocol.

  5. CHANGELOG COMPLIANCE (Keep a Changelog 1.1.0):
     Before concluding an execution step, ensure an entry describing the change is added 
     under `## [Unreleased]` in `CHANGELOG.md` using the standard subheadings 
     (`Added`, `Changed`, `Deprecated`, `Removed`, `Fixed`, `Security`) with a reference to the spec.

  GOTO STEP 3.

-------------------------------------------------------------------------------

STEP 3: HUMAN CHECKPOINT & FEEDBACK LOOP
  Formulate exactly ONE targeted closing question to verify conceptual alignment with the developer 
  (e.g., "I implemented X using pattern Y to avoid allocation Z: does this align with your design constraints?").
  
  HALT and wait for human confirmation before proceeding to the next step.
===============================================================================
