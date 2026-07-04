# Lab - Grafana checkout dashboard starter

## Goal

Import and review a starter Grafana dashboard for checkout service health using ClickHouse-backed OpenTelemetry data.

## Dashboard file

The starter dashboard lives at:

```text
examples/grafana/checkout-service-health-dashboard.json
```

It includes panels for:

- request volume;
- error spans;
- slow spans;
- recent slow or failed spans;
- recent error logs.

## Setup expectations

This dashboard assumes:

- Grafana has the official ClickHouse datasource plugin installed.
- The datasource points to the `otel` database used by the shared Collector to ClickHouse lab.
- Tables are named with the ClickHouse exporter defaults used in this repository: `otel_traces`, `otel_logs` and `otel_metrics_*`.

## Import steps

1. Open Grafana.
2. Go to Dashboards, then Import.
3. Upload `examples/grafana/checkout-service-health-dashboard.json`.
4. Select the ClickHouse datasource when prompted for `DS_CLICKHOUSE`.
5. Set the time range to the last hour.
6. Send the sample trace, log and metrics payloads if the dashboard is empty.

## Review questions

- Which panel should an operator inspect first during a checkout incident?
- Which panel links symptoms to traces?
- Which panel links traces to detailed log evidence?
- Which query would be too expensive at high volume?
- What would you add before using this dashboard in production?

## Production discussion

Before production use, review:

- datasource UID and plugin version;
- query macros supported by your Grafana ClickHouse plugin version;
- query cost and time range defaults;
- dashboard ownership;
- drilldown links from rows to trace and log views;
- whether panels should use pre-aggregated metric tables or raw trace scans.

## Official references

- [Grafana dashboards](https://grafana.com/docs/grafana/latest/dashboards/)
- [Grafana panels and visualizations](https://grafana.com/docs/grafana/latest/panels-visualizations/)
- [Grafana ClickHouse datasource](https://grafana.com/grafana/plugins/grafana-clickhouse-datasource/)
