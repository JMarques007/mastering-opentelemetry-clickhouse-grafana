# Module 14 Course Bible Audit

## Scope

This review covers Module 14 - Production Case Study, including:

- `modules/module-14-production-case-study/module.md`
- `modules/module-14-production-case-study/README.md`
- `modules/module-14-production-case-study/exercise.md`
- `modules/module-14-production-case-study/quiz.md`
- `modules/module-14-production-case-study/references.md`

The module was reviewed against the Course Bible, Course Checklist, Gold Standard Module, Bad Writing Examples and the repository-level coding-agent instructions.

## Summary

Module 14 has the right concept for a closing module. It asks learners to work through a checkout incident using alert evidence, dashboards, metrics, traces and logs, then finish with mitigation and post-incident learning. This is a strong foundation for the capstone experience.

The module is still too short for the final chapter of a professional course. It needs to integrate the entire platform more explicitly: .NET instrumentation, OpenTelemetry Collector, ClickHouse storage, Grafana dashboards, alerting, incident roles, mitigation decisions, validation and follow-up engineering work. It also needs the full Course Bible structure, a richer walkthrough, a production architecture view and interview questions that test end-to-end reasoning.

## Strengths

- The scenario is realistic and aligned with earlier examples: checkout failures, payment dependency latency and elevated error rate.
- The investigation path correctly starts with impact and moves from metrics to traces to logs.
- The exercise is teachable because it assigns incident roles and asks learners to build a timeline.
- The module emphasizes evidence-based response rather than guessing.
- Mitigation guidance correctly warns against losing evidence while restoring service.
- Existing visuals provide a base for the final case-study narrative.
- References are authoritative and relevant to the end-to-end workflow.

## Gaps Against Course Bible Structure

| Required block | Current state | Gap |
| --- | --- | --- |
| Introduction | Present but brief | Needs to position the case study as the capstone for the full course. |
| Learning Objectives | Missing | Add measurable objectives for investigation, mitigation and improvement. |
| Theory | Partial | Expand incident reasoning, signal selection and response principles. |
| Architecture | Missing | Add end-to-end architecture from service instrumentation to response. |
| Production Example | Present as scenario | Expand into a complete production incident narrative. |
| Walkthrough | Partial | Add a structured timeline and decision points. |
| Best Practices | Missing | Add incident investigation and follow-up practices. |
| Common Mistakes | Present but brief | Expand with production consequences. |
| Architect Notes | Missing | Add guidance about platform design and incident readiness. |
| Did You Know? | Missing | Add concise insight about incident evidence or trace correlation. |
| Interview Questions | Missing from module narrative | Add end-to-end questions. |
| Hands-on Lab | Present as exercise link only | Link exercise, quiz, references and define expected output. |
| Lab Solution | Missing | Add example timeline, evidence chain and follow-up improvements. |
| Summary | Partial via key takeaways | Add stronger course wrap-up. |
| References | Present | Keep and connect to narrative. |

## Content Gaps

### End-to-end platform integration

The module should explicitly connect all major course components:

- .NET service instrumentation emits traces, metrics and logs.
- W3C Trace Context preserves trace identity across checkout and payment boundaries.
- OpenTelemetry Collector receives, enriches, filters and exports telemetry.
- ClickHouse stores telemetry for investigation and historical queries.
- Grafana dashboards show impact and trend.
- Alerting routes the symptom to the right team.
- Runbooks guide mitigation and validation.

### Architecture diagram in narrative

The existing SVGs are useful, but the chapter should include an editable Mermaid architecture view so the final case study remains maintainable and teachable.

### Incident timeline

The upgrade should include a time-ordered incident timeline with evidence and decisions. This will help learners practice how responders reason under pressure.

### Decision points

The scenario should force decision-making, not only signal reading. It should cover decisions such as:

- When to declare an incident.
- Whether to rollback, fail over or degrade gracefully.
- How to validate mitigation.
- What evidence to preserve.
- Which follow-up improvements are worth prioritizing.

### Production notes

The module should include production considerations around incident communication, blast radius, dependency ownership, sampling limitations, dashboard trust, alert noise and post-incident change tracking.

### Lab solution

The exercise is good, but learners need an example solution. The solution should show an impact statement, evidence chain, mitigation, validation signals and three concrete follow-up improvements with owners.

## Checklist Assessment

- Technically correct: yes at a high level.
- Production-oriented: partially; needs richer operational details and trade-offs.
- Consistent with Course Bible: not yet; many required sections are missing.
- No placeholder content: yes.
- Avoids bad writing patterns: yes; prose is concise and direct.
- Lab connected to narrative: partially; exercise exists but needs solution framing.
- Diagrams: present, but narrative should include an editable end-to-end architecture diagram.

## Recommended Upgrade Plan

1. Rewrite Module 14 into the full Course Bible structure.
2. Add learning objectives and a capstone-oriented module structure.
3. Add an editable Mermaid architecture diagram for the full observability workflow.
4. Expand the checkout incident into a complete production example.
5. Add a detailed investigation walkthrough with timeline, evidence and decisions.
6. Add best practices for evidence-based response, mitigation validation and post-incident learning.
7. Expand common mistakes with production consequences.
8. Add Architect Notes, Did You Know, Interview Questions, Hands-on Lab and Lab Solution sections.
9. Link the existing exercise, quiz and references from the narrative.
10. Close the course with a summary that reinforces the full OpenTelemetry, ClickHouse and Grafana operating model.

## Review Decision

Proceed with a focused Module 14 upgrade PR. The existing scenario and exercise should be preserved, but the chapter needs to become the course capstone: an end-to-end production case study that demonstrates how all previous modules work together.
