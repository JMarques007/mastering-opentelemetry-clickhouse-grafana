# Exercise - Structured log rewrite

## Goal

Turn vague log messages into structured, actionable production evidence.

## Scenario

A checkout service currently emits these messages:

```text
Error occurred
Payment failed
Timeout
```

These logs are hard to search, correlate and act on during an incident.

## Instructions

Rewrite each message as a structured log event. Include:

- `service.name`;
- operation name;
- severity;
- trace id and span id;
- safe customer or tenant identifier if appropriate;
- failure reason;
- dependency name when relevant.

Then explain which fields help find the related trace.

## Expected outcome

Learners should produce logs that describe what happened and preserve investigation context. A strong answer avoids secrets, raw payloads and personally sensitive values while still including enough fields to filter and correlate.

## Instructor notes

Challenge vague fields such as `message=failed`. Ask learners what they would search for at 03:00 during an incident. Also ask whether each field is safe to store and retain.
