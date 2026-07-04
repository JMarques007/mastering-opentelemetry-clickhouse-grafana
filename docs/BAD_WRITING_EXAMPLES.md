# Bad Writing Examples

This document helps contributors and Codex avoid weak course writing. Each example shows a weak version, a better version and, when useful, an excellent version.

## Principle 1: Do Not Start With Definitions When a Problem Is Better

### Weak

> Logs are timestamped records of events.

This is technically correct, but it is not engaging. It does not explain why logs matter.

### Better

> Logs record individual events that happen inside a system. They are useful when an engineer needs to inspect the details of a failure, such as an exception message, a timeout or a rejected business operation.

### Excellent

> Imagine receiving a call during an incident: "The system is slow." That sentence is not enough to act on. Which operation is slow? Which service handled it? Did the application throw an exception? Was a request rejected? Logs are often the first detailed evidence engineers inspect when they need to move from a vague symptom to a concrete event.

## Principle 2: Explain Why OpenTelemetry Exists

### Weak

> OpenTelemetry is a vendor-neutral observability framework.

This is a definition, not an explanation.

### Better

> OpenTelemetry provides a vendor-neutral way to generate and export telemetry such as logs, metrics and traces.

### Excellent

> Before OpenTelemetry, many organizations combined multiple instrumentation approaches. Traces might be produced using one library, metrics using another and logs using custom conventions. This made observability difficult to standardize and made backend changes expensive. OpenTelemetry changed this by defining a common model for generating, describing and transporting telemetry.

## Principle 3: Avoid Empty Best Practices

### Weak

> Use good service names.

### Better

> Use consistent service names so telemetry can be filtered and correlated across dashboards, traces and logs.

### Excellent

> Define `service.name` before instrumenting applications. It becomes one of the most important dimensions in observability because it is used in dashboards, trace searches, logs correlation and alert routing. Inconsistent service names create confusion during incidents and make cross-service analysis harder.

## Principle 4: Do Not Write Bullet Lists Without Teaching

### Weak

> The Collector has receivers, processors and exporters.

### Better

> The Collector receives telemetry, optionally processes it and exports it to one or more destinations.

### Excellent

> The Collector is best understood as a telemetry pipeline. Receivers are the entry points: they accept telemetry from applications or other systems. Processors modify or organize telemetry before it leaves the Collector. Exporters send the result to backends such as ClickHouse, Prometheus, Tempo or another Collector. This separation allows teams to change routing and processing without changing application code.

## Principle 5: Avoid Decorative Examples

### Weak

> For example, an application can send traces.

### Better

> For example, an API request can generate a trace containing spans for authentication, business logic and database access.

### Excellent

> Consider a login request. The root span represents the HTTP request. Child spans may represent credential validation, user lookup, permission loading and token generation. If the login is slow, the trace shows where time was spent instead of forcing engineers to guess from logs alone.

## Principle 6: Avoid Overclaiming

### Weak

> OpenTelemetry solves all observability problems.

### Better

> OpenTelemetry standardizes telemetry generation and transport, but teams still need to design useful dashboards, alerts, retention policies and investigation workflows.

### Excellent

> OpenTelemetry does not make a system observable by itself. It provides the standard foundation for producing and transporting telemetry. Teams still need to decide what to collect, which attributes matter, how long to retain data, how to design dashboards, and which alerts are actionable.

## Principle 7: Do Not Confuse Documentation With Training

### Weak

> OTLP supports gRPC and HTTP.

### Better

> OTLP supports gRPC and HTTP, allowing applications and Collectors to exchange telemetry in a standardized way.

### Excellent

> OTLP exists so telemetry can move between OpenTelemetry components without being tied to one backend. It supports gRPC and HTTP, which gives teams flexibility across different runtime environments, proxies and network policies. In production, the protocol choice may depend on platform conventions, load balancing, security requirements and operational simplicity.

## Principle 8: Make Common Mistakes Concrete

### Weak

> Avoid high cardinality.

### Better

> Avoid using highly unique values as metric labels because they increase series cardinality.

### Excellent

> A common mistake is adding user id, session id or order id as metric labels. This may look useful during development, but in production it can create millions of unique time series. Use traces and logs for highly specific investigation details, and keep metrics focused on dimensions that aggregate well.

## Principle 9: Use Transitions

### Weak

> Metrics are numerical measurements. Traces show requests.

### Better

> Metrics show trends over time, while traces explain the path of individual requests.

### Excellent

> Metrics can tell us that latency increased. They usually cannot explain why one request was slow. That is where traces become useful: they show the path of a single request across services and operations, allowing engineers to locate the slow or failing span.

## Principle 10: Every Section Should Earn Its Place

Before adding a paragraph, ask:

- Does this help the learner understand the problem?
- Does this explain a decision or trade-off?
- Does this provide practical value?
- Does this prepare the learner for a lab or investigation?

If the answer is no, rewrite or remove it.

## Final Rule

Weak writing defines. Strong writing teaches. Excellent writing changes how the learner thinks.
