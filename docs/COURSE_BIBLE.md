# Course Bible

This document defines the editorial, technical and teaching principles for **Mastering OpenTelemetry, ClickHouse & Grafana**. It is the primary reference for humans, Codex and any future contributor working on the course.

## Mission

Build a professional, production-oriented course that teaches observability engineering using OpenTelemetry, ClickHouse and Grafana.

The course must go beyond definitions. It should help learners understand how observability systems are designed, operated and used during real investigations.

## Vision

The course should feel like a high-quality technical book combined with a practical workshop. A learner should be able to use it for self-study, while an instructor should be able to use the same material to deliver a structured training session.

The final result should be good enough to support:

- internal enablement;
- customer workshops;
- advanced SRE training;
- future book-style publication;
- reusable labs and examples.

## Target Audience

The course is written for:

- Developers who need to instrument applications.
- SREs who need to investigate production systems.
- Platform engineers who operate observability pipelines.
- Architects who design telemetry platforms.
- Technical leads who need to define observability standards.

## Learning Philosophy

Teach engineering, not APIs.

Do not explain only what a component is. Explain why it exists, which problem it solves, how it behaves in production, when it should be used, when it should be avoided, and how it connects to the rest of the architecture.

Every major topic should follow this flow:

1. Problem
2. Context
3. Concept
4. Architecture
5. Example
6. Production implications
7. Best practices
8. Common mistakes
9. Summary

## Writing Philosophy

The documentation must read like a professional technical book, not like generated notes.

Avoid writing sections that look like this:

> OpenTelemetry is a vendor-neutral observability framework.

Prefer writing sections that create context:

> Before OpenTelemetry, many teams had to combine different instrumentation libraries for logs, metrics and traces. Tracing might use one standard, metrics another, and logs a custom format. This made observability fragile: changing backends often meant changing code. OpenTelemetry was created to break that coupling.

## Mandatory Module Structure

Each module must contain:

- `README.md`
- `module.md`
- `quiz.md`
- `references.md`
- `slides/README.md`
- `diagrams/`
- `images/`
- `examples/`
- `labs/`

Each `module.md` must include:

1. Overview
2. Learning Objectives
3. Prerequisites
4. Narrative introduction
5. Main sections
6. Production Example blocks
7. Architect Note blocks
8. Best Practice blocks
9. Common Mistake blocks
10. Hands-on Lab reference
11. Summary
12. Key Takeaways
13. Common Interview Questions
14. Official References
15. Next Module transition

## Required Teaching Blocks

### Production Example

Use a realistic scenario to explain why the concept matters.

Example:

> During a production investigation, an endpoint appeared to be slow because of database activity. Trace analysis showed that database spans represented less than 1% of the total request duration. The real delay came from waiting for an external automation controller.

### Architect Note

Explain design decisions and trade-offs.

Example:

> The Collector is optional, but production architectures usually benefit from it because it decouples applications from storage and routing decisions.

### Best Practice

Give concrete guidance.

Example:

> Define `service.name`, deployment environment and service namespace consistently before creating custom spans.

### Common Mistake

Describe a frequent failure mode.

Example:

> Many teams believe that more logs automatically improve observability. In reality, low-quality logs increase storage costs and make investigations harder.

### Did You Know?

Use sparingly for useful context or memorable facts.

### Common Interview Questions

Include questions that test understanding, not memorization.

## Image Strategy

Images should support the story, not decorate the page.

Use images for:

- module hero visuals;
- conceptual overviews;
- visual metaphors;
- training-friendly explanation anchors.

Do not overuse images. Most modules should have 2 to 4 strong visuals.

Technical architecture should usually be represented with editable diagrams, not static-only images.

## Diagram Strategy

Preferred diagram sources:

1. Mermaid for simple editable diagrams.
2. Draw.io for more complex editable diagrams.
3. PowerPoint for presentation diagrams.
4. SVG/PNG exports for documentation rendering.

Every important architecture diagram should have an editable source.

## Slide Strategy

Slides are not the documentation.

A good slide has:

- one idea;
- one visual anchor;
- minimal text;
- speaker notes or delivery guidance;
- no more than 5 bullets.

The detailed explanation belongs in `module.md`.

## Lab Strategy

Labs must be realistic and runnable when possible.

Each lab should include:

- objective;
- prerequisites;
- architecture overview;
- step-by-step instructions;
- expected result;
- troubleshooting section;
- cleanup instructions where relevant;
- optional extensions.

Labs should start simple and evolve across modules.

## References Policy

Use official references whenever possible:

- OpenTelemetry documentation
- OpenTelemetry specification
- CNCF documentation
- Grafana documentation
- ClickHouse documentation
- Prometheus documentation
- Kubernetes documentation
- W3C Trace Context
- Microsoft, Java, Python or Node official instrumentation docs where relevant

Avoid random blog posts unless explicitly justified.

## Definition of Done

A module is ready for first review when:

- It follows the required structure.
- It has a coherent narrative.
- It includes at least one Production Example.
- It includes Architect Notes, Best Practices and Common Mistakes.
- It has a slide outline.
- It has at least one lab or exercise.
- It has official references.
- It has diagrams or image guidance.
- It can support a 1-hour training session.

A module is ready for release only after:

- editorial review;
- technical review;
- lab validation;
- reference validation;
- diagram review;
- slide review.

## What Not To Do

Do not:

- copy official documentation;
- produce shallow definitions;
- create long bullet-only sections;
- add pages without improving understanding;
- overstate progress;
- mark modules as complete before review;
- create decorative diagrams with no instructional value;
- ignore production trade-offs.

## Core Principle

Do not teach technology as a list of features. Teach observability as an engineering practice.
