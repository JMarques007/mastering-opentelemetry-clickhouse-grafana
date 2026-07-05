# Module 07 - Context Propagation

## Duration

Approximately 1 hour.

## Purpose

This module explains how request identity is propagated across services so traces, logs and spans remain connected across HTTP, messaging, asynchronous execution and operational boundaries.

## Learning outcomes

After completing this module, participants will be able to:

- explain why distributed tracing depends on context propagation;
- describe the role of W3C Trace Context and the `traceparent` header;
- explain how OpenTelemetry propagators inject and extract context;
- identify where propagation commonly breaks in production systems;
- diagnose fragmented traces across HTTP and queue boundaries;
- apply safe baggage usage rules;
- define production readiness checks for propagation.

## Main topics

- W3C Trace Context and `traceparent`.
- OpenTelemetry propagators.
- Baggage and safety concerns.
- HTTP, messaging, async and proxy boundaries.
- Propagation break diagnosis.
- Production validation patterns.

## Training assets

- [Module narrative](module.md)
- [Exercise - Propagation break analysis](exercise.md)
- [Lab - Context propagation across HTTP and messaging boundaries](../../labs/module-07-context-propagation-boundaries.md)
- [Quiz - Review questions and answers](quiz.md)
- [Official references](references.md)
- [Slide outline and speaker notes](slides/README.md)
- [Editable Mermaid propagation flow](../../diagrams/module-07-context-propagation-flow.mmd)
- [Concept map](images/concept-map.svg)
- [Propagation workflow](images/workflow.svg)
- [Lab practice](images/lab-practice.svg)
- [Operations view](images/operations-view.svg)

## Status

Draft upgraded with Course Bible teaching blocks, lab, editable diagram and slide outline.

## Next module

Module 08 - Instrumentation.