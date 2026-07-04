# Release readiness checklist

Use this checklist before delivering the course to a learner group or publishing a release tag.

## Content readiness

- All required modules are present and linked from the root README.
- Module READMEs link to narratives, exercises, labs, quizzes and references.
- Module narratives are reviewed for clarity, technical accuracy and teaching flow.
- Quizzes include answers.
- Exercises and labs include expected outcomes.
- Official references are current enough for delivery and relevant to the module.
- No placeholder TODO sections remain in learner-facing material.

## Lab readiness

- The shared Docker Compose environment starts from a clean checkout.
- ClickHouse becomes healthy.
- The Collector starts with no configuration errors.
- Sample trace, log and metric payloads can be posted to OTLP HTTP.
- ClickHouse tables are created by the exporter.
- Query workbook examples return rows after sample payloads are sent.
- Troubleshooting guide covers the most likely local failures.
- Instructors have a fallback plan if Docker or Grafana fails during delivery.

## Visual readiness

- SVG diagrams render without text overlap.
- Diagram titles and subtitles are readable.
- Module READMEs link to the correct image files.
- Dashboard starter JSON imports or can be reviewed as a source artifact.
- Slides outlines reference existing module assets.

## Delivery readiness

- Workshop delivery plan matches the planned session duration.
- Instructor notes are reviewed before delivery.
- Lab index is used to choose the execution sequence.
- Learner checkpoints are selected for the workshop format.
- Discussion prompts are prepared for modules that may not be run hands-on.
- Time is reserved for troubleshooting and wrap-up.

## Operational readiness

- Alert examples include owner, severity, signal and runbook context.
- Dashboard examples distinguish symptoms, traces and logs.
- ClickHouse examples mention query cost and time filters.
- Telemetry privacy, cardinality and cost risks are covered.
- Production caveats are marked clearly so lab shortcuts are not mistaken for production defaults.

## Release notes template

Use this format for a release or delivery package:

```text
Release:
Date:
Audience:
Delivery format:

Included modules:
- ...

Included labs:
- ...

Known limitations:
- ...

Instructor preparation:
- ...

Post-delivery follow-up:
- ...
```

## Final sign-off

| Area | Owner | Status | Notes |
|---|---|---|---|
| Content review |  |  |  |
| Technical review |  |  |  |
| Lab verification |  |  |  |
| Visual review |  |  |  |
| Delivery plan |  |  |  |
| Release notes |  |  |  |
