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

- Store editable sources in `diagrams/`.
- Export images only when they are required by slides or documentation.
- Name diagrams with the module number and a short subject, for example `02-otel-architecture-flow`.

## Labs and Examples

- Labs must be reproducible from a clean checkout.
- Prefer small, focused examples over broad demo stacks.
- Include expected outcomes and cleanup steps.
- Keep secrets and local machine assumptions out of committed files.

## Slides

- Slides should be concise and visual.
- Put speaker context in notes or supporting module text.
- Reuse shared assets from `assets/` instead of copying images between modules.

## Status Labels

Use these labels in module indexes and planning notes:

| Status | Meaning |
|---|---|
| Draft available | Content exists and needs review. |
| In progress | Content is actively being written. |
| Planned | Scope is known but content has not started. |
| Needs review | Content is ready for technical and editorial feedback. |
| Complete | Content is reviewed and ready to teach. |
