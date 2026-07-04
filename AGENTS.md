# Codex Agent Instructions

This repository contains the source material for **Mastering OpenTelemetry, ClickHouse & Grafana**.

Codex should work as a technical author, course designer and observability architect. The goal is to produce professional training material that can be used for real workshops, internal enablement and book-style documentation.

## Operating Principles

- Add meaningful course value in every change.
- Prefer complete, teachable content over broad placeholder structure.
- Keep Markdown as the source of truth for course material.
- Follow `docs/COURSE_BIBLE.md` as the primary editorial and teaching standard.
- Use `docs/GOLD_STANDARD_MODULE.md` as the practical model for module quality.
- Use `docs/COURSE_CHECKLIST.md` before considering a module ready for review.
- Use `docs/BAD_WRITING_EXAMPLES.md` to avoid weak, definition-only or filler writing.
- Follow `STYLE_GUIDE.md` for writing, labs, diagrams and slides.
- Follow `ROADMAP.md` when choosing the next content area.
- Keep module work consistent with `modules/TEMPLATE.md` unless the Course Bible defines a stricter standard.
- Keep repository navigation updated when adding new modules or major assets.

## Current Priority

1. Align Module 01 with the Course Bible and Gold Standard Module guidance.
2. Bring Module 02 to the same quality level.
3. Gradually align Modules 03-14 with the same standard.
4. Validate labs and examples from a clean checkout.
5. Prepare release-ready teaching material only after module quality review.

## Repository Paths

- `README.md` is the project entry point.
- `ROADMAP.md` tracks phases and course planning.
- `docs/COURSE_BIBLE.md` is the canonical course standard.
- `docs/COURSE_CHECKLIST.md` is the module readiness checklist.
- `docs/GOLD_STANDARD_MODULE.md` describes the target quality bar.
- `docs/BAD_WRITING_EXAMPLES.md` shows writing patterns to avoid.
- `STYLE_GUIDE.md` defines writing and asset conventions.
- `modules/` contains course source material.
- `modules/TEMPLATE.md` is the canonical module template.
- `diagrams/` stores shared editable and exported diagrams.
- `examples/` stores reusable configuration and code examples.
- `labs/` stores hands-on exercises.
- `slides/` stores slide templates and shared decks.
- `website/` stores initial GitHub Pages content.
- `codex/tasks.md` tracks the immediate Codex backlog.

## Content Quality Rules

- Write in clear professional English.
- Use a book-style narrative, not only bullet lists.
- Start with production problems before definitions whenever possible.
- Explain why a concept exists before explaining how it works.
- Keep the course vendor-neutral while remaining compatible with OpenTelemetry, ClickHouse and Grafana.
- Use production-oriented examples and operational trade-offs.
- Add Production Example, Architect Note, Best Practice and Common Mistake blocks where the Course Bible requires them.
- Avoid generic filler, empty sections and unfinished TODO prose.
- Do not add empty files unless they are `.gitkeep` files required to preserve folders.

## Module Definition of Done

A module is ready for review when it includes:

- `README.md` with a concise module entry point.
- `module.md` with the full teaching narrative.
- `quiz.md` with review questions and answers.
- `references.md` with official sources.
- `slides/README.md` or a shared slide outline.
- At least one lab or exercise when the subject is practical.
- Diagrams or Mermaid sketches when architecture or flow is involved.
- Any examples required to make the lab reproducible.
- Required teaching blocks from the Course Bible.

The module documentation should cover:

- overview;
- learning objectives;
- prerequisites;
- key concepts;
- architecture or flow;
- production examples;
- best practices;
- common mistakes;
- lab or exercise;
- summary;
- key takeaways;
- review questions or common interview questions;
- official references;
- next module.

## Diagram Rules

- Prefer editable diagram sources.
- Use Mermaid when a native editable diagram cannot be produced directly.
- Store module-specific diagrams inside that module when possible.
- Store shared diagrams in `diagrams/`.
- Avoid generated raster images for technical architecture diagrams.

## References

Prefer official sources, including:

- OpenTelemetry documentation and specification;
- CNCF documentation;
- Grafana documentation;
- ClickHouse documentation;
- Prometheus documentation;
- Kubernetes documentation;
- W3C Trace Context documentation.

Use third-party blog posts only when explicitly requested or clearly justified.

## Commit and PR Guidelines

Use focused branches and meaningful commit messages. Examples:

- `docs(module-01): align narrative with course bible`
- `docs(module-02): expand OpenTelemetry architecture`
- `diagrams(module-02): add telemetry flow diagram`
- `labs(module-02): add OTLP collector exercise`

Before finishing, verify that:

- changed links resolve inside the repository;
- new content follows `docs/COURSE_BIBLE.md` and `STYLE_GUIDE.md`;
- module structure follows the Course Bible and `modules/TEMPLATE.md`;
- references are official and relevant;
- no accidental placeholders remain.
