# Module 2 Quiz – OpenTelemetry Architecture

## Questions

1. What problem does OpenTelemetry primarily solve?
2. What is the role of the OpenTelemetry SDK?
3. What is OTLP used for?
4. Why is the OpenTelemetry Collector recommended in production?
5. What is the difference between telemetry generation and telemetry storage?
6. Name two common OpenTelemetry deployment models.
7. Why is `service.name` important?
8. What is a common risk of high-cardinality attributes?
9. Can a Collector export telemetry to more than one destination?
10. Which component is normally used to visualize telemetry stored in ClickHouse?

## Answers

1. It provides a vendor-neutral standard for collecting and transporting telemetry.
2. It runs inside or alongside the application and creates/exports telemetry.
3. OTLP transports logs, metrics and traces between OpenTelemetry components.
4. It centralizes processing, routing, filtering and exporting of telemetry.
5. Generation happens in applications; storage happens in backends such as ClickHouse, Prometheus, Tempo or Loki.
6. Agent, gateway, sidecar, DaemonSet or centralized Collector.
7. It identifies the service that produced telemetry and enables filtering and correlation.
8. It can increase storage cost, memory usage and query complexity.
9. Yes. The Collector can export to multiple destinations simultaneously.
10. Grafana.
