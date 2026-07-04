# Style Guide

This guide keeps the course material consistent across modules, labs, diagrams and slides.

## Voice and Audience

- Write for experienced engineers who need practical observability architecture guidance.
- Explain why a design exists before explaining how to configure it.
- Prefer clear technical language over vendor or marketing language.
- Use concrete examples and operational trade-offs whenever possible.

## Markdown Conventions

- Use sentence case for headings.
- Keep each module centered on one learning outcome.
- Use fenced code blocks with a language tag.
- Prefer tables for comparisons and checklists for procedures.
- Keep line length readable, but do not hard-wrap URLs.

## Module Structure

Every module should follow the shared module template and include:

- learning objectives;
- key concepts;
- diagrams or visual explanations where helpful;
- hands-on lab material when appropriate;
- review questions or discussion prompts;
- references and next steps.

## Diagrams

- Store editable sources in `diagrams/` when a diagram is shared across modules.
- Store module-specific exported SVGs in `modules/module-NN-topic/images/`.
- Prefer editable SVG or Mermaid for architecture, flow and concept diagrams.
- Avoid generated raster images for technical architecture unless the asset is intentionally illustrative rather than instructional.
- Keep diagram titles and subtitles clear of nodes, cards and connector lines.
- Use accessible SVG metadata where practical, including `<title>`, `<desc>` and `role="img"`.
- Name module-specific image files by purpose: `concept-map.svg`, `workflow.svg`, `lab-practice.svg` and `operations-view.svg`.
- Name shared diagrams with the module number and a short subject, for example `02-otel-architecture-flow.svg`.
- Use lowercase kebab-case for new diagram filenames.
- When a diagram is used in slides, reference the source path instead of copying the image into `slides/`.

## Labs and Examples

- Labs must be reproducible from a clean checkout.
- Prefer small, focused examples over broad demo stacks.
- Include expected outcomes and cleanup steps.
- Keep secrets and local machine assumptions out of committed files.

## Slides

- Slides should be concise and visual.
- Put speaker context in notes or supporting module text.
- Reuse shared assets from `assets/` instead of copying images between modules.
- Keep Markdown slide outlines in `slides/` until a final deck format is required.
- Name slide outlines as `module-NN-topic-outline.md`.

## Instructor Notes

- Put cross-module delivery guidance in `instructor-notes.md`.
- Put module-specific delivery guidance in the module exercise, lab or slide outline.
- Include timing, demo suggestions and discussion prompts where they help teaching.

## Status Labels

Use these labels in module indexes and planning notes:

| Status | Meaning |
|---|---|
| Draft available | Content exists and needs review. |
| In progress | Content is actively being written. |
| Planned | Scope is known but content has not started. |
| Needs review | Content is ready for technical and editorial feedback. |
| Complete | Content is reviewed and ready to teach. |
