# Module 09 Course Bible audit

Reviewer: Codex
Module: `modules/module-09-clickhouse`
Reviewed against:

- `docs/COURSE_BIBLE.md`
- `docs/COURSE_CHECKLIST.md`
- `docs/GOLD_STANDARD_MODULE.md`
- `docs/BAD_WRITING_EXAMPLES.md`
- `CODING_AGENT.md`

## Summary

Module 09 has a useful technical foundation. It explains why ClickHouse fits analytical telemetry workloads, introduces columnar storage, schema design, ingestion, retention and SQL investigation patterns. The exercise and query workbook are directly relevant to production-style telemetry investigation.

The module is not yet Course Bible complete because `module.md` remains a concise draft. It lacks explicit Overview, Learning Objectives, Prerequisites, labelled teaching blocks, a fuller architecture section, Common Interview Questions and a stronger production treatment of schema, MergeTree ordering, batching, TTL and query cost.

Recommended status: **Draft available, needs focused Course Bible alignment pass**.

## Strengths

- The opening correctly frames observability data as large, repetitive and analytical.
- Columnar storage is explained in relation to telemetry query patterns.
- Schema design is tied to incident investigation rather than generic database modeling.
- Ingestion guidance mentions batching, buffering and backpressure.
- Retention is discussed by signal and use case.
- Dedicated `exercise.md`, `quiz.md` and `references.md` files exist.
- The lab query workbook connects traces, logs and metrics stored in ClickHouse.
- Visual assets support concept, workflow, practice and operations views.

## Blocked issues

No severe blocker prevents review or upgrade. The module can proceed directly to a focused Course Bible upgrade.

## Needs work

| Area | Finding | Recommendation |
|---|---|---|
| Required module structure | `module.md` starts with Course context and does not include explicit Overview, Learning Objectives or Prerequisites. | Add required front matter and keep the analytical workload framing. |
| Required teaching blocks | Production Example, Architect Note, Best Practice and Common Mistake blocks are not labelled. | Add explicit Course Bible teaching blocks. |
| Architecture | ClickHouse is described conceptually, but the module needs a clearer ingestion-to-query architecture. | Add an architecture section covering Collector export, ClickHouse tables, MergeTree storage and Grafana or SQL query usage. |
| Schema design | Current schema guidance is correct but brief. | Expand guidance around time columns, order keys, service/environment filters, trace ids, attributes and query patterns. |
| Ingestion | Tiny inserts and batching are mentioned but should be connected to Collector/exporter behavior. | Add production guidance on batching, buffering, backpressure and part creation. |
| Retention | TTL is mentioned but not deeply explained. | Add retention strategy by signal value, cost and compliance requirements. |
| Query examples | Query examples are summarized but not shown in the narrative. | Include representative SQL patterns and link to the workbook. |
| Common Interview Questions | Required section is missing from `module.md`. | Add reasoning-oriented questions near the end of the module. |
| References in narrative | `module.md` embeds official URLs even though `references.md` exists. | Link to `references.md` from the module and keep detailed references in the dedicated file. |
| Slide outline | Module-specific `slides/README.md` is not present. | Record as follow-up unless the upgrade scope expands to slides. |

## Checklist assessment

| Category | Status | Notes |
|---|---|---|
| Problem-driven opening | Pass | Starts from the analytical nature of telemetry data. |
| Narrative flow | Needs work | Current flow is logical but too compressed for a publication-quality chapter. |
| Production examples | Needs work | Examples exist but need labelled production framing. |
| Architect notes | Needs work | Trade-offs are present but not isolated as teaching blocks. |
| Best practices | Needs work | Guidance exists but should be explicit and justified. |
| Common mistakes | Needs work | Present but should include remediation and operational consequences. |
| Quiz | Pass | Dedicated quiz includes answers and checks key ClickHouse concepts. |
| References | Pass | Dedicated references use official ClickHouse and OpenTelemetry sources. |
| Visuals | Pass | Concept map, workflow, lab practice and operations view SVGs are linked. |
| Lab/exercise | Pass | Table-design exercise and query workbook lab exist. |
| Interview questions | Needs work | Required section missing from `module.md`. |
| Slide outline | Needs work | Module-specific `slides/README.md` is not present. |

## Recommended upgrade plan

1. Add explicit Overview, Learning Objectives and Prerequisites sections.
2. Expand the module into a book-style chapter on ClickHouse as analytical telemetry storage and investigation surface.
3. Add labelled Production Example, Architect Note, Best Practice and Common Mistake blocks.
4. Add an architecture section showing telemetry flow from Collector to ClickHouse to SQL/Grafana queries.
5. Expand schema design guidance around MergeTree, order keys, time-range filters, trace lookup and service/environment dimensions.
6. Strengthen ingestion guidance around batching, tiny inserts, backpressure and exporter behavior.
7. Expand retention and cost guidance using TTL and different signal lifetimes.
8. Link the existing exercise, lab, quiz and references from a Hands-on Practice section.
9. Add Key Takeaways, Common Interview Questions and Next Module transition.

## Review decision

Proceed with a focused Module 09 upgrade PR. Preserve the existing exercise and lab assets, and concentrate the upgrade on `module.md` plus the Sprint 8 backlog state.
