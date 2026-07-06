# Module 10 - Grafana

## Overview

Module 09 showed how ClickHouse can store and query telemetry efficiently. This module focuses on Grafana, the interface where that telemetry becomes visible, explorable and actionable.

Grafana is often the place where telemetry becomes visible to engineers, operators and stakeholders. It connects to data sources, lets users explore data, builds dashboards and supports alerting workflows. In an observability platform, Grafana is the interface where many investigations begin.

A visualization layer should not simply display data. It should help people answer operational questions. A good Grafana setup makes it easy to move from a symptom to evidence and from evidence to action.

![Grafana concept map](images/concept-map.svg)

## Learning Objectives

After completing this module, participants will be able to:

- Explain Grafana's role in an observability platform.
- Describe how data sources, Explore, panels, dashboards and alerts fit together.
- Use Explore as an investigation workspace before creating reusable panels.
- Choose visualization types based on operational questions.
- Design dashboards for audience, decision-making and incident response.
- Explain performance and trust concerns in production dashboards.
- Identify common Grafana dashboard mistakes and safer alternatives.

## Prerequisites

Participants should be familiar with:

- Logs, metrics and traces.
- ClickHouse as telemetry storage from Module 09.
- Basic SQL or data-source query concepts.
- Basic dashboard and alerting concepts.
- The shared Grafana and ClickHouse lab assumptions used by the course.

## Module Structure

1. Why Grafana matters.
2. Grafana architecture in the observability workflow.
3. Data sources and Explore.
4. Panels and dashboards.
5. Building useful visualizations.
6. Performance and trust.
7. Common mistakes.
8. Hands-on practice.
9. Summary.

## 10.1 Why Grafana Matters

Telemetry becomes useful when people can ask questions of it. A trace stored in ClickHouse, a metric series in Prometheus or a log stream in Loki has limited value if engineers cannot find, visualize and interpret it during an incident.

Grafana provides the investigation and presentation layer. It helps engineers move from raw telemetry to operational insight. That movement is not automatic. A dashboard can clarify a situation, or it can add confusion through weak queries, unclear units and too many panels.

> **Architect Note**
>
> Grafana is not the observability platform by itself. It is the interface over data sources. The quality of the Grafana experience depends on the quality of telemetry, schemas, labels, queries, ownership and dashboard design underneath it.

## 10.2 Grafana Architecture in the Observability Workflow

A typical course workflow looks like this:

```text
Applications
    -> OpenTelemetry Collector
    -> ClickHouse and other telemetry backends
    -> Grafana data sources
    -> Explore, dashboards and alerts
    -> operational decisions
```

Grafana does not store most telemetry directly in this architecture. It queries data sources. Those data sources may represent ClickHouse, Prometheus, Loki, Tempo or another backend. Grafana gives teams a common way to explore, visualize and alert across those systems.

![Grafana workflow](images/workflow.svg)

> **Production Example**
>
> During a checkout incident, an on-call engineer opens a Grafana dashboard. The request-rate panel shows normal traffic, the p95 latency panel shows a sharp increase and the error-rate panel shows payment failures. The engineer opens Explore from the slow-span table, queries ClickHouse for a trace id and then inspects related logs. Grafana provides the path from symptom to evidence.

## 10.3 Data Sources and Explore

Grafana works with data sources. A data source may represent ClickHouse, Prometheus, Loki, Tempo or another backend. Each data source has its own query model, but Grafana provides a consistent user experience for querying and visualizing results.

Data-source configuration matters. A dashboard is only as useful as the data source behind it. Wrong credentials, wrong default database, unstable plugin versions, weak permissions or expensive query defaults can make dashboards unreliable.

Explore is useful during investigation. It allows engineers to query interactively, adjust time ranges and inspect raw data before turning a query into a dashboard panel.

Explore is also a design tool. A good workflow is:

1. Investigate a real operational question in Explore.
2. Refine the query until it answers the question clearly.
3. Choose the visualization that best communicates the answer.
4. Promote the query into a panel only when it has a recurring purpose.
5. Add ownership, units, thresholds and links before relying on it in production.

> **Best Practice**
>
> Build dashboards from proven investigation queries, not from every metric or table that exists. Explore is where queries earn their place. Dashboards should contain the queries that operators repeatedly need.

## 10.4 Panels and Dashboards

Panels are visualizations: time series, tables, stats, gauges, heatmaps and more. A dashboard is a collection of panels organized around a purpose. The best dashboards answer specific questions rather than showing every available metric.

A useful dashboard should have a clear audience. An executive service health dashboard, an on-call troubleshooting dashboard and a developer debugging dashboard should not all look the same.

Dashboard design should start with:

- Who will use this dashboard?
- What decision should it support?
- What time range matters?
- What is normal versus abnormal?
- What should the operator do next?
- Which drilldowns connect symptoms to traces, logs or queries?

A checkout service health dashboard might start with traffic, error rate, latency and saturation. A debugging dashboard might include slow spans, recent error logs and detailed dependency panels. A leadership dashboard might show SLO status and customer-impact indicators.

## 10.5 Building Useful Visualizations

Choose visualization types based on the question. Use time series for trends, tables for detailed records, stat panels for current values and heatmaps for distributions. Units, thresholds and legends should be consistent.

If a panel cannot explain what decision it supports, it probably needs to be changed or removed.

![Grafana operations view](images/operations-view.svg)

Useful visualization choices include:

| Question | Useful visualization |
|---|---|
| Is traffic changing over time? | Time series. |
| What is the current error rate? | Stat or time series. |
| Which traces were slowest? | Table. |
| How is latency distributed? | Heatmap or histogram-oriented panel. |
| Is a threshold currently breached? | Stat, gauge or alert-linked panel. |

Labels, units and legends are not cosmetic details. They determine whether an engineer understands the panel under pressure. A latency panel without units or a table without clear service and time columns creates friction during incidents.

## 10.6 Performance and Trust

Slow dashboards reduce trust. Query design, time range, panel count and data source performance all matter. A dashboard that takes too long to load will not be used during an incident.

Trust also depends on correctness. Panels should use consistent units, documented filters and clear titles. Ambiguous panels create arguments instead of insight.

Production dashboard review should include:

- Are default time ranges reasonable?
- Are queries bounded by time and useful filters?
- Are raw trace or log scans acceptable for this panel?
- Should a panel use pre-aggregated data instead?
- Are units and thresholds consistent?
- Does each panel have an owner?
- Are variables and filters visible and understandable?
- Do links or drilldowns help the next investigation step?

> **Common Mistake**
>
> A team creates one large dashboard with every metric, log table and trace query they can find. It loads slowly, mixes audiences and hides the three panels needed during the first minutes of an incident. The better design is a small service-health dashboard with clear drilldowns into focused troubleshooting views.

## 10.7 Common Mistakes

Common mistakes include putting too many panels on one screen, mixing unrelated audiences, using unclear units, hiding important filters and building dashboards before understanding the operational question.

Additional mistakes include:

- Treating Grafana as a substitute for telemetry design.
- Building panels from unbounded queries.
- Using raw trace scans for high-traffic dashboard panels without considering cost.
- Copying dashboards without changing ownership or thresholds.
- Hiding key variables such as environment, service or region.
- Mixing customer-impact panels with low-level debugging panels.
- Leaving broken panels in place until operators stop trusting the dashboard.

A good dashboard should feel calm during an incident. It should show what changed, how severe it is and where to go next.

## Hands-on Practice

The learner-facing practice material for this module is kept in dedicated files so it can be reused in workshops, self-study and slide delivery:

- [Exercise - Checkout dashboard plan](exercise.md)
- [Lab - Grafana checkout dashboard starter](../../labs/module-10-grafana-dashboard-starter.md)
- [Quiz - Review questions and answers](quiz.md)
- [Official references](references.md)

## Common Interview Questions

1. What role does Grafana play in an observability platform?
2. What is a Grafana data source?
3. When should you use Explore instead of a dashboard?
4. How should you choose a visualization type for a panel?
5. Why should dashboards have a clear audience?
6. What makes a dashboard trustworthy during an incident?
7. Why can too many panels make incident response worse?
8. How would you reduce the cost of a slow Grafana dashboard backed by ClickHouse?

## Summary

Grafana turns telemetry into exploration, dashboards and alerts. It helps teams move from stored data to operational decisions, but only when data sources, queries, panels and dashboards are designed around real questions.

In this module we covered Grafana's role, data sources, Explore, panels, dashboards, visualization choices, performance and trust. The next module focuses on dashboards in more depth, including layout, ownership, operational review and dashboard maturity.

## Key Takeaways

- Grafana is the interface over telemetry data sources, not the telemetry source itself.
- Explore is useful for interactive investigation and panel design.
- Dashboards should be organized around audience and decision.
- Visualization type should follow the operational question.
- Performance and correctness determine whether dashboards are trusted during incidents.
- Good dashboards provide drilldowns from symptoms to evidence.

## Next Module

Module 11 focuses on dashboards: how to design, organize, review and maintain operational dashboards for repeated production use.
