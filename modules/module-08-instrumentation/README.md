# Module 08 - Instrumentation

## Duration

Approximately 1 hour.

## Purpose

This module teaches instrumentation as the engineering practice of designing useful telemetry around production questions. It explains how to combine automatic and manual instrumentation, where to add business spans, how to choose safe attributes, and how to review telemetry quality after deployment.

## Learning outcomes

After this module, learners should be able to:

- distinguish automatic instrumentation from manual instrumentation;
- identify business and dependency boundaries that deserve custom spans;
- choose metrics, traces and logs based on operational questions;
- design safe attributes and controlled metric labels;
- avoid high-cardinality and sensitive telemetry;
- review deployed instrumentation for usefulness, cost, privacy and ownership.

## Main topics

- Automatic and manual instrumentation.
- Business-oriented span design.
- Choosing spans, metrics and logs.
- Safe and consistent attributes.
- Semantic conventions and local naming conventions.
- Cardinality, privacy and telemetry cost.
- Instrumentation review after deployment.

## Training assets

- [Module narrative](module.md)
- [Exercise - Business operation telemetry design](exercise.md)
- [Lab - Instrumentation design and review](../../labs/module-08-instrumentation-design-review.md)
- [Slide outline with speaker notes](../../slides/module-08-instrumentation-outline.md)
- [Editable Mermaid diagram - instrumentation design flow](../../diagrams/module-08-instrumentation-design-flow.mmd)
- [Quiz - Review questions and answers](quiz.md)
- [Official references](references.md)
- [Concept map](images/concept-map.svg)
- [Instrumentation workflow](images/workflow.svg)
- [Lab practice](images/lab-practice.svg)
- [Operations view](images/operations-view.svg)

## Suggested delivery flow

1. Start with a production symptom: a slow or failing business operation.
2. Explain why automatic instrumentation is useful but incomplete.
3. Introduce manual spans at business and dependency boundaries.
4. Discuss safe attributes, semantic conventions and cardinality.
5. Walk through the signal selection table: metrics for trends, traces for flow, logs for event evidence.
6. Use the lab to design and review checkout authorization telemetry.
7. Close with a production review checklist.

## Status

Aligned to Course Bible / Gold Standard draft standard.

## Next module

Module 09 - ClickHouse.
