# Modules 03-14 Course Bible alignment checklist

Use this checklist to audit and upgrade Modules 03 through 14 consistently against the Course Bible, Course Checklist, Gold Standard Module and Bad Writing Examples.

This document is intentionally operational. It does not replace `docs/COURSE_CHECKLIST.md`; it turns that checklist into a repeatable workflow for the remaining modules.

## Source standards

Review every module against these documents before editing:

- `docs/COURSE_BIBLE.md`
- `docs/COURSE_CHECKLIST.md`
- `docs/GOLD_STANDARD_MODULE.md`
- `docs/BAD_WRITING_EXAMPLES.md`

## Target modules

| Module | Topic | Alignment status |
|---:|---|---|
| 03 | OpenTelemetry Collector | Pending audit |
| 04 | Logs | Pending audit |
| 05 | Metrics | Pending audit |
| 06 | Traces | Pending audit |
| 07 | Context Propagation | Pending audit |
| 08 | Instrumentation | Pending audit |
| 09 | ClickHouse | Pending audit |
| 10 | Grafana | Pending audit |
| 11 | Dashboards | Pending audit |
| 12 | Alerting | Pending audit |
| 13 | Best Practices | Pending audit |
| 14 | Production Case Study | Pending audit |

## Recommended execution order

1. Align Module 03 first because the Collector is the backbone for later logs, metrics and traces labs.
2. Align Modules 04, 05 and 06 together as the signal trio, but keep one PR per module.
3. Align Module 07 before Module 08 because context propagation changes how instrumentation is explained.
4. Align Modules 09 through 12 in platform order: storage, visualization, dashboards and alerting.
5. Align Modules 13 and 14 last so they can reuse terminology and examples from the earlier upgraded modules.

## Audit workflow

For each module, create a review file at:

```text
docs/reviews/module-NN-course-bible-audit.md
```

The audit must include:

- Summary and recommended status.
- Strengths worth preserving.
- Blocked issues, if any.
- Needs-work table with findings and recommendations.
- Checklist assessment covering narrative, teaching blocks, quiz, references, visuals, labs and interview questions.
- Recommended upgrade plan.
- Review decision.

Use the Module 01 and Module 02 audit documents as the template for tone and level of detail.

## Upgrade workflow

For each module upgrade, update only the files needed for that module unless a shared document genuinely needs maintenance.

Minimum expected `module.md` structure:

- Overview.
- Learning Objectives.
- Prerequisites.
- Problem-driven narrative introduction.
- Main teaching sections in a logical progression.
- At least one labelled `Production Example` block.
- At least one labelled `Architect Note` block.
- At least one labelled `Best Practice` block.
- At least one labelled `Common Mistake` block.
- Hands-on Lab, Exercise or Practice section linking to dedicated assets.
- Summary.
- Key Takeaways.
- Common Interview Questions.
- Official References or link to `references.md`.
- Next Module transition.

## Writing checks

Before opening a PR, confirm that the upgraded module:

- Explains why the topic matters before explaining commands or configuration.
- Reads like a professional technical chapter, not a reference dump.
- Uses practical examples from production observability systems.
- Avoids filler phrases and vague claims.
- Explains trade-offs instead of presenting one default answer as universal.
- Uses OpenTelemetry, ClickHouse and Grafana terminology accurately.
- Keeps vendor-neutral explanations where the topic is not product-specific.
- Uses bullets only when they improve scanning.
- Keeps diagrams and images tied to a specific teaching point.

## Technical checks

Confirm that examples and claims are technically sound:

- OpenTelemetry concepts match official project terminology.
- Collector pipeline terms are used correctly: receivers, processors, exporters, extensions and pipelines.
- Logs, metrics and traces are not described as interchangeable signals.
- Context propagation is described separately from telemetry export.
- ClickHouse is described as storage and query infrastructure, not as an observability product by itself.
- Grafana is described as visualization, query and alerting infrastructure, not as the telemetry source.
- Cardinality, sampling, retention and alerting claims include operational trade-offs.

## Asset checks

For each module, confirm that learner-facing assets are linked from the README and narrative where useful:

- `README.md`
- `module.md`
- `quiz.md`
- `references.md`
- `exercise.md` or `lab.md`
- Relevant SVG images under `images/`
- Slide outline under `slides/README.md`, if present or required for the module status

If a required asset is missing, record it in the audit before deciding whether to fix it in the same PR or a follow-up PR.

## Pull request rules

Keep PRs small and reviewable:

- One audit PR per module.
- One upgrade PR per module.
- Use a squash merge after verifying the diff.
- Update `codex/tasks.md` when a backlog item is completed.
- Do not mix unrelated image, lab or website changes into a module alignment PR.

## Definition of done for an audit

An audit is done when:

- The review file exists under `docs/reviews/`.
- It references the four source standards.
- It identifies strengths, gaps and an upgrade plan.
- It states whether the module can proceed to a focused upgrade.
- The backlog reflects the completed audit task, if that task exists.

## Definition of done for an upgrade

An upgrade is done when:

- `module.md` contains the required Course Bible teaching blocks.
- The module includes Key Takeaways and Common Interview Questions.
- Dedicated practice, quiz and reference assets are linked.
- Any new claims or examples are technically accurate.
- The module still has a coherent narrative after edits.
- The PR diff is limited to the module and necessary backlog updates.

## Suggested next backlog expansion

After this checklist is merged, add explicit Sprint 7 items for Modules 03-14:

```text
- [ ] Audit Module 03 against the Course Bible and Gold Standard Module.
- [ ] Upgrade Module 03 to Course Bible standard.
- [ ] Audit Module 04 against the Course Bible and Gold Standard Module.
- [ ] Upgrade Module 04 to Course Bible standard.
...
- [ ] Audit Module 14 against the Course Bible and Gold Standard Module.
- [ ] Upgrade Module 14 to Course Bible standard.
```

This keeps progress measurable while preserving focused PRs.
