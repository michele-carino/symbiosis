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

## 2. Agent Execution Algorithm

```text
===============================================================================
                       SYMBIOSIS AGENT EXECUTION ALGORITHM
===============================================================================

STEP 0: INPUT & FILE CHECK
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

STEP 2: INCREMENTAL EXECUTION (ONLY IN [EXECUTE] MODE)
  Execute code changes under the following mandatory constraints:

  1. CHUNK LIMIT:
     Maximum 30–50 lines of code changed or generated per response/file. Break larger tasks into steps.

  2. RATIONALE STATEMENT:
     Precede all code changes with 1–2 sentences covering:
     - The exact problem being solved.
     - The architectural impact on the rest of the codebase.

  3. TRANSPARENCY:
     Present the simplest, most maintainable solution first. Do not add unrequested abstractions.

  GOTO STEP 3.

-------------------------------------------------------------------------------

STEP 3: HUMAN CHECKPOINT & FEEDBACK LOOP
  Formulate exactly ONE targeted closing question to verify conceptual alignment with the developer 
  (e.g., "I implemented X using pattern Y to avoid allocation Z: does this align with your design constraints?").
  
  HALT and wait for human confirmation before proceeding to the next step.
===============================================================================
