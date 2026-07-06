# Module 13 Course Bible Audit

## Scope

This review covers Module 13 - Best Practices, including:

- `modules/module-13-best-practices/module.md`
- `modules/module-13-best-practices/README.md`
- `modules/module-13-best-practices/exercise.md`
- `modules/module-13-best-practices/quiz.md`
- `modules/module-13-best-practices/references.md`

The module was reviewed against the Course Bible, Course Checklist, Gold Standard Module, Bad Writing Examples and the repository-level coding-agent instructions.

## Summary

Module 13 has a useful foundation. It correctly frames observability as an operating discipline rather than a tooling exercise, and it already covers important themes such as operational questions, signal quality, cost, privacy and ownership. Those themes are exactly right for a best-practices consolidation module.

The main gap is depth. The module currently reads like a concise summary rather than the final synthesis chapter of a professional course. It needs a clearer production operating model, a maturity framework, stronger trade-off analysis, more explicit links back to instrumentation, Collector pipelines, ClickHouse, Grafana dashboards and alerting, plus the required Course Bible teaching blocks.

## Strengths

- The opening correctly warns that collecting more telemetry is not the same as improving operations.
- The module emphasizes operational questions, which is the right anchor for best-practices guidance.
- Signal quality, cost, privacy and ownership are already present as core themes.
- The exercise is appropriate for the module because it asks learners to audit a real service design.
- The references are authoritative and include OpenTelemetry, semantic conventions, Grafana dashboard guidance and CNCF TAG Observability.
- Existing SVG assets provide a visual base for the chapter.

## Gaps Against Course Bible Structure

| Required block | Current state | Gap |
| --- | --- | --- |
| Introduction | Present but brief | Needs to position Module 13 as the course-wide synthesis module. |
| Learning Objectives | Missing | Add measurable objectives focused on production readiness and decision frameworks. |
| Theory | Partial | Expand into operating principles, maturity, governance and trade-offs. |
| Architecture | Missing | Add architecture showing telemetry governance across services, Collector, storage, dashboards and alerts. |
| Production Example | Missing | Add an example of improving one service's observability maturity. |
| Walkthrough | Missing | Add step-by-step observability review workflow. |
| Best Practices | Present but fragmented | Convert into clear guidance with rationale and trade-offs. |
| Common Mistakes | Present but brief | Expand with concrete failure modes and consequences. |
| Architect Notes | Missing | Add platform/team ownership guidance. |
| Did You Know? | Missing | Add a concise insight about observability maturity or cost. |
| Interview Questions | Missing from module narrative | Add course-level questions beyond the short quiz. |
| Hands-on Lab | Present as exercise link only | Link exercise, quiz, references and define expected audit output. |
| Lab Solution | Missing | Add expected findings and improvement examples. |
| Summary | Partial via key takeaways | Add closing synthesis and transition to Module 14. |
| References | Present | Keep and connect to narrative. |

## Content Gaps

### Production operating model

The module should explain how observability is owned in production. It should distinguish responsibilities between service teams, platform teams, SRE teams and technical leadership. Without this, learners may leave with good practices but no adoption model.

### Maturity framework

As the best-practices module, it should provide a maturity ladder such as:

1. Signals exist but are inconsistent.
2. Signals are standardized by service and environment.
3. Signals support incident workflows.
4. Signals are governed for cost, privacy and ownership.
5. Observability is reviewed continuously through incidents and service changes.

This would help instructors explain gradual adoption rather than presenting best practices as an all-or-nothing checklist.

### Course-wide integration

The chapter should explicitly connect earlier modules:

- Instrumentation quality affects every downstream workflow.
- Collector pipelines are policy enforcement points.
- ClickHouse retention and schema decisions shape cost and investigation speed.
- Grafana dashboards need audience and ownership.
- Alerts should be actionable and tied to runbooks.

### Trade-offs

The current text names trade-offs but does not develop them. The upgrade should explain trade-offs such as:

- Full-fidelity traces versus sampling.
- Log retention versus investigation requirements.
- Metric labels versus cardinality cost.
- Central standards versus team autonomy.
- Governance versus delivery speed.

### Production examples

Add one realistic example, such as a checkout service review. The example should show how the team removes noisy logs, standardizes service labels, adds trace correlation, controls high-cardinality metric labels, assigns dashboard owners and validates alert actionability.

### Interview questions

The module needs broader interview questions because this is a synthesis chapter. Questions should test maturity, governance, cost, privacy, signal design and operating model judgment.

## Checklist Assessment

- Technically correct: mostly yes, but still too high level for publication quality.
- Production-oriented: partially; needs operating model and realistic examples.
- Consistent with Course Bible: not yet; missing many required sections.
- No placeholder content: yes.
- Avoids bad writing patterns: yes; the prose is concise and avoids filler.
- Lab connected to narrative: partially; exercise is useful but needs expected solution framing.
- Diagrams: present as SVG assets, but architecture should also be explained in the narrative.

## Recommended Upgrade Plan

1. Rewrite the module into the full Course Bible structure.
2. Add learning objectives and a module structure section.
3. Introduce an observability maturity model.
4. Add a production architecture view for governance across signals, Collector, storage, dashboards and alerts.
5. Add a checkout-service observability review example.
6. Add a walkthrough for running a telemetry design audit.
7. Expand best practices into decision-oriented guidance.
8. Expand common mistakes with concrete production consequences.
9. Add Architect Notes, Did You Know, Interview Questions, Hands-on Lab and Lab Solution sections.
10. Link the existing exercise, quiz and references from the narrative.

## Review Decision

Proceed with a focused Module 13 upgrade PR. The existing material should be preserved as the conceptual foundation, but the chapter needs to become a production-readiness synthesis rather than a short best-practices note.
