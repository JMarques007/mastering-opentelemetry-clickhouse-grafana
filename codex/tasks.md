# Codex Task Backlog

This file defines the immediate execution backlog for Codex. Work from top to bottom unless a GitHub issue or user request says otherwise.

## Sprint 1 - Repository Foundation

- [x] Create professional `README.md`.
- [x] Create `ROADMAP.md`.
- [x] Create `STYLE_GUIDE.md`.
- [x] Create repository structure.
- [x] Create `modules/TEMPLATE.md`.
- [x] Prepare GitHub Pages structure in `website/`.
- [x] Add `AGENTS.md` with Codex-specific instructions.
- [x] Add `codex/tasks.md` with the immediate backlog.

## Sprint 2 - Module Readiness

- [x] Create module folders under `modules/` using the repository naming convention.
- [x] Add `README.md` as the entry point for every module.
- [x] Add `module.md` book-style narrative for every module.
- [x] Include exercises, quiz questions and official references inside every `module.md`.
- [x] Add initial overview SVG illustrations for all 14 modules.
- [x] Add richer editable SVG training image packs for Modules 02 through 14.

## Sprint 3 - Teaching Assets

- [x] Split exercises, quizzes and references into dedicated files where useful.
  - [x] Module 01 dedicated `exercise.md`, `quiz.md` and `references.md` files.
  - [x] Module 02 dedicated `lab.md`, `quiz.md` and `references.md` files.
  - [x] Modules 03-08 dedicated `exercise.md`, `quiz.md` and `references.md` files.
  - [x] Modules 09-14 dedicated `exercise.md`, `quiz.md` and `references.md` files.
- [x] Add a shared slide outline for Module 01.
- [x] Add a shared slide outline for Module 02.
- [x] Add shared diagram naming conventions to `STYLE_GUIDE.md` if needed.
- [x] Add instructor notes for timing, demos and discussion prompts.

## Sprint 4 - Reproducible Labs and Examples

- [x] Add a Collector to ClickHouse Docker Compose lab for Module 03.
- [x] Add a logs ingestion lab with structured OTLP log payloads.
- [x] Add a metrics lab with counter, gauge and histogram payloads.
- [x] Add a trace correlation lab that links trace ids to logs.
- [ ] Add ClickHouse SQL query examples for common observability investigations.
- [ ] Add Grafana dashboard starter JSON for checkout service health.
- [ ] Add alert rule examples for checkout error rate and latency.

## Working Rules

- Do not only create structure; each execution should add meaningful content.
- Keep each PR focused on one module or one repository maintenance concern.
- Prefer official references over third-party sources.
- Update this backlog when a task is completed or intentionally deferred.
