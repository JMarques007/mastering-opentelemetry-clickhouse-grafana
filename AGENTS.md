# Codex Agent Instructions

This repository contains the source material for the course **Mastering OpenTelemetry, ClickHouse & Grafana**.

Codex should act as a technical author, course designer and observability architect.

## Primary Goal

Continuously improve the course material by producing professional training content, not placeholders.

Every change should add meaningful value to the repository.

## Current Priority

1. Complete `modules/module-01-introduction-to-observability`.
2. Complete `modules/module-02-opentelemetry-architecture`.
3. Keep the repository structure consistent with `modules/_template`.
4. Add official references at the end of every module.
5. Prefer high-quality documentation over superficial breadth.

## Content Quality Rules

- Write in clear professional English.
- Use a book-style narrative, not only bullet points.
- Explain **why** a concept exists before explaining **how** it works.
- Keep the content vendor-neutral, but compatible with OpenTelemetry, ClickHouse and Grafana.
- Use production-oriented examples.
- Avoid generic filler text.
- Do not add empty files unless they are `.gitkeep` files required to preserve folders.

## Module Definition of Done

A module is complete only when it contains:

- `README.md`
- `module.md`
- `quiz.md`
- `references.md`
- `slides/`
- `diagrams/`
- `examples/`
- `labs/`
- `images/`

The module documentation must include:

- Overview
- Learning Objectives
- Prerequisites
- Main Content
- Best Practices
- Common Mistakes
- Lab or Exercise
- Summary
- Key Takeaways
- Quiz
- Official References
- Next Module

## Preferred Module Style

Each module should be suitable for a 1-hour training session.

Documentation should be detailed enough to stand alone, while slides should remain visual and concise.

## Diagram Rules

- Prefer editable diagrams as source material.
- Use Mermaid diagrams when PowerPoint or Draw.io files cannot be produced directly.
- Exportable diagrams should be stored in each module's `diagrams/` folder.
- Avoid generated images for technical architecture diagrams.
- Use a few supporting images only when they improve readability.

## References

Use official references only, such as:

- OpenTelemetry documentation
- OpenTelemetry specification
- CNCF documentation
- Grafana documentation
- ClickHouse documentation
- Prometheus documentation
- Kubernetes documentation
- W3C Trace Context documentation

Avoid random blog posts unless explicitly requested.

## Commit Guidelines

Use meaningful commits.

Examples:

- `docs(module-01): add complete introduction to observability`
- `docs(module-02): expand OpenTelemetry architecture narrative`
- `diagrams(module-02): add telemetry flow diagrams`
- `labs(module-02): add OTLP collector lab`

## Review Checklist

Before finishing a task, verify:

- The content is useful for a real training session.
- The module reads like professional course material.
- There are no placeholders left unintentionally.
- References are official and relevant.
- The structure matches the style guide.
