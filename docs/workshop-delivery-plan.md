# Workshop delivery plan

This plan turns the course material into practical delivery paths for internal enablement, customer workshops and self-paced study.

## Delivery goals

By the end of a workshop, learners should be able to:

- explain how logs, metrics and traces work together during investigation;
- describe an OpenTelemetry architecture from application instrumentation to storage and visualization;
- run the shared Collector to ClickHouse lab environment;
- send sample OTLP traces, logs and metrics;
- query ClickHouse for common observability investigations;
- explain how Grafana dashboards and alert rules support operational response;
- identify cost, privacy, ownership and governance risks in telemetry design.

## Recommended formats

| Format | Audience | Modules | Labs | Notes |
|---|---|---|---|
| Executive briefing | Engineering leaders, architects | 01, 02, 13, 14 | Discussion only | Focus on operating model, trade-offs and investment decisions. |
| One-day technical workshop | Engineers, SREs, platform teams | 01-06, 09, 10, 12, 14 | Core Collector, logs, metrics, trace/log correlation | Skip some deep theory and keep the flow incident-oriented. |
| Two-day technical workshop | Engineers, SREs, platform teams | 01-14 | All Sprint 4 labs | Best format for hands-on platform enablement. |
| Self-paced path | Individual learners | 01-14 | All labs | Add checkpoints after each phase. |

## One-day workshop agenda

| Time | Segment | Modules | Activity |
|---|---|---|---|
| 09:00 | Opening scenario and observability model | 01 | Symptom-to-evidence discussion. |
| 09:45 | OpenTelemetry architecture | 02 | Draw generate, transport, process, store and visualize responsibilities. |
| 10:45 | Break |  |  |
| 11:00 | Collector pipeline | 03 | Run the Collector to ClickHouse lab. |
| 12:15 | Lunch |  |  |
| 13:00 | Logs, metrics and traces | 04, 05, 06 | Send OTLP log, metric and trace payloads. |
| 14:30 | Correlation and investigation | 06, 07 | Trace/log correlation lab and group summary. |
| 15:15 | Break |  |  |
| 15:30 | ClickHouse and Grafana workflows | 09, 10 | Query workbook and dashboard starter review. |
| 16:30 | Alerting and response | 12, 14 | Review alert rules and build incident timeline. |
| 17:15 | Wrap-up | 13, 14 | Governance, ownership and next steps. |

## Two-day workshop agenda

### Day 1 - Signals and pipeline

| Time | Segment | Modules | Activity |
|---|---|---|---|
| 09:00 | Observability foundations | 01 | Investigation summary exercise. |
| 10:00 | OpenTelemetry architecture | 02 | Architecture mapping lab. |
| 11:00 | Collector pipeline | 03 | Collector to ClickHouse lab. |
| 13:00 | Logs | 04 | Structured log ingestion lab. |
| 14:15 | Metrics | 05 | OTLP metrics payload lab. |
| 15:30 | Traces and correlation | 06, 07 | Trace/log correlation lab. |
| 16:45 | Day 1 review | 01-07 | Learners explain the full telemetry path. |

### Day 2 - Storage, visualization and operations

| Time | Segment | Modules | Activity |
|---|---|---|---|
| 09:00 | Instrumentation design | 08 | Business operation telemetry design. |
| 10:00 | ClickHouse investigation | 09 | SQL query workbook. |
| 11:15 | Grafana and dashboards | 10, 11 | Dashboard starter import and review. |
| 13:15 | Alerting | 12 | Checkout alert rule examples. |
| 14:15 | Best practices | 13 | Telemetry design audit. |
| 15:15 | Production case study | 14 | Incident team walkthrough. |
| 16:30 | Workshop close | 13, 14 | Owner checklist and action plan. |

## Instructor preparation checklist

- Clone the repository or confirm learners can access it.
- Confirm Docker and Docker Compose are available.
- Pre-pull ClickHouse and OpenTelemetry Collector Contrib images if network access may be slow.
- Confirm ports `4317`, `4318`, `8123`, `8888` and `9000` are free.
- Run the Collector to ClickHouse lab once before delivery.
- Confirm sample OTLP trace, log and metric payloads ingest successfully.
- Confirm ClickHouse query examples return rows after sample payloads are sent.
- Prepare a Grafana instance if the dashboard import will be demonstrated live.
- Decide whether learners work individually, in pairs or as incident-response groups.

## Learner checkpoints

Use these checkpoints to confirm progress:

1. Learner can explain the difference between monitoring and observability.
2. Learner can identify SDK, OTLP, Collector, backend and Grafana responsibilities.
3. Learner can run the shared Docker Compose lab environment.
4. Learner can send trace, log and metric payloads to the Collector.
5. Learner can query ClickHouse by service name and trace id.
6. Learner can connect a dashboard symptom to a trace and log investigation.
7. Learner can review an alert rule for ownership, severity and actionability.
8. Learner can propose one telemetry quality, cost or governance improvement.

## Delivery risks and mitigations

| Risk | Mitigation |
|---|---|
| Docker images fail to download during workshop | Pre-pull images and provide a fallback walkthrough. |
| Learners focus on tool syntax instead of investigation | Keep asking which production question each signal answers. |
| ClickHouse schema differs from lab assumptions | Explain table names and point learners to exporter documentation. |
| Grafana datasource plugin is unavailable | Review dashboard JSON and queries without live import. |
| Time runs short | Prioritize Collector lab, trace/log correlation and incident case study. |

## Follow-up assignments

After the workshop, learners should apply the course to one real service:

- define three operational questions;
- review existing logs, metrics and traces;
- identify one missing correlation field;
- create or improve one dashboard;
- create or improve one alert rule;
- document one ownership or governance gap.
