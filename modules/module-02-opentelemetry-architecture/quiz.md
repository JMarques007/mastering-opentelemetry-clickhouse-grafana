# Quiz - Review questions and answers

## Questions

1. Why does OpenTelemetry separate telemetry generation from storage and visualization?
2. What role does the SDK play inside an application?
3. What is OTLP used for?
4. Why is the Collector strongly recommended in production?
5. What problem can inconsistent service names create?
6. When might a gateway Collector be preferable to direct application export?
7. Why should teams avoid high-cardinality metric attributes?

## Answers

1. Separation keeps applications independent from specific backends. Teams can change storage, routing, processing and visualization choices without rewriting instrumentation in every service.
2. The SDK runs in the application process. It creates spans, records metrics, attaches resource and span attributes, applies sampling or aggregation behavior and exports telemetry.
3. OTLP is the OpenTelemetry Protocol. It transports logs, metrics and traces between instrumented applications, Collectors and compatible telemetry systems.
4. The Collector centralizes processing concerns such as batching, filtering, enrichment, routing, retries and exporting to multiple destinations. This reduces application coupling and makes production changes safer.
5. Inconsistent service names make correlation, filtering, dashboards and alerts unreliable. The same service may appear as multiple services, or unrelated services may be accidentally grouped together.
6. A gateway Collector is useful when teams need centralized policy, routing, batching, authentication, fan-out to multiple backends or a stable ingestion point between workloads and storage.
7. High-cardinality attributes can create too many unique time series, increasing storage cost and query load. They can also make dashboards and alerts less reliable.

## Discussion prompts

- Which processing decisions belong in the application SDK, and which belong in the Collector?
- What would change if the organization replaced ClickHouse with another backend?
- How would you troubleshoot missing telemetry in this architecture?
