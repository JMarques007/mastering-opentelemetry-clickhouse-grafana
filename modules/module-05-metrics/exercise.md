# Exercise - Checkout metric design

## Goal

Design useful, low-risk metrics for a checkout service.

## Instructions

Create three metrics:

1. One counter for request or error volume.
2. One histogram for latency.
3. One gauge for current state, such as queue depth or active sessions.

For each metric, define:

- metric name;
- instrument type;
- labels;
- unit;
- dashboard question;
- alerting relevance;
- one unsafe label you intentionally rejected.

## Expected outcome

A strong solution uses labels such as service, route template, status code and environment. It rejects labels such as user id, request id, session id and raw URL because they create high cardinality or privacy risk.

## Instructor notes

Ask learners why p95 or p99 latency may be more useful than average latency. If a metric does not support a concrete question, ask whether it should exist.
