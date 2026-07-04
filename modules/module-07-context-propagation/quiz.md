# Quiz - Review questions and answers

## Questions

1. Why is context propagation required for distributed tracing?
2. What does the `traceparent` header carry?
3. Where can context commonly be lost?
4. Why should baggage be used carefully?
5. How can logs help diagnose propagation problems?
6. What is a propagator responsible for?
7. Why are asynchronous boundaries special?

## Answers

1. It carries trace identity across service boundaries so spans can be assembled into one trace.
2. It carries identifiers and flags needed for downstream services to join the current trace.
3. Context can be lost at HTTP clients, queues, scheduled jobs, background workers, custom protocols and manual thread boundaries.
4. Baggage travels across services and can leak sensitive or high-volume data if misused.
5. Logs with trace ids reveal whether services are using the same trace or accidentally starting a new one.
6. A propagator injects context into outgoing carriers and extracts context from incoming carriers.
7. Async boundaries require context to be carried through message metadata because execution continues later and often in another process.
