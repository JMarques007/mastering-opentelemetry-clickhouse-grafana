# Exercise - Telemetry design audit

## Goal

Audit a service's observability design for usefulness, cost, privacy and ownership.

## Instructions

For one service, identify:

1. One useful signal.
2. One noisy signal.
3. One cost risk.
4. One privacy risk.
5. One missing owner.
6. One concrete improvement for each finding.

## Expected outcome

A strong audit separates diagnostic value from volume. It preserves useful evidence, removes or reduces noise and assigns ownership to dashboards, alerts, instrumentation and Collector rules.

## Instructor notes

Ask learners to defend why each signal exists. If the only answer is `because we can collect it`, the signal probably needs redesign.
