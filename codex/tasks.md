# Codex Task Backlog

This file defines the immediate execution backlog for Codex. Work from top to bottom unless a GitHub issue or user request says otherwise.

Use `docs/SPRINT_ORGANIZATION.md` for sprint planning rules and `docs/USER_STORIES.md` for story definitions, personas and acceptance criteria.

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
- [x] Add ClickHouse SQL query examples for common observability investigations.
- [x] Add Grafana dashboard starter JSON for checkout service health.
- [x] Add alert rule examples for checkout error rate and latency.

## Sprint 5 - Workshop Readiness

- [x] Add final workshop delivery plan.
- [x] Add a lab index and execution order guide.
- [x] Add troubleshooting guide for local lab setup.
- [x] Add module quality review checklist.
- [x] Add release readiness checklist for teaching delivery.
- [x] Update README navigation for delivery assets.

## Sprint 6 - Course Bible Alignment

- [x] Promote Course Bible, Checklist, Gold Standard and Bad Writing docs in README and AGENTS.
- [x] Audit Module 01 against the Course Bible and Gold Standard Module.
- [x] Upgrade Module 01 to include required teaching blocks and interview questions.
- [x] Audit Module 02 against the Course Bible and Gold Standard Module.
- [x] Upgrade Module 02 to include required teaching blocks and interview questions.
- [x] Create a repeatable module alignment checklist for Modules 03-14.

## Sprint 7 - Signal Pipeline Module Alignment

Sprint goal: align Modules 03-06 with the Course Bible using the user stories in `docs/USER_STORIES.md`.

- [x] S7-01 Audit Module 03 against the Course Bible and Gold Standard Module.
- [x] S7-02 Upgrade Module 03 to Course Bible standard.
- [x] S7-03 Audit Module 04 against the Course Bible and Gold Standard Module.
- [x] S7-04 Upgrade Module 04 to Course Bible standard.
- [x] S7-05 Audit Module 05 against the Course Bible and Gold Standard Module.
- [x] S7-06 Upgrade Module 05 to Course Bible standard.
- [x] S7-07 Audit Module 06 against the Course Bible and Gold Standard Module.
- [x] S7-08 Upgrade Module 06 to Course Bible standard.

## Sprint 8 - Advanced Signal Flow Module Alignment

Sprint goal: align Modules 07-10 with the Course Bible, focusing on context propagation, instrumentation, ClickHouse and Grafana operational workflows.

- [x] S8-01 Upgrade Module 07 Context Propagation to Course Bible standard.
- [x] S8-02 Add Module 07 context propagation boundary lab.
- [x] S8-03 Add Module 07 editable propagation diagram and slide outline.
- [x] S8-04 Audit Module 08 against the Course Bible and Gold Standard Module.
- [x] S8-05 Upgrade Module 08 to Course Bible standard.
- [x] S8-06 Audit Module 09 against the Course Bible and Gold Standard Module.
- [x] S8-07 Upgrade Module 09 to Course Bible standard.
- [x] S8-08 Audit Module 10 against the Course Bible and Gold Standard Module.
- [x] S8-09 Upgrade Module 10 to Course Bible standard.

## Sprint 9 - Dashboard and Alerting Module Alignment

Sprint goal: align Modules 11-12 with the Course Bible, focusing on dashboard design and actionable alerting workflows.

- [x] S9-01 Audit Module 11 against the Course Bible and Gold Standard Module.
- [x] S9-02 Upgrade Module 11 to Course Bible standard.
- [x] S9-03 Audit Module 12 against the Course Bible and Gold Standard Module.
- [x] S9-04 Upgrade Module 12 to Course Bible standard.

## Sprint 10 - Best Practices and Case Study Alignment

Sprint goal: align Modules 13-14 with the Course Bible, focusing on production operating models, course-wide best practices and an end-to-end observability case study.

- [x] S10-01 Audit Module 13 against the Course Bible and Gold Standard Module.
- [x] S10-02 Upgrade Module 13 to Course Bible standard.
- [x] S10-03 Audit Module 14 against the Course Bible and Gold Standard Module.
- [x] S10-04 Upgrade Module 14 to Course Bible standard.

## Working Rules

- Do not only create structure; each execution should add meaningful content.
- Keep each PR focused on one module or one repository maintenance concern.
- Prefer official references over third-party sources.
- Update this backlog when a task is completed or intentionally deferred.