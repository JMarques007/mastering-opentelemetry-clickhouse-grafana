# Module 08 - Instrumentation

## Course context

Instrumentation is the work of making software emit useful telemetry. It is where observability becomes part of engineering design rather than an afterthought. Good instrumentation helps teams understand production behavior. Poor instrumentation creates noise, cost and confusion.

The most important question is not `what can we collect?` It is `what will we need to know when this fails in production?` Instrumentation should be designed around operational questions.

![Instrumentation concept map](images/concept-map.svg)

## Automatic and manual instrumentation

Automatic instrumentation provides a fast baseline. It can create spans for HTTP requests, database queries, messaging clients and framework operations. This is valuable because it gives broad coverage quickly.

Manual instrumentation adds the business meaning that automatic instrumentation cannot know. It can describe operations such as validating a manufacturing order, authorizing payment, calculating inventory availability or synchronizing with an ERP system.

A good strategy uses both. Automatic instrumentation provides the technical skeleton. Manual instrumentation adds the domain narrative.

## Choosing what to instrument

Instrument boundaries where decisions are made or latency can be introduced. Useful targets include inbound requests, outbound dependencies, database calls, queue operations, long-running jobs and critical business operations.

![Instrumentation workflow](images/workflow.svg)

Attributes should explain the operation safely. Use semantic conventions where possible. Avoid raw user input, secrets, full payloads and high-cardinality values in metrics. For traces, high-cardinality attributes may be acceptable if they are safe and useful, but retention and privacy still matter.

## Signal design

Not every question needs a trace. Not every detail belongs in a log. Not every value should become a metric. Choose the signal based on the question.

Use metrics for trends and alerts. Use traces for request flow and latency. Use logs for detailed events. Use correlation so these signals support each other.

## Production review

Instrumentation should be reviewed like code. Ask whether spans have meaningful names, whether attributes follow conventions, whether metrics have controlled labels and whether logs include correlation identifiers.

![Instrumentation operations view](images/operations-view.svg)

Review telemetry after deployment. A span that looked good in code may not be useful in a real incident. Dashboards and traces should be inspected with real production scenarios.

## Common mistakes

Common mistakes include relying only on automatic instrumentation, naming spans after implementation details, putting user ids into metric labels, logging sensitive data and creating telemetry that nobody owns.

## Exercise

Take one critical business operation and design its telemetry. Define one trace span, two attributes, one metric and one log event. Explain which production question each signal answers.

## Quiz

1. Why is automatic instrumentation not always enough?
2. What makes a span name useful?
3. Why are semantic conventions helpful?
4. What is one risk of high-cardinality labels?
5. Why should instrumentation be reviewed after deployment?

## Key takeaways

- Instrumentation should answer production questions.
- Automatic instrumentation gives coverage; manual instrumentation gives meaning.
- Attributes must be useful, safe and consistent.
- Telemetry design is an engineering responsibility.

## Official references

- OpenTelemetry Instrumentation: https://opentelemetry.io/docs/concepts/instrumentation/
- OpenTelemetry Semantic Conventions: https://opentelemetry.io/docs/specs/semconv/
- OpenTelemetry Language SDKs: https://opentelemetry.io/docs/languages/
- OpenTelemetry Traces: https://opentelemetry.io/docs/concepts/signals/traces/
