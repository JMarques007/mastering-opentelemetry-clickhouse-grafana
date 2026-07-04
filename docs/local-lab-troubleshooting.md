# Local lab troubleshooting guide

This guide helps instructors and learners diagnose common problems in the local Collector, ClickHouse and Grafana lab workflow.

## Quick health check

From the repository root, run:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml ps
```

Expected result:

- `clickhouse` is running and healthy;
- `otel-collector` is running;
- ports `4317`, `4318`, `8123`, `8888` and `9000` are mapped.

Check Collector logs:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml logs otel-collector
```

Check ClickHouse health:

```bash
curl -sS http://localhost:8123/ping
```

Expected output:

```text
Ok.
```

## Common problems

| Symptom | Likely cause | Fix |
|---|---|---|
| Compose fails because a port is already allocated | Another local service is using a lab port | Stop the conflicting service or change the port mapping in the Compose file. |
| Collector exits immediately | Invalid Collector configuration | Run `docker compose ... logs otel-collector` and inspect the config error. |
| ClickHouse never becomes healthy | Image download, startup delay or local resource pressure | Wait longer, inspect ClickHouse logs and confirm Docker has enough memory. |
| `curl` to `4318` fails | Collector is not running or OTLP HTTP receiver is unavailable | Check Collector logs and confirm `0.0.0.0:4318` is configured. |
| Payload POST returns an error | Invalid OTLP JSON payload or wrong endpoint | Use `/v1/traces`, `/v1/logs` or `/v1/metrics` for the matching payload type. |
| `SHOW TABLES` returns no telemetry tables | No payload has been exported yet or exporter failed | Send a sample payload, then inspect Collector logs for ClickHouse exporter errors. |
| Queries return no rows | Time filters miss static sample timestamps | Use trace-id queries or remove recent-time filters when using fixed sample payloads. |
| Grafana dashboard is empty | Datasource UID, time range or query macro mismatch | Select the correct datasource, widen time range and test panel SQL directly in Explore. |

## Port conflict diagnosis

On Windows PowerShell:

```powershell
Get-NetTCPConnection -LocalPort 4317,4318,8123,8888,9000 -ErrorAction SilentlyContinue |
  Select-Object LocalAddress,LocalPort,State,OwningProcess
```

Then inspect the owning process:

```powershell
Get-Process -Id <PID>
```

On Linux or macOS:

```bash
lsof -i :4318
```

## Collector diagnostics

View Collector logs:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml logs -f otel-collector
```

Look for:

- receiver startup messages for OTLP gRPC and HTTP;
- ClickHouse exporter connection errors;
- queue or retry warnings;
- invalid configuration messages.

Validate that the OTLP HTTP receiver accepts a trace payload:

```bash
curl -v -X POST http://localhost:4318/v1/traces \
  -H "Content-Type: application/json" \
  --data-binary @examples/otlp/sample-trace.json
```

## ClickHouse diagnostics

Open a ClickHouse shell:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml exec clickhouse \
  clickhouse-client -u otel --password otel --database otel
```

Useful checks:

```sql
SHOW DATABASES;
SHOW TABLES;
SELECT count() FROM otel_traces;
SELECT count() FROM otel_logs;
SELECT count() FROM otel_metrics_sum;
```

If tables exist but counts are zero, send the sample payloads again and check Collector logs.

## Static sample timestamp note

Some sample payloads use fixed timestamps so labs are deterministic. If a query uses `NOW() - INTERVAL 1 HOUR`, it may return no rows depending on the current date.

For teaching, prefer these checks:

```sql
SELECT * FROM otel_traces ORDER BY Timestamp DESC LIMIT 5;
SELECT * FROM otel_logs ORDER BY Timestamp DESC LIMIT 5;
```

Or query by the sample trace id:

```sql
SELECT *
FROM otel_traces
WHERE TraceId = '4bf92f3577b34da6a3ce929d0e0e4736';
```

## Reset procedure

Soft reset:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml down
```

Full reset, including ClickHouse data:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml down -v
```

Start again:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml up -d
```

## Instructor fallback plan

If the live environment fails during a workshop:

1. Show the relevant payload file.
2. Explain which Collector pipeline receives it.
3. Show the ClickHouse query from the lab.
4. Use the expected outcome section to continue discussion.
5. Return to live troubleshooting during a break.

The learning goal is investigation reasoning, not Docker heroics.
