# Exercise - Slow trace investigation

## Goal

Use a trace to explain where latency was introduced and what evidence supports the conclusion.

## Scenario

A checkout request took 842 ms. The trace includes spans for the API gateway, checkout service, inventory service, payment provider and database query.

## Instructions

Identify:

1. The root span.
2. The slowest span.
3. The first failing span, if any.
4. The critical path.
5. The attributes that explain the request.
6. The related logs you would inspect next.

Then write a two-sentence incident summary.

## Expected outcome

Learners should distinguish symptom from cause. A strong answer identifies where time was spent, whether the slow span is on the critical path and which span attributes or logs confirm the likely cause.

## Instructor notes

If learners focus only on the final HTTP error, ask them to find the first span where the failure appears. Use this exercise to reinforce why trace ids in logs matter.
