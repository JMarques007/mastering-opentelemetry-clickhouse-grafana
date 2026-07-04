# Quiz - Review questions and answers

## Questions

1. What makes a log entry actionable?
2. Why is structured logging better than free text only?
3. Why can excessive warning logs be harmful?
4. Which fields help correlate logs with traces?
5. What types of data should not be logged?
6. Why should severity have an operational definition?
7. When should logs be used together with metrics or traces?

## Answers

1. It explains what happened, where it happened, why it matters and what context supports the next decision.
2. Structured fields can be filtered, aggregated and joined with other telemetry more reliably than prose-only messages.
3. Excessive warnings create alert fatigue and hide real degradation.
4. `trace_id`, `span_id`, `service.name`, environment and operation names help correlate logs with traces.
5. Secrets, raw credentials, personal data, payment data and unnecessary raw payloads should not be logged.
6. Severity should communicate response urgency consistently across teams.
7. Metrics show trends, traces show request flow and logs provide detailed event context.
