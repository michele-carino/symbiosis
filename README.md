# Symbiosis

> A human-first framework of guardrails designed to keep developers in total cognitive control of their codebase while leveraging AI.

---

## Manifesto & Vision

Artificial Intelligence in software engineering must act as a cognitive amplifier, not a replacement for human thought. **Symbiosis** was created to prevent "blind coding" and stop developers from becoming alienated from their own codebases.

Through explicit guardrails and operational empathy, Symbiosis transforms AI from an autonomous code generator into a **transparent co-pilot**, ensuring the model continuously engages with and defers to the human driving it.

---

## 1. Core Principles

* **Primary Cognitive Control:** The human is the *Navigator*; the AI is the *Driver*. No substantial change occurs without human understanding and approval.
* **Operational Empathy:** The AI respects human cognitive load by delivering small, readable iterations and avoiding monolithic overhauls.
* **Continuous Alignment:** Every development step relies on an active feedback loop to ensure a shared mental model of the codebase.

---

## 2. AI Directives & Guardrails

To ensure that AI assistants adhere to human-first collaboration, this repository enforces a deterministic execution algorithm.

* **Core Execution Rules:** All AI agents operating on this repository MUST follow the algorithm defined in [`GUARDRAILS.md`](./GUARDRAILS.md).
* **Entrypoint Directive:** Agents searching for `AGENTS.md` are automatically routed to [`GUARDRAILS.md`](./GUARDRAILS.md).
* **Chronological Specifications:** Every task must originate from an immutable Markdown spec file stored under `specs/` (e.g., `specs/2026/08/2026-08-05-task.md`).

For full details on mode switching (`[REFINE]`, `[ASK]`, `[EXECUTE]`), input constraints, and human checkpoint protocols, see [`GUARDRAILS.md`](./GUARDRAILS.md).

---

## 3. Repository Structure

```text
/symbiosis/
├── README.md            # Vision, manifesto, core principles, and license
├── GUARDRAILS.md        # Deterministic algorithm, execution workflow, and system directives
├── AGENTS.md            # Universal entrypoint redirecting agents to GUARDRAILS.md
├── LICENSE              # GNU General Public License v3.0 (GPLv3)
└── specs/               # Chronological history of human specifications
    ├── _template.md     # Base specification template
    └── YYYY/MM/         # Chronologically ordered spec files (e.g., YYYY-MM-DD-task.md)
