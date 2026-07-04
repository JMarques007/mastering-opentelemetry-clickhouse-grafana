# Lab - OpenTelemetry Collector to ClickHouse pipeline

## Goal

Run a local OpenTelemetry Collector pipeline that receives OTLP telemetry, exports it to ClickHouse and verifies that a trace span is queryable with SQL.

This lab supports Module 03 and connects the Collector concepts to the ClickHouse storage module later in the course.

## What you will run

The lab starts two containers:

- ClickHouse, used as the telemetry backend.
- OpenTelemetry Collector Contrib, configured with an OTLP receiver and ClickHouse exporter.

The Collector configuration lives in `examples/collector/otel-collector-clickhouse.yaml`. The Docker Compose file lives in `examples/docker-compose/collector-clickhouse.yaml`.

## Prerequisites

- Docker with Docker Compose support.
- Ports `4317`, `4318`, `8123`, `8888` and `9000` available locally.
- A shell with `curl`.

## Start the lab

From the repository root, run:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml up -d
```

Wait until both services are healthy, then inspect the running services:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml ps
```

## Send a sample trace

Send the sample OTLP JSON payload to the Collector HTTP receiver:

```bash
curl -sS -X POST http://localhost:4318/v1/traces \
  -H "Content-Type: application/json" \
  --data-binary @examples/otlp/sample-trace.json
```

The Collector also writes received telemetry to the debug exporter, so you can inspect Collector logs if needed:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml logs otel-collector
```

## Verify data in ClickHouse

List the tables created by the ClickHouse exporter:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml exec clickhouse \
  clickhouse-client -u otel --password otel --database otel \
  --query "SHOW TABLES"
```

Query the most recent spans:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml exec clickhouse \
  clickhouse-client -u otel --password otel --database otel \
  --query "SELECT TraceId, SpanName, ServiceName, Duration, StatusCode FROM otel_traces ORDER BY Timestamp DESC LIMIT 5"
```

You should see a span named `checkout.authorize_payment` for service `checkout-api`.

## Investigation questions

- Which Collector component receives the OTLP request?
- Which exporter writes to ClickHouse?
- Why does this lab use the Collector Contrib distribution?
- What would you change before using this configuration in production?
- Which ClickHouse columns would you use to find slow checkout spans?

## Production discussion

This lab is intentionally small. For production, review at least these changes:

- Pin image versions rather than using defaults.
- Tune ClickHouse retention, schema ownership and table engines.
- Tune exporter queue batching for throughput and durability.
- Add persistent queue storage if data loss across Collector restarts is unacceptable.
- Add authentication, TLS and network controls.
- Monitor Collector export failures, queue pressure and dropped telemetry.

## Cleanup

Stop and remove the containers:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml down
```

To remove ClickHouse data volumes created by the Compose project, run:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml down -v
```

## Official references

- [OpenTelemetry Collector configuration](https://opentelemetry.io/docs/collector/configuration/)
- [OTLP receiver reference](https://github.com/open-telemetry/opentelemetry-collector/blob/main/receiver/otlpreceiver/README.md)
- [ClickHouse exporter reference](https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/exporter/clickhouseexporter/README.md)
- [ClickHouse Docker installation](https://clickhouse.com/docs/install/docker)
