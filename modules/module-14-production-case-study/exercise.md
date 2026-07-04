# Exercise - Incident team walkthrough

## Goal

Practice a complete evidence-based incident workflow using the course concepts.

## Scenario

Checkout is failing intermittently. An alert reports elevated error rate, dashboards show p95 latency increasing and traces suggest payment provider timeouts.

## Roles

Assign learners to these roles:

- incident lead;
- telemetry investigator;
- scribe.

## Instructions

Build a timeline with:

1. First symptom.
2. Metric evidence.
3. Trace evidence.
4. Log evidence.
5. Mitigation decision.
6. Validation after mitigation.
7. Three follow-up improvements.

## Expected outcome

A strong walkthrough starts with impact, uses metrics to understand shape, traces to identify the slow dependency and logs to confirm detailed failure. The team should propose improvements to dashboards, alerts, spans, logs or runbooks.

## Instructor notes

Stop the group if they jump to a fix without evidence. Ask what signal justifies the next action and how they will confirm improvement after mitigation.
