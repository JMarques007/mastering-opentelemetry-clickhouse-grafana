# Module 07 - Context Propagation

## Course context

Distributed tracing depends on context propagation. If a request enters Service A and then calls Service B and Service C, each service must know that it is handling the same logical request. Without propagated context, each service may create a separate trace and the journey becomes fragmented.

Context propagation is the mechanism that carries trace identity across process and network boundaries. It is what allows spans from different services to be assembled into one trace.

![Context propagation concept map](images/concept-map.svg)

## Trace context

The most important propagation concept is trace context. In HTTP systems, the W3C Trace Context standard defines headers such as `traceparent`. This header carries identifiers that allow downstream services to join the same trace.

OpenTelemetry uses propagators to inject context into outgoing requests and extract context from incoming requests. Instrumentation libraries often do this automatically for supported frameworks and clients.

Baggage is a related concept for propagating key-value pairs across services. It should be used carefully because values may travel widely. Baggage is not a place for secrets or large payloads.

## Where context is lost

Context can be lost at boundaries: HTTP calls, message queues, scheduled jobs, background workers, custom protocols, proxies or manually created threads. When context is lost, traces split. An engineer may see several partial traces instead of one complete request journey.

![Propagation workflow](images/workflow.svg)

Asynchronous systems need special attention. A message produced in one service and consumed later by another must carry context in message metadata if the trace should continue.

## Diagnosing propagation problems

Broken propagation often appears as missing parent spans, unexpected new root spans or logs that do not include trace ids. The symptom is usually not a runtime failure. The application works, but the observability story is incomplete.

![Context operations view](images/operations-view.svg)

To diagnose, compare the expected request path with the trace. Find the boundary where the trace splits. Then inspect whether the outgoing client injected context and whether the incoming service extracted it.

## Practical guidance

Prefer standard propagators. Avoid custom header formats unless required by a legacy system. Ensure that HTTP clients, message producers and background workers are instrumented. Include trace ids in structured logs so investigation can move between traces and logs.

Be careful with baggage. Only propagate values that are safe, small and useful across service boundaries.

## Exercise

Trace a request across three services. Identify the `traceparent` value on the first request and verify that downstream spans remain in the same trace. Then simulate a missing propagator and describe how the trace changes.

## Quiz

1. Why is context propagation required for distributed tracing?
2. What does the `traceparent` header carry?
3. Where can context commonly be lost?
4. Why should baggage be used carefully?
5. How can logs help diagnose propagation problems?

## Key takeaways

- Context propagation keeps spans connected across services.
- W3C Trace Context provides standard HTTP propagation headers.
- Async boundaries need explicit attention.
- Broken propagation produces fragmented observability.

## Official references

- W3C Trace Context: https://www.w3.org/TR/trace-context/
- OpenTelemetry Context Propagation: https://opentelemetry.io/docs/concepts/context-propagation/
- OpenTelemetry Baggage Specification: https://opentelemetry.io/docs/specs/otel/baggage/
- OpenTelemetry Propagators: https://opentelemetry.io/docs/languages/
