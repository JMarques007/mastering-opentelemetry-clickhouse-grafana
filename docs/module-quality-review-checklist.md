# Module quality review checklist

Use this checklist before marking a module as `Needs review` or `Complete`.

The goal is to catch gaps that reduce teaching quality: unclear outcomes, weak exercises, broken links, unhelpful diagrams, unsafe examples or missing operational trade-offs.

## Review status levels

| Status | Meaning |
|---|---|
| Draft available | Module has usable content but has not completed quality review. |
| Needs review | Module passed author review and is ready for technical/editorial feedback. |
| Complete | Module has passed technical review, editorial review and delivery readiness checks. |

## Scoring model

For each category, mark one of:

| Score | Meaning |
|---|---|
| Pass | Ready for review or delivery. |
| Needs work | Usable but should be improved before delivery. |
| Blocked | Missing, broken or unsafe. Must be fixed. |
| Not applicable | The category does not apply to this module. |

A module should not move to `Needs review` with any `Blocked` category.

## Content review

- The module has a clear purpose and learning outcome.
- The module explains why the concept exists before explaining how it works.
- The narrative is book-style, not just bullet points.
- Technical terms are introduced before they are used heavily.
- Examples are production-oriented and relevant to observability engineering.
- Common mistakes include real operational consequences.
- Key takeaways are concise and match the learning objectives.

## Structure review

- `README.md` exists and links to the module narrative.
- `module.md` exists and is the main teaching narrative.
- Practice files exist where useful: `exercise.md`, `lab.md`, `quiz.md` and `references.md`.
- README links to diagrams and labs without broken paths.
- Next module references are correct.
- The module follows the repository naming convention.

## Lab and exercise review

- The exercise or lab has a clear goal.
- Steps are reproducible from a clean checkout when the lab is practical.
- Expected outcomes are explicit.
- Cleanup steps are included when local services or data are created.
- The lab avoids secrets, private endpoints and machine-specific assumptions.
- Discussion questions reinforce operational reasoning, not only tool syntax.

## Diagram and visual review

- Diagrams render correctly and do not overlap text.
- Diagram titles, subtitles and nodes are readable.
- Diagram filenames follow `STYLE_GUIDE.md` conventions.
- Diagrams support the teaching point instead of acting as decoration.
- Architecture diagrams show responsibility boundaries clearly.

## Technical review

- OpenTelemetry terminology is accurate.
- Collector, OTLP, SDK, signal and exporter responsibilities are not conflated.
- ClickHouse examples are clearly marked as examples and tied to query patterns.
- Grafana examples distinguish datasource, query, panel, dashboard and alerting concerns.
- Alerting examples include ownership, severity and response context.
- Privacy, cost and cardinality risks are called out where relevant.

## References review

- References are official where possible.
- URLs point to relevant documentation, not generic homepages unless appropriate.
- Third-party sources are avoided unless clearly justified.
- References support the concepts taught in the module.

## Delivery readiness review

- Instructor notes or prompts exist for discussion-heavy modules.
- Timing is realistic for the workshop format.
- The module has at least one learner checkpoint or review activity.
- The module can be taught independently, while still fitting the course sequence.
- The module transitions clearly to the next topic.

## Module review tracker

| Module | Content | Structure | Practice | Diagrams | Technical | References | Delivery | Notes |
|---:|---|---|---|---|---|---|---|---|
| 01 |  |  |  |  |  |  |  | Introduction and signal foundation. |
| 02 |  |  |  |  |  |  |  | Architecture map and responsibilities. |
| 03 |  |  |  |  |  |  |  | Collector pipeline and lab environment. |
| 04 |  |  |  |  |  |  |  | Structured logs and correlation. |
| 05 |  |  |  |  |  |  |  | Metrics instruments and cardinality. |
| 06 |  |  |  |  |  |  |  | Traces and trace/log correlation. |
| 07 |  |  |  |  |  |  |  | Propagation and baggage safety. |
| 08 |  |  |  |  |  |  |  | Instrumentation design. |
| 09 |  |  |  |  |  |  |  | ClickHouse schema and query patterns. |
| 10 |  |  |  |  |  |  |  | Grafana exploration and dashboard starter. |
| 11 |  |  |  |  |  |  |  | Dashboard design discipline. |
| 12 |  |  |  |  |  |  |  | Alert ownership and rules. |
| 13 |  |  |  |  |  |  |  | Governance, cost and privacy. |
| 14 |  |  |  |  |  |  |  | Production case study and capstone. |

## Reviewer notes template

Use this format when reviewing a module:

```text
Module:
Reviewer:
Date:
Recommended status:

Blocked issues:
- ...

Needs work:
- ...

Strengths:
- ...

Delivery notes:
- ...
```
