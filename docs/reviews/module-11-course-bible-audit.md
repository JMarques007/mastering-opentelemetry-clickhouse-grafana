# Module 11 Course Bible audit

Reviewer: Codex
Module: `modules/module-11-dashboards`
Reviewed against:

- `docs/COURSE_BIBLE.md`
- `docs/COURSE_CHECKLIST.md`
- `docs/GOLD_STANDARD_MODULE.md`
- `docs/BAD_WRITING_EXAMPLES.md`
- `CODING_AGENT.md`

## Summary

Module 11 has a strong conceptual foundation. It correctly frames dashboards as decision surfaces, not collections of panels. It emphasizes audience, operational questions, layout, hierarchy, drilldowns and periodic review. The exercise reinforces the right behavior: design from questions and incident use, not from available data.

The module is not yet Course Bible complete because `module.md` is still a concise draft. It lacks explicit Overview, Learning Objectives, Prerequisites, labelled teaching blocks, Common Interview Questions and a deeper production treatment of dashboard ownership, variables, drilldowns, review cadence, performance and dashboard lifecycle.

Recommended status: **Draft available, needs focused Course Bible alignment pass**.

## Strengths

- The opening phrase `Dashboards are decision surfaces` is strong and should be preserved.
- The module prioritizes audience and questions before panels.
- Layout and hierarchy are connected to incident scanning.
- Drilldowns are positioned as the path from symptoms to deeper evidence.
- The module already warns about crowded dashboards and unused panels.
- Dedicated `exercise.md`, `quiz.md` and `references.md` files exist.
- Visual assets support concept, workflow, practice and operations views.

## Blocked issues

No severe blocker prevents review or upgrade. The module can proceed directly to a focused Course Bible upgrade.

## Needs work

| Area | Finding | Recommendation |
|---|---|---|
| Required module structure | `module.md` starts with Course context and does not include explicit Overview, Learning Objectives or Prerequisites. | Add required front matter while preserving the decision-surface framing. |
| Required teaching blocks | Production Example, Architect Note, Best Practice and Common Mistake blocks are not labelled. | Add explicit Course Bible teaching blocks. |
| Dashboard architecture | Dashboards are described conceptually, but the module needs clearer architecture from telemetry source to panel to drilldown. | Add a section connecting data sources, panels, variables, links and evidence workflows. |
| Dashboard design depth | Audience and layout are present but brief. | Expand guidance on dashboard hierarchy, first-screen design, variables, units, thresholds and grouping. |
| Ownership and lifecycle | Periodic review is mentioned but ownership and lifecycle are underdeveloped. | Add production guidance on dashboard ownership, review cadence, stale panel removal and change management. |
| Performance | Query cost and dashboard load time are not covered enough. | Add guidance on panel count, time ranges, pre-aggregation and expensive queries. |
| Common mistakes | Current mistakes are concise and not framed with remediation. | Add Course Bible-style common mistake block and practical remediation guidance. |
| Common Interview Questions | Required section is missing from `module.md`. | Add reasoning-oriented questions near the end of the module. |
| References in narrative | `module.md` embeds official URLs even though `references.md` exists. | Link to `references.md` from the module and keep detailed references in the dedicated file. |
| Hands-on lab | README links an exercise but no dedicated lab file exists for Module 11. | Either upgrade the exercise into lab-quality form or record a follow-up lab task. |
| Slide outline | Module-specific `slides/README.md` is not present. | Record as follow-up unless the upgrade scope expands to slides. |

## Checklist assessment

| Category | Status | Notes |
|---|---|---|
| Problem-driven opening | Pass | Strong opening focused on dashboards as operational decision surfaces. |
| Narrative flow | Needs work | Current progression is logical but too compressed for a publication-quality chapter. |
| Production examples | Needs work | Examples exist but need labelled production framing. |
| Architect notes | Needs work | Trade-offs are present but not isolated as teaching blocks. |
| Best practices | Needs work | Guidance exists but should be explicit and justified. |
| Common mistakes | Needs work | Present but should include remediation and operational consequences. |
| Quiz | Pass | Dedicated quiz includes answers and checks dashboard design reasoning. |
| References | Pass | Dedicated references use official Grafana and Prometheus sources. |
| Visuals | Pass | Concept map, workflow, lab practice and operations view SVGs are linked. |
| Lab/exercise | Needs work | Exercise exists and is useful, but a full lab with expected outputs and cleanup is not present. |
| Interview questions | Needs work | Required section missing from `module.md`. |
| Slide outline | Needs work | Module-specific `slides/README.md` is not present. |

## Recommended upgrade plan

1. Add explicit Overview, Learning Objectives and Prerequisites sections.
2. Expand the module into a book-style chapter on dashboards as operational decision surfaces.
3. Add labelled Production Example, Architect Note, Best Practice and Common Mistake blocks.
4. Add a dashboard architecture section covering data sources, variables, panels, links and drilldowns.
5. Expand layout guidance around first-screen priorities, grouping, units, thresholds and visual hierarchy.
6. Add production guidance around ownership, review cadence, stale panels, query cost and performance.
7. Link the existing exercise, quiz and references from a Hands-on Practice section.
8. Add Key Takeaways, Common Interview Questions and Next Module transition.
9. Record a follow-up task for a full executable dashboard lab if the upgrade does not include one.

## Review decision

Proceed with a focused Module 11 upgrade PR. Preserve the decision-surface framing, strengthen production guidance and concentrate the upgrade on `module.md` plus the Sprint 9 backlog state.
