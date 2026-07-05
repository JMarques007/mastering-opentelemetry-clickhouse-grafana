# Module 01 Course Bible audit

Reviewer: Codex
Module: `modules/module-01-introduction-to-observability`
Reviewed against:

- `docs/COURSE_BIBLE.md`
- `docs/COURSE_CHECKLIST.md`
- `docs/GOLD_STANDARD_MODULE.md`
- `docs/BAD_WRITING_EXAMPLES.md`

## Summary

Module 01 already has a strong problem-driven opening and a clear narrative around monitoring, logs, metrics, traces and correlation. It is substantially better than a definition-only draft.

The module is not yet fully aligned with the Course Bible because several required teaching blocks are implicit rather than explicit, and the module does not yet include Common Interview Questions in the narrative.

Recommended status: **Draft available, needs Course Bible alignment pass**.

## Strengths

- The opening starts with a realistic production complexity problem instead of a shallow definition.
- The monitoring versus observability distinction is clear and practical.
- Logs, metrics and traces are explained as complementary signals.
- Correlation is positioned as the investigation bridge between signals.
- The module links to dedicated exercise, quiz and references files.
- Visuals support the narrative and are relevant to the topic.

## Blocked issues

No severe blocker prevents review, but the module should not be considered Course Bible complete until the required teaching blocks are added explicitly.

## Needs work

| Area | Finding | Recommendation |
|---|---|---|
| Required teaching blocks | Production Example, Architect Note, Best Practice and Common Mistake blocks are not explicitly present. | Add clearly labelled blocks inside `module.md`. |
| Common Interview Questions | The narrative does not contain a dedicated Common Interview Questions section. | Add a short section with reasoning-oriented questions. |
| Structure | `module.md` has Course context but not an explicit Overview, Learning Objectives or Prerequisites section. | Add these sections or ensure README covers them and module narrative remains self-contained. |
| Course Bible wording | Some section headings are simpler than the Course Bible standard. | Keep concise headings, but add teaching blocks to meet the standard. |
| Delivery readiness | The module can be taught for 45-60 minutes, but instructor prompts are mostly external. | Add short discussion prompts or reference existing exercise/quiz assets. |

## Checklist assessment

| Category | Status | Notes |
|---|---|---|
| Problem-driven opening | Pass | Strong opening aligned with Gold Standard guidance. |
| Narrative flow | Pass | Sections progress naturally from complexity to signals to correlation. |
| Production examples | Needs work | Examples exist in prose but are not labelled as required blocks. |
| Architect notes | Needs work | Trade-offs are present but not isolated for teaching. |
| Best practices | Needs work | Guidance exists but should be explicit. |
| Common mistakes | Needs work | A section exists but should use Course Bible style. |
| Quiz | Pass | Dedicated quiz file exists with answers. |
| References | Pass | Dedicated references file exists with official sources. |
| Visuals | Pass | Four relevant SVGs are present. |
| Lab/exercise | Pass | Dedicated exercise exists. |
| Interview questions | Needs work | Required section missing from `module.md`. |

## Recommended upgrade plan

1. Add explicit `Overview`, `Learning objectives` and `Prerequisites` sections to `module.md`.
2. Add labelled `Production Example`, `Architect Note`, `Best Practice` and `Common Mistake` blocks.
3. Add a `Common interview questions` section with questions that test reasoning, not memorization.
4. Keep the existing narrative intact where possible because it is already strong.
5. Update the Sprint 6 backlog after the module upgrade is complete.

## Review decision

Proceed with a focused Module 01 upgrade PR before auditing Module 02.
