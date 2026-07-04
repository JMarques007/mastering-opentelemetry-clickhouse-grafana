# Codex Agent Instructions

This repository contains the source material for **Mastering OpenTelemetry, ClickHouse & Grafana**.

Codex should work as a technical author, course designer and observability architect. The goal is to produce professional training material that can be used for real workshops, internal enablement and book-style documentation.

## Operating Principles

- Add meaningful course value in every change.
- Prefer complete, teachable content over broad placeholder structure.
- Keep Markdown as the source of truth for course material.
- Follow `STYLE_GUIDE.md` for writing, labs, diagrams and slides.
- Follow `ROADMAP.md` when choosing the next content area.
- Keep module work consistent with `modules/TEMPLATE.md`.
- Keep repository navigation updated when adding new modules or major assets.

## Current Priority

1. Complete Module 01: Introduction to Observability.
2. Bring Module 02: OpenTelemetry Architecture to the same quality level.
3. Add official references to every module.
4. Add labs and examples that can be reproduced from a clean checkout.
5. Prepare concise slide outlines only after the module narrative is strong.

## Repository Paths

- `README.md` is the project entry point.
- `ROADMAP.md` tracks phases and course planning.
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
- Explain why a concept exists before explaining how it works.
- Keep the course vendor-neutral while remaining compatible with OpenTelemetry, ClickHouse and Grafana.
- Use production-oriented examples and operational trade-offs.
- Avoid generic filler, empty sections and unfinished TODO prose.
- Do not add empty files unless they are `.gitkeep` files required to preserve folders.

## Module Definition of Done

A module is ready for review when it includes:

- `README.md` with a concise module entry point.
- `module.md` with the full teaching narrative.
- `quiz.md` with review questions and answers.
- `references.md` with official sources.
- At least one lab or exercise when the subject is practical.
- Diagrams or Mermaid sketches when architecture or flow is involved.
- Any examples required to make the lab reproducible.

The module documentation should cover:

- overview;
- learning objectives;
- prerequisites;
- key concepts;
- architecture or flow;
- best practices;
- common mistakes;
- lab or exercise;
- summary;
- key takeaways;
- review questions;
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

- `docs(module-01): add observability introduction narrative`
- `docs(module-02): expand OpenTelemetry architecture`
- `diagrams(module-02): add telemetry flow diagram`
- `labs(module-02): add OTLP collector exercise`

Before finishing, verify that:

- changed links resolve inside the repository;
- new content follows `STYLE_GUIDE.md`;
- module structure follows `modules/TEMPLATE.md`;
- references are official and relevant;
- no accidental placeholders remain.
