-- Common ClickHouse observability queries for OpenTelemetry data.
-- These queries assume tables created by the OpenTelemetry Collector ClickHouse exporter.
-- Adjust database, table names and time windows for your environment.

-- 1. Recent spans for one service.
SELECT
  Timestamp,
  TraceId,
  SpanId,
  SpanName,
  ServiceName,
  Duration,
  StatusCode,
  StatusMessage
FROM otel_traces
WHERE ServiceName = 'checkout-api'
  AND Timestamp >= NOW() - INTERVAL 1 HOUR
ORDER BY Timestamp DESC
LIMIT 100;

-- 2. Slow spans in the last hour.
SELECT
  Timestamp,
  TraceId,
  SpanName,
  ServiceName,
  Duration,
  StatusCode
FROM otel_traces
WHERE Timestamp >= NOW() - INTERVAL 1 HOUR
  AND Duration > 500 * 1000 * 1000
ORDER BY Duration DESC
LIMIT 50;

-- 3. Error spans by service.
SELECT
  ServiceName,
  count() AS error_spans
FROM otel_traces
WHERE Timestamp >= NOW() - INTERVAL 1 HOUR
  AND StatusCode = 'Error'
GROUP BY ServiceName
ORDER BY error_spans DESC;

-- 4. Trace detail by trace id.
WITH '4bf92f3577b34da6a3ce929d0e0e4736' AS trace_id
SELECT
  Timestamp,
  TraceId,
  SpanId,
  ParentSpanId,
  SpanName,
  ServiceName,
  Duration,
  StatusCode,
  StatusMessage,
  toString(SpanAttributes) AS span_attributes
FROM otel_traces
WHERE TraceId = trace_id
ORDER BY Timestamp ASC;

-- 5. Logs related to one trace id.
WITH '4bf92f3577b34da6a3ce929d0e0e4736' AS trace_id
SELECT
  Timestamp,
  TraceId,
  SpanId,
  ServiceName,
  SeverityText,
  Body,
  toString(LogAttributes) AS log_attributes
FROM otel_logs
WHERE TraceId = trace_id
ORDER BY Timestamp ASC;

-- 6. Error logs by service and severity.
SELECT
  ServiceName,
  SeverityText,
  count() AS log_count
FROM otel_logs
WHERE Timestamp >= NOW() - INTERVAL 1 HOUR
  AND SeverityText IN ('ERROR', 'FATAL')
GROUP BY ServiceName, SeverityText
ORDER BY log_count DESC;

-- 7. Checkout request counter values.
SELECT
  TimeUnix,
  MetricName,
  Attributes,
  Value
FROM otel_metrics_sum
WHERE MetricName = 'checkout.requests'
ORDER BY TimeUnix DESC
LIMIT 100;

-- 8. Current checkout queue depth.
SELECT
  TimeUnix,
  MetricName,
  Attributes,
  Value
FROM otel_metrics_gauge
WHERE MetricName = 'checkout.queue_depth'
ORDER BY TimeUnix DESC
LIMIT 100;

-- 9. Inspect checkout duration histogram rows.
SELECT *
FROM otel_metrics_histogram
WHERE MetricName = 'checkout.duration'
ORDER BY TimeUnix DESC
LIMIT 5
FORMAT Vertical;

-- 10. Top span names by volume.
SELECT
  ServiceName,
  SpanName,
  count() AS span_count
FROM otel_traces
WHERE Timestamp >= NOW() - INTERVAL 1 HOUR
GROUP BY ServiceName, SpanName
ORDER BY span_count DESC
LIMIT 25;
