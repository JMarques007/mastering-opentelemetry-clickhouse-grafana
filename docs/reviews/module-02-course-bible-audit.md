# Module 02 Course Bible audit

Reviewer: Codex
Module: `modules/module-02-opentelemetry-architecture`
Reviewed against:

- `docs/COURSE_BIBLE.md`
- `docs/COURSE_CHECKLIST.md`
- `docs/GOLD_STANDARD_MODULE.md`
- `docs/BAD_WRITING_EXAMPLES.md`

## Summary

Module 02 is already structurally stronger than a basic draft. It has a clear architectural problem statement, explicit learning objectives, prerequisites, separate lab, quiz and reference files, and relevant SVG visuals.

The main gap is Course Bible completeness inside `module.md`: several required teaching blocks are present as ordinary prose or alternate headings, but they are not labelled consistently as Production Example, Architect Note, Best Practice and Common Mistake blocks. The module also needs a dedicated Common Interview Questions section.

Recommended status: **Draft available, needs focused Course Bible alignment pass**.

## Strengths

- The opening connects naturally from Module 01 and frames the architectural question clearly.
- The module explains why OpenTelemetry exists before listing components.
- SDK, OTLP, Collector, backend and visualization responsibilities are separated in a way learners can reason about.
- The module includes practical architecture flow diagrams and an operations view.
- Dedicated `lab.md`, `quiz.md` and `references.md` files exist and are linked from the README and narrative.
- Best practices and common mistakes are present as sections, which makes the upgrade smaller.

## Blocked issues

No severe blocker prevents review, but the module should not be considered Course Bible complete until the required teaching blocks and interview questions are added explicitly.

## Needs work

| Area | Finding | Recommendation |
|---|---|---|
| Required teaching blocks | `Architect's Perspective`, `Best Practices` and `Common Mistakes` exist, but they do not fully match the Course Bible block pattern. Production Example is missing as a labelled block. | Add labelled `Production Example`, `Architect Note`, `Best Practice` and `Common Mistake` blocks inside `module.md`. |
| Common Interview Questions | `module.md` has quiz links but no interview section. | Add reasoning-oriented interview questions near the end of the module. |
| Deployment models | Learning objectives mention agent, gateway and sidecar, but the narrative does not yet explain those deployment models in depth. | Add a concise section comparing direct, agent, gateway and sidecar patterns with trade-offs. |
| Production relevance | The architecture overview is clear but could use a more concrete production scenario. | Add a checkout or API-gateway example showing telemetry flow through SDK, OTLP, Collector, ClickHouse and Grafana. |
| Teaching consistency | Some headings are numbered while later operational sections are not. | Keep numbering if useful, but make the end-of-module sections consistent and easy to teach. |
| Slides requirement | README references training assets but `slides/README.md` is missing for this module. | Add or schedule a slide outline if Sprint 6 expands beyond module narrative alignment. |

## Checklist assessment

| Category | Status | Notes |
|---|---|---|
| Problem-driven opening | Pass | Starts from the real question of how telemetry travels through a platform. |
| Narrative flow | Pass | Moves from motivation to architecture, components and operational investigation. |
| Production examples | Needs work | Concrete examples are implied but not labelled or developed enough. |
| Architect notes | Needs work | Architect's Perspective exists but should align with Course Bible naming and placement. |
| Best practices | Needs work | Present as a section, but should include explicit best-practice block framing. |
| Common mistakes | Needs work | Present as a section, but should include explicit mistake/remediation framing. |
| Quiz | Pass | Dedicated quiz file includes questions, answers and discussion prompts. |
| References | Pass | Dedicated references file uses official sources. |
| Visuals | Pass | Concept map, workflow, lab practice and operations view SVGs are linked. |
| Lab/exercise | Pass | Dedicated architecture mapping lab exists. |
| Interview questions | Needs work | Required section missing from `module.md`. |
| Slide outline | Needs work | Course Bible expects `slides/README.md`; this module currently lacks that file. |

## Recommended upgrade plan

1. Add a labelled `Production Example` block using a concrete service flow such as checkout request telemetry.
2. Rename or supplement `Architect's Perspective` with a Course Bible-style `Architect Note` block.
3. Expand deployment models into a concise comparison of direct export, agent, gateway and sidecar patterns.
4. Convert best-practice and common-mistake guidance into explicit teaching blocks with rationale.
5. Add a `Common interview questions` section that tests architecture reasoning, not command memorization.
6. Consider a separate slide-outline PR if strict module structure compliance is required.

## Review decision

Proceed with a focused Module 02 upgrade PR before creating the repeatable alignment checklist for Modules 03-14.
