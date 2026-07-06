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

### Story S8-01 - Context propagation alignment

As a learner,
I want context propagation explained separately from telemetry export,
so that I understand why traces break across service boundaries.

Acceptance criteria:

- Module 07 explains propagation as the movement of trace identity across boundaries.
- The module distinguishes propagation from telemetry export.
- Practice assets show a broken and repaired propagation path.
- Key Takeaways and Common Interview Questions are present.

### Story S8-02 - Instrumentation alignment

As a platform engineer,
I want instrumentation guidance to compare manual and automatic approaches,
so that teams can make intentional adoption decisions.

Acceptance criteria:

- Module 08 explains manual, automatic and hybrid instrumentation trade-offs.
- The module covers ownership, rollout, signal quality and production risk.
- Common mistakes include over-instrumentation and missing business spans.
- Practice assets are linked.

### Story S8-03 - ClickHouse alignment

As a platform engineer,
I want ClickHouse explained as storage and query infrastructure for telemetry,
so that learners understand schema, ingestion, retention and query trade-offs.

Acceptance criteria:

- Module 09 includes Course Bible teaching blocks.
- The module explains Collector-to-ClickHouse architecture.
- The narrative covers schema, batching, retention, TTL and SQL investigation patterns.
- Practice assets are linked.

### Story S8-04 - Grafana alignment

As an instructor,
I want Grafana modules to connect data sources, panels, dashboards and alerts,
so that learners can move from telemetry storage to operational insight.

Acceptance criteria:

- Module 10 includes Course Bible teaching blocks.
- The module explains data sources, Explore, panels, dashboards and trust.
- The narrative covers dashboard purpose, audience, query cost and drilldowns.
- Practice assets are linked.

### Story S9-01 - Module 11 audit

As a course maintainer,
I want Module 11 audited against the Course Bible and Gold Standard Module,
so that dashboard content can be upgraded without losing useful existing guidance.

Acceptance criteria:

- `docs/reviews/module-11-course-bible-audit.md` exists.
- The audit checks dashboard purpose, audience, layout, variables, drilldowns and ownership.
- The audit identifies missing production examples, teaching blocks and interview questions.
- `codex/tasks.md` reflects the completed audit when the work is done.

### Story S9-02 - Module 11 upgrade

As an instructor,
I want the dashboards module to teach operational dashboard design,
so that learners can build dashboards that support incident response and repeated service review.

Acceptance criteria:

- Module 11 includes Course Bible teaching blocks.
- The module explains dashboard audience, layout, panel hierarchy, variables, drilldowns and ownership.
- Common mistakes cover dashboard sprawl, unclear units, hidden filters and unowned panels.
- Practice assets are linked.

### Story S9-03 - Module 12 audit

As a course maintainer,
I want Module 12 audited against the Course Bible and Gold Standard Module,
so that alerting content can be upgraded around actionability and production operations.

Acceptance criteria:

- `docs/reviews/module-12-course-bible-audit.md` exists.
- The audit checks alert rule quality, routing, severity, noise, ownership and runbook guidance.
- The audit identifies missing production examples, teaching blocks and interview questions.
- `codex/tasks.md` reflects the completed audit when the work is done.

### Story S9-04 - Module 12 upgrade

As a platform engineer,
I want the alerting module to explain actionable alerts and response workflows,
so that teams avoid noisy rules and build alerts that lead to clear operational action.

Acceptance criteria:

- Module 12 includes Course Bible teaching blocks.
- The module explains symptoms versus causes, severity, routing, ownership, silencing and runbooks.
- Common mistakes cover alert fatigue, duplicate rules, missing context and unactionable thresholds.
- Practice assets are linked.

### Story S10-01 - Module 13 audit

As a course maintainer,
I want Module 13 audited against the Course Bible and Gold Standard Module,
so that the best-practices module can consolidate the course without becoming a loose checklist.

Acceptance criteria:

- `docs/reviews/module-13-course-bible-audit.md` exists.
- The audit checks production readiness, maturity model, operating model, governance and trade-off coverage.
- The audit identifies missing teaching blocks, examples, diagrams and interview questions.
- `codex/tasks.md` reflects the completed audit when the work is done.

### Story S10-02 - Module 13 upgrade

As a workshop owner,
I want the best-practices module to summarize course-wide principles,
so that learners leave with production-ready decision frameworks.

Acceptance criteria:

- Module 13 includes Course Bible teaching blocks.
- The module consolidates instrumentation, Collector, storage, dashboards, alerting and governance practices.
- The narrative explains trade-offs, maturity levels, production recommendations and common failure modes.
- Practice assets, key takeaways and interview questions are linked or included.

### Story S10-03 - Module 14 audit

As a course maintainer,
I want Module 14 audited before expanding the final case study,
so that the closing module integrates previous modules accurately and consistently.

Acceptance criteria:

- `docs/reviews/module-14-course-bible-audit.md` exists.
- The audit checks whether the case study covers instrumentation, Collector, ClickHouse, Grafana, dashboards and alerting.
- The audit identifies missing architecture, walkthrough, production notes and lab guidance.
- `codex/tasks.md` reflects the completed audit when the work is done.

### Story S10-04 - Module 14 upgrade

As a learner,
I want a production case study that integrates instrumentation, Collector, ClickHouse, Grafana, dashboards and alerting,
so that I can see how the full observability platform works end to end.

Acceptance criteria:

- Module 14 includes Course Bible teaching blocks.
- The module presents an end-to-end production scenario with architecture, walkthrough and operational decisions.
- The case study connects telemetry generation, collection, storage, visualization, alerting and response.
- Practice assets, key takeaways and interview questions are linked or included.

### Story S11-01 - Premium SVG visual system

As an instructor,
I want a consistent visual system for premium SVG explainer images,
so that every module can use clear, editable, classroom-ready visuals without layout drift or unreadable text.

Acceptance criteria:

- A course visual system document exists or `STYLE_GUIDE.md` is expanded with SVG-specific rules.
- The guidance defines canvas size, margins, typography, color palette, icon style, card layout, arrows, captions and accessibility expectations.
- The guidance explicitly prevents known issues such as subtitle overlap, cramped text, inconsistent line weights and non-editable raster-only diagrams.
- The guidance references the desired visual direction: clean explainer cards, telemetry workflows, signal correlation and end-to-end investigation views.

### Story S11-02 - Module visual refresh

As a learner,
I want each module to include at least one premium editable SVG explainer image,
so that complex OpenTelemetry, ClickHouse and Grafana concepts are easier to understand before reading the detailed narrative.

Acceptance criteria:

- Every module has at least one premium SVG explainer image aligned with its main learning outcome.
- Images are editable SVG, not screenshots, and use the shared visual system.
- Images are checked for readable text, safe margins, non-overlapping subtitles and consistent visual hierarchy.
- Module READMEs and narratives link to the correct visual assets.
- The refreshed visuals include at least one correlation-style image and one logs/metrics/traces comparison-style image.

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
