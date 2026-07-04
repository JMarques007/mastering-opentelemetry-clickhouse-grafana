# Exercise - Business operation telemetry design

## Goal

Design telemetry for a critical business operation and explain which question each signal answers.

## Scenario

Choose one operation, such as checkout payment authorization, manufacturing order validation or inventory reservation.

## Instructions

Define:

1. One manual trace span.
2. Two safe span attributes.
3. One metric with controlled labels.
4. One structured log event.
5. One field you intentionally do not collect.

For each signal, write the production question it answers.

## Expected outcome

A strong answer combines automatic and manual instrumentation. It uses semantic conventions where possible, avoids unsafe attributes and explains the operational value of every signal.

## Instructor notes

Push learners beyond technical spans. Ask what the business operation means during an incident and what context would help an operator decide the next step.
