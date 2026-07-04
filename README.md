# Mastering OpenTelemetry, ClickHouse & Grafana

> Building Modern Observability Platforms

This repository contains the source material for an advanced training course on OpenTelemetry, ClickHouse, Grafana, and practical observability engineering.

The goal is to provide professional, reusable training material that can be used for internal enablement, customer workshops, and future book-style documentation.

## Course Structure

| Module | Title | Status |
|---:|---|---|
| 01 | Introduction to Observability | ✅ Draft available |
| 02 | OpenTelemetry Architecture | ✅ Draft available |
| 03 | OpenTelemetry Collector | ✅ Draft available |
| 04 | Logs | ✅ Draft available |
| 05 | Metrics | ✅ Draft available |
| 06 | Traces | ✅ Draft available |
| 07 | Context Propagation | ✅ Draft available |
| 08 | Instrumentation | ✅ Draft available |
| 09 | ClickHouse | ✅ Draft available |
| 10 | Grafana | ✅ Draft available |
| 11 | Dashboards | ✅ Draft available |
| 12 | Alerting | ✅ Draft available |
| 13 | Best Practices | ✅ Draft available |
| 14 | Production Case Study | ✅ Draft available |

## Start Here

- [Course Bible](docs/COURSE_BIBLE.md) - canonical editorial, technical and teaching standard.
- [Gold Standard Module](docs/GOLD_STANDARD_MODULE.md) - practical model for high-quality module writing.
- [Course Checklist](docs/COURSE_CHECKLIST.md) - checklist before modules are considered ready for review or release.
- [Bad Writing Examples](docs/BAD_WRITING_EXAMPLES.md) - weak writing patterns to avoid.
- [Workshop delivery plan](docs/workshop-delivery-plan.md) - one-day, two-day and self-paced delivery paths.
- [Lab index](docs/lab-index.md) - lab execution order, shared environment and payload inventory.
- [Local lab troubleshooting](docs/local-lab-troubleshooting.md) - common Docker, Collector and ClickHouse fixes.
- [Instructor notes](instructor-notes.md) - timing, demos, prompts and facilitation guidance.
- [Module quality review checklist](docs/module-quality-review-checklist.md) - criteria for reviewing modules before delivery.
- [Release readiness checklist](docs/release-readiness-checklist.md) - final sign-off before teaching or tagging a release.

## Project Documents

- [Roadmap](ROADMAP.md) - course delivery phases and content plan.
- [Style Guide](STYLE_GUIDE.md) - writing, lab, diagram and slide conventions.
- [Module Template](modules/TEMPLATE.md) - reusable structure for each course module.
- [Website Home](website/index.md) - initial GitHub Pages landing page content.
- [Codex backlog](codex/tasks.md) - immediate execution backlog for Codex work.

## Hands-On Labs

The main lab environment uses Docker Compose to run OpenTelemetry Collector Contrib and ClickHouse:

```bash
docker compose -f examples/docker-compose/collector-clickhouse.yaml up -d
```

Recommended lab sequence:

1. [Collector to ClickHouse pipeline](labs/module-03-collector-clickhouse-pipeline.md)
2. [Structured log ingestion with OTLP](labs/module-04-structured-log-ingestion.md)
3. [OTLP metrics payloads](labs/module-05-metrics-otlp-payloads.md)
4. [Trace and log correlation](labs/module-06-trace-log-correlation.md)
5. [ClickHouse observability query workbook](labs/module-09-clickhouse-query-workbook.md)
6. [Grafana checkout dashboard starter](labs/module-10-grafana-dashboard-starter.md)
7. [Checkout alert rule examples](labs/module-12-alert-rule-examples.md)

## Reusable Examples

- [Collector configuration](examples/collector/otel-collector-clickhouse.yaml)
- [Docker Compose lab environment](examples/docker-compose/collector-clickhouse.yaml)
- [OTLP sample payloads](examples/otlp/)
- [ClickHouse query workbook](examples/clickhouse/observability-queries.sql)
- [Grafana checkout dashboard JSON](examples/grafana/checkout-service-health-dashboard.json)
- [Checkout alert rule examples](examples/alerting/checkout-alert-rules.yaml)

## Repository Layout

```text
modules/      Course modules, one folder per module
diagrams/     Shared editable and exported diagrams
slides/       Shared slide templates and global presentations
examples/     Reusable configuration and code examples
labs/         Hands-on labs and exercises
assets/       Branding, icons, images and templates
docs/         Project documentation, roadmap and style guides
website/      Future GitHub Pages or MkDocs site
scripts/      Automation scripts
```

## Working Principles

- Markdown is the primary source for documentation.
- Course content follows the [Course Bible](docs/COURSE_BIBLE.md).
- Slides should be visual, concise, and supported by speaker notes where possible.
- Diagrams should be editable whenever possible.
- Images are used sparingly and only when they add value.
- The course explains not only how components work, but why they exist.

## Current Focus

The current priority is aligning the existing draft modules with the Course Bible and Gold Standard Module guidance, then validating each module against the Course Checklist before marking it ready for review.
