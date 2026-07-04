# Exercise - Investigation summary

## Goal

Practice turning separate telemetry signals into a short, evidence-based incident summary.

This exercise uses the module diagrams rather than a running lab environment, so it works well in instructor-led workshops, asynchronous study and early course delivery before learners have deployed the full observability stack.

## Scenario

A checkout endpoint started responding slowly after a routine deployment. Customer support reports that only a subset of payment attempts are affected. The team has access to three kinds of telemetry evidence:

- a latency metric showing a sudden increase in the checkout request duration;
- a distributed trace where the payment provider call is the slowest span;
- a structured log entry containing the same trace id and a timeout message from the payment adapter.

## Instructions

Use the telemetry correlation image in this module and write a short investigation summary. Your summary should identify:

1. The first visible symptom.
2. The metric that confirms the symptom.
3. The trace span that narrows the investigation.
4. The log message or log fields that confirm the likely cause.
5. The next operational action you would take.

## Expected output

Write one paragraph in this format:

```text
The first visible symptom is ... The metric that confirms it is ... The trace narrows the issue to ... The related log confirms ... The next action is ...
```

## Instructor notes

A strong answer should avoid jumping directly from symptom to fix. Learners should explain how each signal changes the investigation:

- Metrics show that the symptom is real and time-bound.
- Traces identify where time was spent during a representative request.
- Logs provide detailed context, such as timeout errors, request attributes and exception messages.
- Shared trace ids connect the evidence without relying on manual guesswork.

## Example answer

The first visible symptom is increased checkout latency after the deployment. The metric that confirms it is the checkout request duration, especially if the p95 or p99 latency rose at the same time. The trace narrows the issue to the payment provider span because it dominates the request duration. The related log confirms a timeout in the payment adapter and includes the same trace id, which connects the log entry to the slow trace. The next action is to verify provider health, inspect recent payment adapter changes, and mitigate by rolling back, disabling the affected route or increasing resilience if the dependency is degraded.
