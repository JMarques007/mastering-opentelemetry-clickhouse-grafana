# Module 09 - ClickHouse

## Course context

Observability data can be large, repetitive and highly analytical. Logs, metrics and traces often produce many rows that are queried by time range, service, environment, severity, route or trace id. ClickHouse is designed for this kind of workload: fast analytical queries over large datasets.

ClickHouse is a columnar database. Instead of storing rows as the primary physical unit, it stores data by columns. This is useful for observability because many queries scan a few columns across many records, such as timestamp, service name, duration and status.

![ClickHouse concept map](images/concept-map.svg)

## Why ClickHouse fits telemetry

Telemetry queries are usually analytical. Engineers ask how many errors happened per service, which route has the highest p95 latency, which traces exceeded a duration threshold or how log volume changed after a deployment. These queries benefit from compression, column pruning and efficient aggregation.

ClickHouse also supports SQL, which makes investigation approachable. Engineers can filter, group and aggregate telemetry without learning a proprietary query language for every task.

## Schema design

Good schema design matters. Time is usually central, so partitioning and ordering should support time-range queries. Service name, environment, trace id and severity are common filter fields. The right order key depends on the query patterns.

A poor schema can make dashboards slow even if the database is powerful. A good schema aligns with how engineers investigate incidents.

![ClickHouse telemetry workflow](images/workflow.svg)

## Ingestion and retention

Telemetry should be inserted efficiently, usually in batches. Very small inserts can create too many parts and harm performance. The ingestion path should be designed with buffering, batching and backpressure in mind.

Retention is also important. Raw logs may not need the same retention as aggregated metrics. Trace data for failed or slow requests may be more valuable than complete trace data for every successful request. ClickHouse TTL features can help enforce retention policies.

## Query examples

Useful query patterns include error count by service, p95 latency by route, slowest traces in a time window and log records related to a trace id. These queries are most valuable when telemetry uses consistent field names.

![ClickHouse operations view](images/operations-view.svg)

## Common mistakes

Common mistakes include inserting too many tiny batches, using order keys that do not match query patterns, retaining all raw telemetry forever and allowing uncontrolled high-cardinality fields to dominate storage.

## Exercise

Design a simple ClickHouse table for trace spans. Include timestamp, service name, trace id, span id, duration, status and operation name. Then write one SQL query to find the slowest spans in the last hour and one query to count errors by service.

## Quiz

1. Why is columnar storage useful for telemetry?
2. Why are small inserts a problem?
3. What does an order key influence?
4. Why should retention differ by signal or use case?
5. How does SQL help investigation workflows?

## Key takeaways

- ClickHouse is well suited to analytical telemetry queries.
- Schema design should follow investigation patterns.
- Batching and retention are operational requirements.
- SQL makes telemetry exploration flexible.

## Official references

- ClickHouse Documentation: https://clickhouse.com/docs
- ClickHouse MergeTree: https://clickhouse.com/docs/engines/table-engines/mergetree-family/mergetree
- ClickHouse TTL: https://clickhouse.com/docs/guides/developer/ttl
- OpenTelemetry Collector: https://opentelemetry.io/docs/collector/
