# Lab index and execution order

This index lists the hands-on labs, their dependencies and the recommended order for workshop or self-paced execution.

## Shared lab environment

Most technical labs use the same local environment:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml up -d
```

This starts:

- OpenTelemetry Collector Contrib with OTLP HTTP and gRPC receivers;
- ClickHouse as the telemetry backend.

Useful ports:

| Port | Component | Purpose |
|---:|---|---|
| 4317 | Collector | OTLP gRPC receiver |
| 4318 | Collector | OTLP HTTP receiver |
| 8123 | ClickHouse | HTTP interface |
| 9000 | ClickHouse | Native client interface |
| 8888 | Collector | Collector metrics endpoint |

## Recommended execution order

| Order | Lab | Module | Requires shared environment | Primary skill |
|---:|---|---:|---|---|
| 1 | [Collector to ClickHouse pipeline](../labs/module-03-collector-clickhouse-pipeline.md) | 03 | Yes | Run the pipeline and verify spans in ClickHouse. |
| 2 | [Structured log ingestion with OTLP](../labs/module-04-structured-log-ingestion.md) | 04 | Yes | Send structured logs and query them by service or trace id. |
| 3 | [OTLP metrics payloads](../labs/module-05-metrics-otlp-payloads.md) | 05 | Yes | Send sum, gauge and histogram metrics. |
| 4 | [Trace and log correlation](../labs/module-06-trace-log-correlation.md) | 06 | Yes | Connect trace and log evidence through `TraceId`. |
| 5 | [ClickHouse observability query workbook](../labs/module-09-clickhouse-query-workbook.md) | 09 | Yes | Query traces, logs and metrics with SQL. |
| 6 | [Grafana checkout dashboard starter](../labs/module-10-grafana-dashboard-starter.md) | 10 | Optional Grafana | Import/review the starter dashboard. |
| 7 | [Checkout alert rule examples](../labs/module-12-alert-rule-examples.md) | 12 | No live runtime required | Review alert ownership, severity and annotations. |

## Payload files

| Payload | Purpose |
|---|---|
| `examples/otlp/sample-trace.json` | Sample checkout trace span with payment timeout context. |
| `examples/otlp/sample-log.json` | Structured log correlated to the sample trace. |
| `examples/otlp/sample-metrics.json` | Sum, gauge and histogram metric examples. |

## Example and configuration files

| File | Purpose |
|---|---|
| `examples/docker-compose/collector-clickhouse.yaml` | Shared Docker Compose lab environment. |
| `examples/collector/otel-collector-clickhouse.yaml` | Collector config with OTLP receiver and ClickHouse exporter. |
| `examples/clickhouse/observability-queries.sql` | Reusable investigation SQL workbook. |
| `examples/grafana/checkout-service-health-dashboard.json` | Starter Grafana dashboard JSON. |
| `examples/alerting/checkout-alert-rules.yaml` | Platform-neutral alert rule examples. |

## Fast path for instructors

Use this sequence when time is short:

1. Start the shared environment.
2. Run the Collector to ClickHouse lab until `SHOW TABLES` succeeds.
3. Send sample trace and log payloads.
4. Run the trace/log correlation lab.
5. Review the Grafana dashboard JSON without live import if Grafana is unavailable.
6. Review the alert rule examples as a group.

## Full self-paced path

Learners should complete labs in module order. After each lab, they should write a short answer to these questions:

- What telemetry signal did I create or inspect?
- Which component received, processed or stored it?
- Which fields made the telemetry useful?
- Which field would be risky in production?
- Which operational question does this lab help answer?

## Resetting the environment

Stop the shared environment:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml down
```

Stop and remove ClickHouse data volumes:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml down -v
```

Use `down -v` between cohorts if you want every group to start with empty tables.
