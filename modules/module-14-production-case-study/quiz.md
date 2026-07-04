# Quiz - Review questions and answers

## Questions

1. Why should investigation start with impact?
2. Which signal shows the shape of the incident?
3. Which signal identifies the slow dependency?
4. Why are trace ids useful when inspecting logs?
5. What should happen after service recovery?
6. Why is changing multiple things at once risky?
7. What makes a post-incident improvement concrete?

## Answers

1. Impact determines urgency, scope and communication needs.
2. Metrics show trend, volume, error rate and latency shape.
3. Traces identify request path, slow spans and failing dependencies.
4. Trace ids connect log events to the same request observed in the trace.
5. The team should document evidence, decisions, gaps and follow-up improvements.
6. Multiple simultaneous changes make it hard to know which action helped or harmed.
7. It has an owner, a specific change and a way to verify that the gap is closed.
