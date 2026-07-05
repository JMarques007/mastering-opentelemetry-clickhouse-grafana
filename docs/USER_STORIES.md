# User Stories

This document defines the user-story model for course development. It should be used together with `docs/SPRINT_ORGANIZATION.md` and `codex/tasks.md`.

Stories describe value. Tasks describe implementation. A good story makes it clear who benefits from the work and how the result will be verified.

## Personas

| Persona | Needs |
|---|---|
| Learner | Clear explanations, realistic examples, hands-on practice and review questions. |
| Instructor | Teach-ready modules, timing cues, discussion prompts, diagrams and reliable labs. |
| Course maintainer | Consistent structure, source-of-truth documents, review checklists and scoped PRs. |
| Platform engineer | Technically accurate OpenTelemetry, ClickHouse and Grafana guidance that maps to production decisions. |
| Workshop owner | Release-ready material that can support internal enablement, customer workshops and self-paced learning. |

## Story format

Use this format for planning:

```text
As a <persona>,
I want <capability or outcome>,
so that <course value or learner value>.
```

Each story must include acceptance criteria:

```text
Acceptance criteria:
- ...
- ...
- ...
```

## Story quality rules

A strong story:

- Describes learner, instructor, maintainer or workshop value.
- Can be verified from repository content.
- Produces meaningful course material, not only structure.
- Has clear acceptance criteria.
- Can be completed in one or a small number of focused PRs.

Avoid stories that only say:

- Add a file.
- Update docs.
- Improve content.
- Clean up module.

Those may be valid tasks, but they are not useful stories until the value is clear.

## Epics

### Epic 1 - Course governance

The repository has clear standards for quality, process, planning and review.

### Epic 2 - Module alignment

Every module follows the Course Bible and can be taught as a professional technical chapter.

### Epic 3 - Practical labs

Labs and examples are reproducible, technically accurate and connected to the module narrative.

### Epic 4 - Visual teaching assets

Diagrams, images and slides help learners understand architecture, flow and operational trade-offs.

### Epic 5 - Workshop readiness

The course can be delivered in live workshops or self-paced formats with predictable quality.

## Prioritized stories

### Story S7-01 - Module 03 audit

As a course maintainer,
I want Module 03 audited against the Course Bible and Gold Standard Module,
so that the Collector module has a clear, evidence-based upgrade plan.

Acceptance criteria:

- `docs/reviews/module-03-course-bible-audit.md` exists.
- The audit references the four source standards.
- The audit identifies strengths, gaps, checklist assessment and recommended upgrade plan.
- `codex/tasks.md` reflects the completed audit when the work is done.

### Story S7-02 - Module 03 upgrade

As a learner,
I want Module 03 to explain the OpenTelemetry Collector as a production control point,
so that I understand receivers, processors, exporters, extensions and pipelines as architecture decisions.

Acceptance criteria:

- Module 03 `module.md` contains required Course Bible teaching blocks.
- The module includes production examples and common Collector mistakes.
- The module links to lab, quiz, references and visuals.
- Key Takeaways and Common Interview Questions are present.

### Story S7-03 - Module 04 audit

As a course maintainer,
I want Module 04 audited before rewriting,
so that logs are improved without losing useful existing material.

Acceptance criteria:

- `docs/reviews/module-04-course-bible-audit.md` exists.
- The audit distinguishes logs as an event signal with cost, structure and correlation trade-offs.
- The audit recommends a focused upgrade plan.

### Story S7-04 - Module 04 upgrade

As a platform engineer,
I want the logs module to explain structured logs, correlation and ingestion trade-offs,
so that learners avoid treating logs as unbounded text dumps.

Acceptance criteria:

- Module 04 includes Course Bible teaching blocks.
- The narrative explains structured logging, attributes, trace correlation and storage cost.
- Common mistakes cover sensitive data, inconsistent fields and excessive volume.
- Practice assets are linked.

### Story S7-05 - Module 05 audit

As a course maintainer,
I want Module 05 audited against the Course Bible,
so that metrics content can be upgraded around operational decision-making.

Acceptance criteria:

- `docs/reviews/module-05-course-bible-audit.md` exists.
- The audit checks terminology for counters, gauges, histograms and cardinality.
- The audit identifies missing production examples and interview questions.

### Story S7-06 - Module 05 upgrade

As a learner,
I want the metrics module to explain aggregation, cardinality and alertability,
so that I can design metrics that support production operations.

Acceptance criteria:

- Module 05 includes Course Bible teaching blocks.
- The module explains metric types, labels, cardinality and histogram use cases.
- Production examples connect metrics to SLOs or alerting.
- Key Takeaways and Common Interview Questions are present.

### Story S7-07 - Module 06 audit

As a course maintainer,
I want Module 06 audited before upgrading,
so that trace concepts remain accurate and connected to the rest of the course.

Acceptance criteria:

- `docs/reviews/module-06-course-bible-audit.md` exists.
- The audit checks span, trace, parent-child relationship and sampling terminology.
- The audit identifies missing production examples and common mistakes.

### Story S7-08 - Module 06 upgrade

As a learner,
I want the traces module to explain request flow, latency breakdown and sampling trade-offs,
so that I can use traces for real distributed-system investigations.

Acceptance criteria:

- Module 06 includes Course Bible teaching blocks.
- The module explains trace structure, span relationships, propagation dependency and sampling impact.
- Common mistakes cover missing context, over-instrumentation and unreliable span naming.
- Practice assets are linked.

## Later sprint stories

### Story S8-01 - Context propagation alignment

As a learner,
I want context propagation explained separately from telemetry export,
so that I understand why traces break across service boundaries.

### Story S8-02 - Instrumentation alignment

As a platform engineer,
I want instrumentation guidance to compare manual and automatic approaches,
so that teams can make intentional adoption decisions.

### Story S9-01 - ClickHouse alignment

As a platform engineer,
I want ClickHouse explained as storage and query infrastructure for telemetry,
so that learners understand schema, ingestion, retention and query trade-offs.

### Story S9-02 - Grafana alignment

As an instructor,
I want Grafana modules to connect data sources, panels, dashboards and alerts,
so that learners can move from telemetry storage to operational insight.

### Story S10-01 - Best practices consolidation

As a workshop owner,
I want the best-practices module to summarize course-wide principles,
so that learners leave with production-ready decision frameworks.

### Story S10-02 - Production case study completion

As a learner,
I want a production case study that integrates instrumentation, Collector, ClickHouse, Grafana, dashboards and alerting,
so that I can see how the full observability platform works end to end.

## Story status tracking

`codex/tasks.md` remains the execution tracker. When a story is selected for a sprint, add the concrete task checklist there and keep this document as the planning source.

Suggested task pattern:

```text
## Sprint N - <Sprint Name>

- [ ] S7-01 Audit Module 03 against the Course Bible and Gold Standard Module.
- [ ] S7-02 Upgrade Module 03 to Course Bible standard.
```

## Story completion checklist

A story is complete when:

- Acceptance criteria are met.
- Relevant docs or module files are updated.
- The work is merged to `main`.
- `codex/tasks.md` reflects the final status.
- Follow-up work is recorded instead of left implicit.
