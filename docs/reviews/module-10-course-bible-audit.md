# Module 10 Course Bible audit

Reviewer: Codex
Module: `modules/module-10-grafana`
Reviewed against:

- `docs/COURSE_BIBLE.md`
- `docs/COURSE_CHECKLIST.md`
- `docs/GOLD_STANDARD_MODULE.md`
- `docs/BAD_WRITING_EXAMPLES.md`
- `CODING_AGENT.md`

## Summary

Module 10 has a useful foundation. It explains Grafana as the interface where telemetry becomes visible, covers data sources, Explore, panels, dashboards, visualization choices, dashboard performance and trust. The exercise and starter dashboard lab are directly aligned with the course's ClickHouse-backed observability workflow.

The module is not yet Course Bible complete because `module.md` remains a concise draft. It lacks explicit Overview, Learning Objectives, Prerequisites, labelled teaching blocks, Common Interview Questions and a fuller production narrative around dashboard purpose, data-source design, Explore-to-dashboard workflows, performance, ownership and operational actionability.

Recommended status: **Draft available, needs focused Course Bible alignment pass**.

## Strengths

- The opening correctly frames Grafana as the visibility and investigation interface.
- The module emphasizes operational questions rather than decorative visualization.
- Data sources and Explore are introduced clearly.
- Dashboard audience and purpose are already mentioned.
- Performance and trust are treated as production concerns.
- Dedicated `exercise.md`, `quiz.md` and `references.md` files exist.
- The lab uses a real starter dashboard JSON for ClickHouse-backed checkout telemetry.
- Visual assets support concept, workflow, practice and operations views.

## Blocked issues

No severe blocker prevents review or upgrade. The module can proceed directly to a focused Course Bible upgrade.

## Needs work

| Area | Finding | Recommendation |
|---|---|---|
| Required module structure | `module.md` starts with Course context and does not include explicit Overview, Learning Objectives or Prerequisites. | Add required front matter while preserving the operational-question framing. |
| Required teaching blocks | Production Example, Architect Note, Best Practice and Common Mistake blocks are not labelled. | Add explicit Course Bible teaching blocks. |
| Architecture | Grafana is described conceptually, but the module needs a clearer architecture from data source to Explore to dashboard and alerting workflow. | Add a section connecting ClickHouse, Grafana data sources, Explore, panels, dashboards and alerts. |
| Explore workflow | Explore is described briefly. | Expand guidance on using Explore for ad hoc investigation before creating panels. |
| Dashboard design | Current guidance is correct but compressed. | Expand audience, decision, layout, units, thresholds, variables and drilldown guidance. |
| Performance and trust | Performance is mentioned but should include concrete production causes and mitigations. | Add guidance on time ranges, panel count, query cost, datasource limits and ownership. |
| Common mistakes | Current mistakes are concise and not framed with remediation. | Add Course Bible-style common mistake block and practical remediation guidance. |
| Common Interview Questions | Required section is missing from `module.md`. | Add reasoning-oriented questions near the end of the module. |
| References in narrative | `module.md` embeds official URLs even though `references.md` exists. | Link to `references.md` from the module and keep detailed references in the dedicated file. |
| Slide outline | Module-specific `slides/README.md` is not present. | Record as follow-up unless the upgrade scope expands to slides. |

## Checklist assessment

| Category | Status | Notes |
|---|---|---|
| Problem-driven opening | Pass | Starts from the need to make telemetry visible and actionable. |
| Narrative flow | Needs work | Current flow is logical but too compressed for a publication-quality chapter. |
| Production examples | Needs work | Examples exist but need labelled production framing. |
| Architect notes | Needs work | Grafana trade-offs are present but not isolated as teaching blocks. |
| Best practices | Needs work | Guidance exists but should be explicit and justified. |
| Common mistakes | Needs work | Present but should include remediation and operational consequences. |
| Quiz | Pass | Dedicated quiz includes answers and checks key visualization principles. |
| References | Pass | Dedicated references use official Grafana sources. |
| Visuals | Pass | Concept map, workflow, lab practice and operations view SVGs are linked. |
| Lab/exercise | Pass | Dashboard planning exercise and starter dashboard lab exist. |
| Interview questions | Needs work | Required section missing from `module.md`. |
| Slide outline | Needs work | Module-specific `slides/README.md` is not present. |

## Recommended upgrade plan

1. Add explicit Overview, Learning Objectives and Prerequisites sections.
2. Expand the module into a book-style chapter on Grafana as the exploration, dashboard and alerting interface.
3. Add labelled Production Example, Architect Note, Best Practice and Common Mistake blocks.
4. Add an architecture section showing data source, Explore, panel, dashboard and alert flow.
5. Expand Explore guidance as the bridge between ad hoc investigation and reusable dashboards.
6. Strengthen dashboard design guidance around audience, decision, units, thresholds, variables, drilldowns and ownership.
7. Expand performance and trust guidance around query cost, time ranges, panel count and dashboard review.
8. Link the existing exercise, lab, quiz and references from a Hands-on Practice section.
9. Add Key Takeaways, Common Interview Questions and Next Module transition.

## Review decision

Proceed with a focused Module 10 upgrade PR. Preserve the existing exercise and starter dashboard lab, and concentrate the upgrade on `module.md` plus the Sprint 8 backlog state.
