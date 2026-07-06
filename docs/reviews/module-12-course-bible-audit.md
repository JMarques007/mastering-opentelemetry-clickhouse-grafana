# Module 12 Course Bible audit

Reviewer: Codex
Module: `modules/module-12-alerting`
Reviewed against:

- `docs/COURSE_BIBLE.md`
- `docs/COURSE_CHECKLIST.md`
- `docs/GOLD_STANDARD_MODULE.md`
- `docs/BAD_WRITING_EXAMPLES.md`
- `CODING_AGENT.md`

## Summary

Module 12 has a strong practical foundation. It correctly distinguishes monitoring from alerting, frames alerts as requests for human action, and covers actionability, ownership, rule design, routing, escalation and review. The exercise and alert-rule lab are aligned with production alert design.

The module is not yet Course Bible complete because `module.md` is still a concise draft. It lacks explicit Overview, Learning Objectives, Prerequisites, labelled teaching blocks, Common Interview Questions and deeper production guidance around symptoms versus causes, severity, routing, silencing, runbooks, testing and alert lifecycle.

Recommended status: **Draft available, needs focused Course Bible alignment pass**.

## Strengths

- The opening distinction between monitoring and alerting is strong and should be preserved.
- The module clearly states that every alert consumes attention.
- Actionable alerts are defined around symptom, impact, owner and next step.
- Rule design already mentions windows, thresholds, severity and routing.
- Routing and escalation are treated as organizational decisions, not only technical settings.
- Dedicated `exercise.md`, `quiz.md` and `references.md` files exist.
- The lab reviews concrete alert rule examples with ownership, severity, annotations and runbook concerns.
- Visual assets support concept, workflow, practice and operations views.

## Blocked issues

No severe blocker prevents review or upgrade. The module can proceed directly to a focused Course Bible upgrade.

## Needs work

| Area | Finding | Recommendation |
|---|---|---|
| Required module structure | `module.md` starts with Course context and does not include explicit Overview, Learning Objectives or Prerequisites. | Add required front matter while preserving the request-for-action framing. |
| Required teaching blocks | Production Example, Architect Note, Best Practice and Common Mistake blocks are not labelled. | Add explicit Course Bible teaching blocks. |
| Alerting architecture | Alerting concepts are described but need a clearer path from signal to rule to notification to response. | Add an architecture section covering signals, rules, labels, annotations, routing, runbooks and escalation. |
| Symptoms versus causes | The module hints at user impact but could better explain why alerts should usually page on symptoms rather than every low-level cause. | Add production guidance comparing symptom alerts and diagnostic alerts. |
| Rule design | Windows and thresholds are present but brief. | Expand severity, evaluation windows, burn-rate thinking, flapping and testability. |
| Routing and silencing | Routing and escalation are present; silencing, maintenance windows and ownership lifecycle are missing. | Add guidance for routing, escalation, silencing and alert review. |
| Runbooks | Runbook links are mentioned but not deeply explained. | Add guidance for first action, first query, dashboard links and evidence links. |
| Common mistakes | Current mistakes are concise and not framed with remediation. | Add Course Bible-style common mistake block and practical remediation guidance. |
| Common Interview Questions | Required section is missing from `module.md`. | Add reasoning-oriented questions near the end of the module. |
| References in narrative | `module.md` embeds official URLs even though `references.md` exists. | Link to `references.md` from the module and keep detailed references in the dedicated file. |
| Slide outline | Module-specific `slides/README.md` is not present. | Record as follow-up unless the upgrade scope expands to slides. |

## Checklist assessment

| Category | Status | Notes |
|---|---|---|
| Problem-driven opening | Pass | Strong opening focused on alerts as human action requests. |
| Narrative flow | Needs work | Current progression is logical but too compressed for a publication-quality chapter. |
| Production examples | Needs work | Examples exist but need labelled production framing. |
| Architect notes | Needs work | Alerting trade-offs are present but not isolated as teaching blocks. |
| Best practices | Needs work | Guidance exists but should be explicit and justified. |
| Common mistakes | Needs work | Present but should include remediation and operational consequences. |
| Quiz | Pass | Dedicated quiz includes answers and checks core alerting principles. |
| References | Pass | Dedicated references use official Grafana, Prometheus and OpenTelemetry sources. |
| Visuals | Pass | Concept map, workflow, lab practice and operations view SVGs are linked. |
| Lab/exercise | Pass | Alert design exercise and alert-rule review lab exist. |
| Interview questions | Needs work | Required section missing from `module.md`. |
| Slide outline | Needs work | Module-specific `slides/README.md` is not present. |

## Recommended upgrade plan

1. Add explicit Overview, Learning Objectives and Prerequisites sections.
2. Expand the module into a book-style chapter on alerting as actionable response design.
3. Add labelled Production Example, Architect Note, Best Practice and Common Mistake blocks.
4. Add an alerting architecture section covering signal, rule, labels, annotations, routing, runbook and escalation.
5. Expand rule design guidance around severity, evaluation windows, noise, burn rates, flapping and testability.
6. Add routing, silencing, maintenance window and alert review guidance.
7. Strengthen runbook guidance around first action, first query, dashboard links and trace/log starting points.
8. Link the existing exercise, lab, quiz and references from a Hands-on Practice section.
9. Add Key Takeaways, Common Interview Questions and Next Module transition.

## Review decision

Proceed with a focused Module 12 upgrade PR. Preserve the actionability framing and concentrate the upgrade on `module.md` plus the Sprint 9 backlog state.
