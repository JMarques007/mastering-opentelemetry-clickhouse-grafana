# Lab - OTLP metrics payloads

## Goal

Send counter, gauge and histogram metrics through the OpenTelemetry Collector and inspect how ClickHouse stores each type.

This lab supports Module 05 by making metric instruments concrete without requiring a custom application.

## Prerequisites

Start the shared Collector and ClickHouse environment:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml up -d
```

## Send sample metrics

Send the sample OTLP metrics payload:

```bash
curl -sS -X POST http://localhost:4318/v1/metrics \
  -H "Content-Type: application/json" \
  --data-binary @examples/otlp/sample-metrics.json
```

The payload includes:

- `checkout.requests` as a monotonic sum, used like a counter;
- `checkout.queue_depth` as a gauge;
- `checkout.duration` as a histogram.

## Query the counter-like sum

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml exec clickhouse \
  clickhouse-client -u otel --password otel --database otel \
  --query "SELECT TimeUnix, MetricName, Attributes, Value FROM otel_metrics_sum WHERE MetricName = 'checkout.requests' ORDER BY TimeUnix DESC LIMIT 5"
```

## Query the gauge

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml exec clickhouse \
  clickhouse-client -u otel --password otel --database otel \
  --query "SELECT TimeUnix, MetricName, Attributes, Value FROM otel_metrics_gauge WHERE MetricName = 'checkout.queue_depth' ORDER BY TimeUnix DESC LIMIT 5"
```

## Inspect the histogram

Histogram storage has more fields than sum and gauge metrics. Use vertical output to inspect the stored row:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml exec clickhouse \
  clickhouse-client -u otel --password otel --database otel \
  --query "SELECT * FROM otel_metrics_histogram WHERE MetricName = 'checkout.duration' LIMIT 1 FORMAT Vertical"
```

## Investigation questions

- Which metric would you use for request rate?
- Which metric would you use for current queue depth?
- Which metric supports latency distribution and percentile-style thinking?
- Which labels are safe in this payload?
- Which labels would become dangerous if they contained user ids or request ids?

## Expected outcome

Learners should see that metric instrument type affects storage and query shape. Sums, gauges and histograms are not interchangeable: they answer different operational questions.

## Production discussion

Before production use, review:

- aggregation temporality and backend expectations;
- label cardinality;
- units and naming conventions;
- retention by metric type;
- dashboard query performance;
- alert thresholds and ownership.

## Cleanup

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml down
```

Use `down -v` to remove ClickHouse data volumes.

## Official references

- [OpenTelemetry Metrics specification](https://opentelemetry.io/docs/specs/otel/metrics/)
- [OpenTelemetry Collector configuration](https://opentelemetry.io/docs/collector/configuration/)
- [ClickHouse exporter reference](https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/exporter/clickhouseexporter/README.md)
