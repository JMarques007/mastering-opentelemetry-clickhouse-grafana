# Module 03 Course Bible audit

Reviewer: Codex
Module: `modules/module-03-opentelemetry-collector`
Reviewed against:

- `docs/COURSE_BIBLE.md`
- `docs/COURSE_CHECKLIST.md`
- `docs/GOLD_STANDARD_MODULE.md`
- `docs/BAD_WRITING_EXAMPLES.md`

## Summary

Module 03 has a solid technical foundation. It correctly presents the OpenTelemetry Collector as the telemetry pipeline between applications and observability backends, and it already covers receivers, processors, exporters, pipelines, deployment patterns and operational risk.

The module is not yet Course Bible complete because `module.md` lacks the required self-contained teaching structure and labelled teaching blocks. The current content reads like a concise draft rather than a full book-style lesson. The dedicated exercise, quiz, references and lab are useful and should be preserved.

Recommended status: **Draft available, needs focused Course Bible alignment pass**.

## Strengths

- The opening frames the Collector as a production scaling and decoupling mechanism, not just a configuration tool.
- Core Collector terms are introduced accurately: receivers, processors, exporters and pipelines.
- Agent and gateway deployment patterns are already present with useful trade-offs.
- Production considerations mention dropped data, exporter queue size, retry behavior, memory usage and backend availability.
- Dedicated `exercise.md`, `quiz.md` and `references.md` files exist.
- The lab connects the Collector to ClickHouse with a runnable Docker Compose path.
- SVG visuals support concept, workflow, practice and operations views.

## Blocked issues

No severe blocker prevents review or upgrade. The module can proceed to a focused Course Bible upgrade without major restructuring of the surrounding assets.

## Needs work

| Area | Finding | Recommendation |
|---|---|---|
| Required module structure | `module.md` starts with `Course context` and does not include explicit Overview, Learning Objectives or Prerequisites sections. | Add the required front matter while preserving the existing production framing. |
| Required teaching blocks | Production Example, Architect Note, Best Practice and Common Mistake blocks are not labelled in Course Bible style. | Add explicit labelled blocks throughout the narrative. |
| Collector component depth | Receivers, processors, exporters and pipelines are correct but brief. | Expand each concept with practical examples and operational consequences. |
| Deployment patterns | Agent and gateway are present, but sidecar, direct export and hybrid patterns are not compared in enough detail. | Add a concise deployment model comparison with trade-offs. |
| Operational ownership | The module says the Collector must be monitored but does not define a clear health model. | Add a section on Collector self-observability, dropped telemetry, queue pressure and backpressure. |
| Common Interview Questions | Required section is missing from `module.md`. | Add reasoning-oriented questions near the end of the module. |
| References in narrative | `module.md` embeds official URLs even though a dedicated `references.md` exists. | Link to `references.md` from the module and keep the detailed reference list in the dedicated file. |
| Slide outline | README references training assets, but strict Course Bible structure expects `slides/README.md` where possible. | Record as follow-up unless the upgrade scope expands to slide assets. |

## Checklist assessment

| Category | Status | Notes |
|---|---|---|
| Problem-driven opening | Pass | The opening explains why direct application-to-backend telemetry does not scale. |
| Narrative flow | Needs work | The flow is logical but too compressed for a full teaching chapter. |
| Production examples | Needs work | Production concerns exist but need a labelled, concrete scenario. |
| Architect notes | Needs work | Architectural trade-offs exist in prose but are not isolated as teaching blocks. |
| Best practices | Needs work | Guidance exists but should be explicit and justified. |
| Common mistakes | Needs work | A short section exists but should include mistake/remediation framing. |
| Quiz | Pass | Dedicated quiz file includes questions and answers. |
| References | Pass | Dedicated references file uses official sources. |
| Visuals | Pass | Concept map, workflow, lab practice and operations view SVGs are linked. |
| Lab/exercise | Pass | Both module exercise and shared Collector-to-ClickHouse lab exist. |
| Interview questions | Needs work | Required section missing from `module.md`. |
| Slide outline | Needs work | Module-specific `slides/README.md` is not present. |

## Recommended upgrade plan

1. Add explicit Overview, Learning Objectives and Prerequisites sections.
2. Expand the Collector narrative into a book-style teaching chapter.
3. Add labelled Production Example, Architect Note, Best Practice and Common Mistake blocks.
4. Expand the building blocks section with operational examples for receivers, processors, exporters and pipelines.
5. Add a deployment model comparison covering direct export, agent, gateway, sidecar and hybrid topologies.
6. Add a Collector self-observability section with concrete health signals and failure modes.
7. Link the existing exercise, lab, quiz and references from a Hands-on Practice section.
8. Add Key Takeaways, Common Interview Questions and Next Module transition.

## Review decision

Proceed with a focused Module 03 upgrade PR. Preserve the existing lab and exercise assets, and concentrate the upgrade on `module.md` plus the Sprint 7 backlog state.
