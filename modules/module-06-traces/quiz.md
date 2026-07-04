# Quiz - Review questions and answers

## Questions

1. What is a span?
2. Why are parent-child relationships useful in traces?
3. What is the critical path of a trace?
4. What is one advantage of tail sampling?
5. Why should logs include trace ids?
6. What makes a span name useful?
7. Why is automatic instrumentation not always enough?

## Answers

1. A span represents one operation in a trace, including timing, status and attributes.
2. Parent-child relationships show causality and request flow across operations.
3. The critical path is the chain of spans that determines total request latency.
4. Tail sampling can keep traces after observing whether they are slow or failed.
5. Trace ids let engineers move from a trace to related log events without guessing.
6. A useful span name describes a meaningful operation, not only an implementation detail.
7. Automatic instrumentation may miss business operations that only application developers understand.
