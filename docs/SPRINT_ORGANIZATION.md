# Sprint Organization

This document defines how course development work is organized into sprints. It complements `codex/tasks.md`, which remains the immediate execution backlog.

The goal is to make progress measurable without turning the course into a generic project-management exercise. Every sprint must produce visible course value: stronger modules, better labs, clearer diagrams, reusable teaching assets or release readiness improvements.

## Sprint principles

- Keep one sprint focused on one outcome.
- Prefer reviewable increments over broad unfinished rewrites.
- Keep one pull request scoped to one module, one lab family or one project-governance concern.
- Use user stories to describe learner, instructor or maintainer value.
- Use the Course Bible and Course Checklist as quality gates.
- Do not mark a sprint done just because files exist; the content must be useful.

## Sprint artifact set

Each sprint should have:

- A sprint goal.
- A short set of user stories.
- Acceptance criteria for each story.
- A definition of done.
- A list of expected changed areas.
- Explicit follow-up work that should not be hidden inside the current sprint.

## Sprint lifecycle

### 1. Select the sprint goal

Choose one clear outcome, such as:

- Align Modules 03-06 with the Course Bible.
- Validate all reproducible labs from a clean checkout.
- Prepare release-ready slides for the first workshop block.
- Improve instructor delivery assets for a two-day course.

A good sprint goal says what will be better for the course after the sprint is complete.

### 2. Break the goal into user stories

Use `docs/USER_STORIES.md` for the story format. Stories should describe value from the perspective of a learner, instructor, maintainer or course owner.

Avoid implementation-only tasks as stories. For example, `add file` is weak. `As an instructor, I can teach Module 03 from a clear Collector narrative and lab path` is stronger.

### 3. Define acceptance criteria

Every story must have observable criteria. Good acceptance criteria mention files, behavior, teaching quality or review evidence.

Examples:

- `module.md` contains all required Course Bible teaching blocks.
- The lab can be run from a clean checkout using documented commands.
- The module links to quiz, references, visuals and practice assets.
- A review document records strengths, gaps and the upgrade plan.

### 4. Execute in focused PRs

Use small branches and squash merge after verifying the diff.

Recommended branch naming:

```text
codex/module-03-course-bible-audit
codex/module-03-course-bible-upgrade
codex/labs-clean-checkout-validation
codex/workshop-slide-outline-pass
```

### 5. Close the sprint deliberately

Before marking a sprint complete:

- Check `codex/tasks.md`.
- Confirm all linked PRs are merged.
- Confirm new docs are linked from README or AGENTS when they affect navigation or agent behavior.
- Record any deferred work as a new task, not as hidden intent.

## Definition of ready

A sprint is ready to start when:

- The goal is specific.
- The relevant source standards are known.
- Stories have acceptance criteria.
- The likely changed areas are identified.
- The sprint can be completed in focused PRs.

## Definition of done

A sprint is done when:

- All committed stories meet their acceptance criteria.
- Changed content follows `docs/COURSE_BIBLE.md` and `STYLE_GUIDE.md`.
- Quality gates in `docs/COURSE_CHECKLIST.md` are satisfied or documented as follow-up.
- `codex/tasks.md` reflects the actual state.
- Repository navigation is updated for any new major artifact.

## Sprint numbering

Past sprints remain historical. New work should continue with the next sprint number in `codex/tasks.md`.

Current completed sprint sequence:

| Sprint | Focus | Status |
|---:|---|---|
| 1 | Repository foundation | Complete |
| 2 | Module readiness | Complete |
| 3 | Teaching assets | Complete |
| 4 | Reproducible labs and examples | Complete |
| 5 | Workshop readiness | Complete |
| 6 | Course Bible alignment foundation | Complete |

The next recommended sprint is Sprint 7: Course Bible alignment for Modules 03-06.

## Recommended Sprint 7

Goal: bring the Collector, Logs, Metrics and Traces modules to the same editorial and teaching standard as Modules 01 and 02.

Suggested stories:

- As a learner, I can understand the Collector as the production control point for telemetry pipelines.
- As a learner, I can distinguish logs, metrics and traces by use case, cost and investigation value.
- As an instructor, I can teach Modules 03-06 with explicit production examples, architecture notes and common mistakes.
- As a course maintainer, I can audit each module using a consistent Course Bible review format.

Expected PR pattern:

1. Audit Module 03.
2. Upgrade Module 03.
3. Audit Module 04.
4. Upgrade Module 04.
5. Audit Module 05.
6. Upgrade Module 05.
7. Audit Module 06.
8. Upgrade Module 06.

## Recommended Sprint 8

Goal: align context propagation and instrumentation modules after the signal modules are stable.

Suggested scope:

- Audit and upgrade Module 07.
- Audit and upgrade Module 08.
- Ensure terminology around propagation, baggage, trace context, manual instrumentation and automatic instrumentation is consistent.

## Recommended Sprint 9

Goal: align platform modules for storage, visualization, dashboards and alerting.

Suggested scope:

- Audit and upgrade Module 09.
- Audit and upgrade Module 10.
- Audit and upgrade Module 11.
- Audit and upgrade Module 12.

## Recommended Sprint 10

Goal: complete the course narrative with best practices and production case study modules.

Suggested scope:

- Audit and upgrade Module 13.
- Audit and upgrade Module 14.
- Reconcile cross-module references.
- Prepare final release readiness review.
