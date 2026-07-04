# Lab - Structured log ingestion with OTLP

## Goal

Send a structured log record through the OpenTelemetry Collector and query it from ClickHouse.

This lab extends the Collector to ClickHouse environment introduced in Module 03. It focuses on log structure, severity and trace correlation.

## Prerequisites

Complete or start the shared Collector and ClickHouse lab environment:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml up -d
```

Confirm the Collector is listening on OTLP HTTP port `4318`:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml ps
```

## Send a structured log

Send the sample OTLP log payload:

```bash
curl -sS -X POST http://localhost:4318/v1/logs \
  -H "Content-Type: application/json" \
  --data-binary @examples/otlp/sample-log.json
```

The payload includes:

- `service.name=checkout-api`;
- `deployment.environment=local-lab`;
- severity `ERROR`;
- a safe tenant identifier;
- a payment provider attribute;
- the same `traceId` and `spanId` used by the sample trace payload.

## Query logs in ClickHouse

Find recent logs for the checkout service:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml exec clickhouse \
  clickhouse-client -u otel --password otel --database otel \
  --query "SELECT Timestamp, ServiceName, SeverityText, Body FROM otel_logs WHERE ServiceName = 'checkout-api' ORDER BY Timestamp DESC LIMIT 10"
```

Find the log by trace id:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml exec clickhouse \
  clickhouse-client -u otel --password otel --database otel \
  --query "SELECT Timestamp, TraceId, SpanId, SeverityText, Body, LogAttributes['failure.reason'] AS reason FROM otel_logs WHERE TraceId = '4bf92f3577b34da6a3ce929d0e0e4736' ORDER BY Timestamp DESC LIMIT 10"
```

You should see the payment timeout log and the structured `failure.reason` attribute.

## Investigation questions

- Which fields make this log actionable?
- Which fields support correlation with traces?
- Which fields are safe business context, and which fields would be risky in production?
- How would you filter all checkout payment failures for a single tenant?
- Which metric or trace would you inspect after seeing this log?

## Expected outcome

Learners should see that a structured log is more than a message string. It carries service identity, severity, correlation identifiers and safe operational context. The trace id provides a bridge from detailed log evidence back to the request journey.

## Cleanup

Stop the shared lab environment when finished:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml down
```

Use `down -v` if you also want to remove ClickHouse data volumes.

## Official references

- [OpenTelemetry Logs specification](https://opentelemetry.io/docs/specs/otel/logs/)
- [OpenTelemetry Collector configuration](https://opentelemetry.io/docs/collector/configuration/)
- [ClickHouse exporter reference](https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/exporter/clickhouseexporter/README.md)
