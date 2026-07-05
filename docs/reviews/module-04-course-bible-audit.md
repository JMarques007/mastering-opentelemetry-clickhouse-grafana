# Module 04 Course Bible audit

Reviewer: Codex
Module: `modules/module-04-logs`
Reviewed against:

- `docs/COURSE_BIBLE.md`
- `docs/COURSE_CHECKLIST.md`
- `docs/GOLD_STANDARD_MODULE.md`
- `docs/BAD_WRITING_EXAMPLES.md`

## Summary

Module 04 has a strong practical foundation. It treats logs as event evidence, emphasizes structured fields, severity discipline, correlation with traces and metrics, and safe production logging. The dedicated exercise and OTLP log ingestion lab are directly useful for teaching.

The module is not yet Course Bible complete because `module.md` is still a concise draft. It lacks explicit Overview, Learning Objectives, Prerequisites, labelled Course Bible teaching blocks and a Common Interview Questions section. The upgrade should expand the narrative without weakening the clear existing message: logs are useful when they are structured, safe and correlated.

Recommended status: **Draft available, needs focused Course Bible alignment pass**.

## Strengths

- The opening correctly frames logs as familiar but easy to misuse.
- Logs are defined as timestamped events rather than generic text strings.
- Structured logging is explained with a useful contrast between vague and actionable messages.
- The module already covers severity, noise, trace correlation, privacy and retention.
- Dedicated `exercise.md`, `quiz.md` and `references.md` files exist.
- The lab sends structured OTLP logs through the Collector and queries them from ClickHouse.
- Visual assets support concept, workflow, practice and operations views.

## Blocked issues

No severe blocker prevents review or upgrade. The module can proceed directly to a focused Course Bible upgrade.

## Needs work

| Area | Finding | Recommendation |
|---|---|---|
| Required module structure | `module.md` starts with Course context and does not include explicit Overview, Learning Objectives or Prerequisites. | Add required front matter while preserving the current practical framing. |
| Required teaching blocks | Production Example, Architect Note, Best Practice and Common Mistake blocks are not labelled. | Add explicit Course Bible blocks inside the narrative. |
| Log data model | Logs are described well conceptually, but the distinction between body, severity, attributes and resource attributes could be clearer. | Add a short section that explains log record anatomy. |
| Structured logging examples | The current example is useful but brief. | Add a concrete checkout/payment log example with safe fields and correlation identifiers. |
| Operational trade-offs | Noise, retention and privacy are mentioned but should be expanded with cost and investigation trade-offs. | Add production guidance on volume, retention tiers, sampling/filtering and access control. |
| Common mistakes | Current mistakes are concise and not framed with remediation. | Add Course Bible-style common mistake block and a more detailed list. |
| Common Interview Questions | Required section is missing from `module.md`. | Add reasoning-oriented questions near the end of the module. |
| References in narrative | `module.md` embeds official URLs even though a dedicated `references.md` exists. | Link to `references.md` from the module and keep detailed references in the dedicated file. |
| Slide outline | Module-specific `slides/README.md` is not present. | Record as follow-up unless the upgrade scope expands to slides. |

## Checklist assessment

| Category | Status | Notes |
|---|---|---|
| Problem-driven opening | Pass | Starts with the risk of logs becoming noise instead of evidence. |
| Narrative flow | Needs work | Current progression is logical but too compressed for a full chapter. |
| Production examples | Needs work | Examples exist but need labelled, concrete production framing. |
| Architect notes | Needs work | Trade-offs are present but not isolated for teaching. |
| Best practices | Needs work | Guidance exists but should be explicit and justified. |
| Common mistakes | Needs work | Present but should include clearer remediation patterns. |
| Quiz | Pass | Dedicated quiz includes answers and reasoning around severity and correlation. |
| References | Pass | Dedicated references use official OpenTelemetry, Grafana Loki and OWASP sources. |
| Visuals | Pass | Concept map, workflow, lab practice and operations view SVGs are linked. |
| Lab/exercise | Pass | Structured log rewrite exercise and OTLP ingestion lab exist. |
| Interview questions | Needs work | Required section missing from `module.md`. |
| Slide outline | Needs work | Module-specific `slides/README.md` is not present. |

## Recommended upgrade plan

1. Add explicit Overview, Learning Objectives and Prerequisites sections.
2. Expand the module into a book-style chapter on logs as structured event evidence.
3. Add a log record anatomy section covering timestamp, severity, body, attributes, resource attributes, trace id and span id.
4. Add labelled Production Example, Architect Note, Best Practice and Common Mistake blocks.
5. Expand production guidance around safe fields, data sensitivity, retention, volume control and correlation.
6. Link the existing exercise, lab, quiz and references from a Hands-on Practice section.
7. Add Key Takeaways, Common Interview Questions and Next Module transition.

## Review decision

Proceed with a focused Module 04 upgrade PR. Preserve the existing exercise and lab assets, and concentrate the upgrade on `module.md` plus the Sprint 7 backlog state.
