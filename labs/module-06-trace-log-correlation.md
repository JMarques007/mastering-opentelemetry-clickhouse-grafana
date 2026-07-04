# Lab - Trace and log correlation

## Goal

Correlate a slow or failed trace span with a structured log record using a shared trace id.

This lab connects Module 06 traces with Module 04 logs. It shows why trace ids in logs are not decoration: they are the bridge between request flow and detailed event evidence.

## Prerequisites

Start the shared Collector and ClickHouse environment:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml up -d
```

## Send correlated telemetry

Send the sample trace:

```bash
curl -sS -X POST http://localhost:4318/v1/traces \
  -H "Content-Type: application/json" \
  --data-binary @examples/otlp/sample-trace.json
```

Send the sample log that uses the same trace id and span id:

```bash
curl -sS -X POST http://localhost:4318/v1/logs \
  -H "Content-Type: application/json" \
  --data-binary @examples/otlp/sample-log.json
```

Both payloads use this trace id:

```text
4bf92f3577b34da6a3ce929d0e0e4736
```

## Find the trace span

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml exec clickhouse \
  clickhouse-client -u otel --password otel --database otel \
  --query "SELECT TraceId, SpanId, SpanName, ServiceName, Duration, StatusCode, StatusMessage FROM otel_traces WHERE TraceId = '4bf92f3577b34da6a3ce929d0e0e4736' ORDER BY Timestamp DESC LIMIT 10"
```

## Find the related log

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml exec clickhouse \
  clickhouse-client -u otel --password otel --database otel \
  --query "SELECT TraceId, SpanId, SeverityText, Body, LogAttributes['payment.provider'] AS provider, LogAttributes['failure.reason'] AS reason FROM otel_logs WHERE TraceId = '4bf92f3577b34da6a3ce929d0e0e4736' ORDER BY Timestamp DESC LIMIT 10"
```

## Write the investigation summary

Use both query results to write a concise summary:

```text
The trace shows ... The related log confirms ... The likely cause is ... The next action is ...
```

## Expected outcome

Learners should connect the `checkout.authorize_payment` span with the payment authorization log. The trace identifies where the request failed or slowed down. The log confirms the detailed reason: provider timeout.

## Discussion questions

- What would be harder if the log did not include `TraceId`?
- Which query would you run first during an incident?
- Which fields are useful for filtering without exposing sensitive data?
- How would this workflow change if context propagation were broken?
- What dashboard or alert should link into this investigation path?

## Cleanup

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml down
```

Use `down -v` if you want to remove ClickHouse data volumes.

## Official references

- [OpenTelemetry Traces](https://opentelemetry.io/docs/concepts/signals/traces/)
- [OpenTelemetry Logs specification](https://opentelemetry.io/docs/specs/otel/logs/)
- [W3C Trace Context](https://www.w3.org/TR/trace-context/)
- [ClickHouse exporter reference](https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/exporter/clickhouseexporter/README.md)
