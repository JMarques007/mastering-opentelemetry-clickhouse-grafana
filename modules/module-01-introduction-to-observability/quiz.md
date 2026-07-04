# Quiz - Review questions and answers

## Questions

1. What is the difference between monitoring and observability?
2. Which signal is best for showing long-term behavior over time?
3. Why are trace ids useful in logs?
4. What makes a log entry actionable?
5. Why is a trace useful when a request crosses multiple services?
6. Why should teams avoid collecting telemetry without a clear question?
7. How do logs, metrics and traces complement each other during an incident?

## Answers

1. Monitoring detects known symptoms, usually through predefined checks, dashboards and alerts. Observability helps teams investigate behavior that may not have been predicted before the incident began.
2. Metrics are best for long-term behavior because they store numerical measurements over time and are efficient for trends, thresholds, dashboards and alerts.
3. Trace ids connect log entries to a specific request path. They let engineers move from a trace span to the detailed logs for the same request without guessing by timestamp or service name alone.
4. A log entry is actionable when it explains what happened, includes useful context, and supports a next decision. Fields such as service name, environment, trace id, span id, error type, tenant or operation name make the entry easier to use.
5. A trace shows the request path across service boundaries. It helps identify which service, dependency or operation introduced latency or failure.
6. Telemetry without a clear question creates cost and noise. It can make incident response slower because engineers must inspect more data without knowing which evidence matters.
7. Metrics reveal that a symptom exists and when it started. Traces show where the affected request spent time or failed. Logs provide detailed context that can confirm the likely cause.

## Discussion prompts

- Which signal would you inspect first for a latency incident, and why?
- What fields should every production log include to support correlation?
- When can a dashboard create confusion instead of clarity?
