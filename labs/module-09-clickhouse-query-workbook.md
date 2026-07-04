# Lab - ClickHouse observability query workbook

## Goal

Use reusable SQL queries to investigate traces, logs and metrics stored in ClickHouse by the OpenTelemetry Collector ClickHouse exporter.

## Prerequisites

Start the shared lab environment:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml up -d
```

Send the sample trace, log and metrics payloads:

```bash
curl -sS -X POST http://localhost:4318/v1/traces \
  -H "Content-Type: application/json" \
  --data-binary @examples/otlp/sample-trace.json

curl -sS -X POST http://localhost:4318/v1/logs \
  -H "Content-Type: application/json" \
  --data-binary @examples/otlp/sample-log.json

curl -sS -X POST http://localhost:4318/v1/metrics \
  -H "Content-Type: application/json" \
  --data-binary @examples/otlp/sample-metrics.json
```

## Run the query workbook

Open `examples/clickhouse/observability-queries.sql` and run individual queries with `clickhouse-client`.

For example, run the trace detail query manually:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml exec clickhouse \
  clickhouse-client -u otel --password otel --database otel \
  --query "WITH '4bf92f3577b34da6a3ce929d0e0e4736' AS trace_id SELECT Timestamp, TraceId, SpanId, SpanName, ServiceName, Duration, StatusCode FROM otel_traces WHERE TraceId = trace_id ORDER BY Timestamp ASC"
```

## Investigation tasks

1. Find the slowest span in the sample trace.
2. Find the log record connected to the same trace id.
3. Query the checkout request count metric.
4. Query the checkout queue depth gauge.
5. Inspect the checkout duration histogram row.
6. Explain which query you would start with during a latency incident.

## Expected outcome

Learners should understand that ClickHouse is not only storage. It is also an investigation surface. SQL can connect symptoms, traces, logs and metric values when field names and correlation identifiers are consistent.

## Production discussion

Before reusing these queries in production, review:

- table names and schema version;
- time filters and primary-key-friendly predicates;
- service naming conventions;
- retention and TTL policies;
- query cost for dashboards;
- whether dashboards should use pre-aggregated or recording-rule-style data.

## Cleanup

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml down
```

Use `down -v` to remove ClickHouse data volumes.

## Official references

- [ClickHouse SQL reference](https://clickhouse.com/docs/sql-reference)
- [ClickHouse exporter reference](https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/exporter/clickhouseexporter/README.md)
- [OpenTelemetry Collector configuration](https://opentelemetry.io/docs/collector/configuration/)
