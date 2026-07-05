# Module 06 Course Bible audit

Reviewer: Codex
Module: `modules/module-06-traces`
Reviewed against:

- `docs/COURSE_BIBLE.md`
- `docs/COURSE_CHECKLIST.md`
- `docs/GOLD_STANDARD_MODULE.md`
- `docs/BAD_WRITING_EXAMPLES.md`

## Summary

Module 06 has a useful technical foundation. It explains distributed traces as request-level evidence, introduces spans, attributes, status, critical path, sampling and correlation with logs and metrics. The exercise and trace-log correlation lab are especially valuable because they teach investigation rather than only trace terminology.

The module is not yet Course Bible complete because `module.md` is still a concise draft. It lacks explicit Overview, Learning Objectives, Prerequisites, labelled teaching blocks and Common Interview Questions. The upgrade should expand the module into a production-oriented chapter on request journeys, latency breakdown, context propagation dependency and sampling trade-offs.

Recommended status: **Draft available, needs focused Course Bible alignment pass**.

## Strengths

- The opening explains why traces matter in distributed systems.
- Spans are described as operations with timing, status and attributes.
- The module already introduces critical path thinking.
- Sampling is presented as a cost and diagnostic-value trade-off.
- Correlation with logs and metrics is explained clearly.
- Dedicated `exercise.md`, `quiz.md` and `references.md` files exist.
- The lab connects traces and logs through a shared trace id in ClickHouse.

## Blocked issues

No severe blocker prevents review or upgrade. The module can proceed directly to a focused Course Bible upgrade.

## Needs work

| Area | Finding | Recommendation |
|---|---|---|
| Required module structure | `module.md` starts with Course context and does not include explicit Overview, Learning Objectives or Prerequisites. | Add required front matter while preserving the production investigation framing. |
| Required teaching blocks | Production Example, Architect Note, Best Practice and Common Mistake blocks are not labelled. | Add explicit Course Bible blocks. |
| Trace data model | Spans and attributes are introduced, but trace id, span id, parent-child relationships and root span should be explained more completely. | Add a trace anatomy section. |
| Context propagation | The module references trace correlation but does not clearly explain that distributed traces depend on propagation across service boundaries. | Add a concise section that prepares learners for Module 07. |
| Sampling trade-offs | Sampling is present but brief. | Expand head sampling, tail sampling, cost and evidence-loss trade-offs. |
| Span naming and attributes | The module warns about generic names and sensitive attributes but should give more examples and remediation. | Add best-practice guidance for span names, attributes and status. |
| Common mistakes | Current mistakes are concise and not framed with remediation. | Add a Course Bible-style common mistake block and practical remediation guidance. |
| Common Interview Questions | Required section is missing from `module.md`. | Add reasoning-oriented questions near the end of the module. |
| References in narrative | `module.md` embeds official URLs even though a dedicated `references.md` exists. | Link to `references.md` from the module and keep detailed references in the dedicated file. |
| Slide outline | Module-specific `slides/README.md` is not present. | Record as follow-up unless the upgrade scope expands to slides. |

## Checklist assessment

| Category | Status | Notes |
|---|---|---|
| Problem-driven opening | Pass | Starts from the realistic problem of finding where distributed request time was spent. |
| Narrative flow | Needs work | Current progression is logical but too compressed for a full chapter. |
| Production examples | Needs work | Examples exist but need labelled production framing. |
| Architect notes | Needs work | Trace trade-offs are present but not isolated for teaching. |
| Best practices | Needs work | Guidance exists but should be explicit and justified. |
| Common mistakes | Needs work | Present but should include remediation and design consequences. |
| Quiz | Pass | Dedicated quiz includes answers and trace reasoning. |
| References | Pass | Dedicated references use official OpenTelemetry, W3C and Grafana Tempo sources. |
| Visuals | Pass | Concept map, workflow, lab practice and operations view SVGs are linked. |
| Lab/exercise | Pass | Slow trace investigation exercise and trace-log correlation lab exist. |
| Interview questions | Needs work | Required section missing from `module.md`. |
| Slide outline | Needs work | Module-specific `slides/README.md` is not present. |

## Recommended upgrade plan

1. Add explicit Overview, Learning Objectives and Prerequisites sections.
2. Expand the module into a book-style chapter on traces as request-level evidence.
3. Add labelled Production Example, Architect Note, Best Practice and Common Mistake blocks.
4. Add a trace anatomy section covering trace id, span id, parent-child relationships, root spans, attributes and status.
5. Expand critical path, latency breakdown and first-failing-span investigation guidance.
6. Add context propagation dependency and prepare the transition to Module 07.
7. Strengthen sampling guidance around head sampling, tail sampling, cost and diagnostic value.
8. Link the existing exercise, lab, quiz and references from a Hands-on Practice section.
9. Add Key Takeaways, Common Interview Questions and Next Module transition.

## Review decision

Proceed with a focused Module 06 upgrade PR. Preserve the existing exercise and lab assets, and concentrate the upgrade on `module.md` plus the Sprint 7 backlog state.
