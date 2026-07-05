# Module 05 Course Bible audit

Reviewer: Codex
Module: `modules/module-05-metrics`
Reviewed against:

- `docs/COURSE_BIBLE.md`
- `docs/COURSE_CHECKLIST.md`
- `docs/GOLD_STANDARD_MODULE.md`
- `docs/BAD_WRITING_EXAMPLES.md`

## Summary

Module 05 has a good technical baseline. It explains metrics as numbers over time, introduces counters, gauges and histograms, and correctly highlights rates, percentiles, aggregation, labels and cardinality. The exercise and OTLP metrics lab are practical and aligned with the module topic.

The module is not yet Course Bible complete because `module.md` is still a concise draft. It lacks explicit Overview, Learning Objectives, Prerequisites, labelled teaching blocks and Common Interview Questions. The upgrade should expand the module from definitions into a production-oriented chapter about metric design, alertability and operational trade-offs.

Recommended status: **Draft available, needs focused Course Bible alignment pass**.

## Strengths

- The opening clearly distinguishes metrics from logs and traces.
- Counters, gauges and histograms are explained in practical terms.
- Rates, percentiles and aggregation are introduced with correct operational motivation.
- The module already warns about high-cardinality labels such as user id, request id and raw URL paths.
- The production section uses latency, traffic, errors and saturation as health categories.
- Dedicated `exercise.md`, `quiz.md` and `references.md` files exist.
- The lab sends OTLP sums, gauges and histograms through the Collector into ClickHouse.

## Blocked issues

No severe blocker prevents review or upgrade. The module can proceed directly to a focused Course Bible upgrade.

## Needs work

| Area | Finding | Recommendation |
|---|---|---|
| Required module structure | `module.md` starts with Course context and does not include explicit Overview, Learning Objectives or Prerequisites. | Add required front matter while preserving the signal comparison. |
| Required teaching blocks | Production Example, Architect Note, Best Practice and Common Mistake blocks are not labelled. | Add explicit Course Bible blocks. |
| Metric instrument depth | Counters, gauges and histograms are accurate but brief. | Expand with when-to-use guidance, query implications and alerting relevance. |
| Metric data model | Labels and cardinality are covered, but units, names and resource attributes need more emphasis. | Add a design section covering metric name, unit, labels, resource context and ownership. |
| Operational trade-offs | The module mentions percentiles and high cardinality but could better explain cost, query speed and alert reliability. | Add production guidance around aggregation, retention, cardinality budgets and alert ownership. |
| Common mistakes | Current mistakes are concise and not framed with remediation. | Add a Course Bible-style common mistake block and practical remediation guidance. |
| Common Interview Questions | Required section is missing from `module.md`. | Add reasoning-oriented questions near the end of the module. |
| References in narrative | `module.md` embeds official URLs even though a dedicated `references.md` exists. | Link to `references.md` from the module and keep detailed references in the dedicated file. |
| Slide outline | Module-specific `slides/README.md` is not present. | Record as follow-up unless the upgrade scope expands to slides. |

## Checklist assessment

| Category | Status | Notes |
|---|---|---|
| Problem-driven opening | Pass | Explains metrics as pattern evidence for dashboards, alerts and health. |
| Narrative flow | Needs work | Current progression is logical but too compressed for a full chapter. |
| Production examples | Needs work | Examples exist but need labelled production framing. |
| Architect notes | Needs work | Trade-offs are present but not isolated for teaching. |
| Best practices | Needs work | Guidance exists but should be explicit and justified. |
| Common mistakes | Needs work | Present but should include remediation and design consequences. |
| Quiz | Pass | Dedicated quiz includes answers and metric reasoning. |
| References | Pass | Dedicated references use official OpenTelemetry, Prometheus and Grafana sources. |
| Visuals | Pass | Concept map, workflow, lab practice and operations view SVGs are linked. |
| Lab/exercise | Pass | Checkout metric design exercise and OTLP metrics lab exist. |
| Interview questions | Needs work | Required section missing from `module.md`. |
| Slide outline | Needs work | Module-specific `slides/README.md` is not present. |

## Recommended upgrade plan

1. Add explicit Overview, Learning Objectives and Prerequisites sections.
2. Expand the module into a book-style chapter on metrics as numerical time-series evidence.
3. Add labelled Production Example, Architect Note, Best Practice and Common Mistake blocks.
4. Expand counters, gauges and histograms with use cases, query patterns and alerting relevance.
5. Add a metric design section covering names, units, labels, resource attributes and ownership.
6. Strengthen production guidance around cardinality, aggregation, percentiles, SLOs and alert actionability.
7. Link the existing exercise, lab, quiz and references from a Hands-on Practice section.
8. Add Key Takeaways, Common Interview Questions and Next Module transition.

## Review decision

Proceed with a focused Module 05 upgrade PR. Preserve the existing exercise and lab assets, and concentrate the upgrade on `module.md` plus the Sprint 7 backlog state.
