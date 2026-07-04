# Module 06 - Traces

## Course context

A distributed trace tells the story of one request as it moves through a system. In a modern application, one user action may call an API gateway, several services, a database, a message queue and an external provider. Without tracing, engineers often know that something is slow but not where the time was spent.

A trace is made of spans. Each span represents an operation, such as handling an HTTP request, executing a database query or calling another service. Spans have timing, status and attributes. Together they form a waterfall that shows causality and latency.

![Traces concept map](images/concept-map.svg)

## Spans and attributes

A good span should represent an operation that matters during investigation. Automatic instrumentation creates useful baseline spans for frameworks, HTTP clients and database drivers. Manual instrumentation adds business meaning, such as `checkout.authorize_payment` or `mes.execute_operation`.

Attributes add context to spans. They may include route, method, status code, database system, peer service, operation name or safe business dimensions. Attributes should help answer questions without exposing sensitive data.

Span status communicates whether an operation succeeded or failed. Errors should be attached to the span where the failure happened, not only to a later span that observed the consequence.

## Trace timelines

A trace timeline helps engineers identify the critical path. If a request took 842 ms, the trace should show which spans consumed that time. It should also show whether operations were sequential or parallel.

![Trace workflow](images/workflow.svg)

This makes traces especially useful for performance investigations. A team can see whether time was spent in the application, database, external provider or queue. When a request fails, the trace can identify the first failing span rather than only the final error response.

## Sampling

Tracing every request in a high-volume system can be expensive. Sampling controls how many traces are retained. Head sampling decides early, before the full trace is known. Tail sampling decides after observing the trace and can keep errors or slow requests more intelligently.

Sampling is a trade-off. Too much sampling loses evidence. Too little sampling may overload storage. The right strategy depends on traffic volume, incident patterns and compliance requirements.

## Correlation

Traces become more valuable when logs include trace ids and metrics can lead to example traces. Metrics identify that something changed. Traces show a representative journey. Logs explain detailed events inside the spans.

![Traces operations view](images/operations-view.svg)

## Common mistakes

Common mistakes include naming spans too generically, missing spans around important business operations, adding sensitive attributes and assuming automatic instrumentation is complete. Another mistake is keeping only successful traces and losing the failed requests that matter most.

## Exercise

Inspect a slow request trace. Identify the root span, the slowest span, the first failing span and the attributes that explain the request. Then write a short summary of where the latency was introduced and what evidence supports that conclusion.

## Quiz

1. What is a span?
2. Why are parent-child relationships useful in traces?
3. What is the critical path of a trace?
4. What is one advantage of tail sampling?
5. Why should logs include trace ids?

## Key takeaways

- Traces show the journey of one request.
- Spans represent operations with timing, status and attributes.
- Traces are strong evidence for latency and dependency investigations.
- Sampling must balance cost and diagnostic value.

## Official references

- OpenTelemetry Traces: https://opentelemetry.io/docs/concepts/signals/traces/
- OpenTelemetry Trace Specification: https://opentelemetry.io/docs/specs/otel/trace/
- W3C Trace Context: https://www.w3.org/TR/trace-context/
- Grafana Tempo Documentation: https://grafana.com/docs/tempo/latest/
