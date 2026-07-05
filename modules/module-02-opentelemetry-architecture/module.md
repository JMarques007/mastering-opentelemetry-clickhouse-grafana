# Module 2 - OpenTelemetry Architecture

## Overview

Module 1 introduced the core idea of observability: the ability to understand the internal state of a system by analyzing the telemetry it produces. We discussed logs, metrics and traces as complementary signals and explored why correlation is essential for troubleshooting modern distributed systems.

The next question is natural: how does this telemetry actually travel from an application to an observability platform?

This module introduces the architecture of OpenTelemetry. It explains the main building blocks involved in collecting, transporting, processing and exporting telemetry data. The goal is not to turn participants into Collector experts yet; that will be covered in the next module. Instead, this module provides the architectural map required to understand how OpenTelemetry-based platforms are designed.

![OpenTelemetry architecture concept map](images/concept-map.svg)

## Learning Objectives

After completing this module, participants will be able to:

- Explain why OpenTelemetry exists.
- Describe the main OpenTelemetry components.
- Understand the role of the SDK, Collector and OTLP.
- Describe how logs, metrics and traces flow through an observability architecture.
- Compare common deployment models such as direct export, agent, gateway and sidecar.
- Identify common architecture mistakes and safer alternatives.

## Prerequisites

Participants should be familiar with:

- Basic observability concepts.
- Logs, metrics and traces.
- Basic HTTP and client/server communication.
- Basic understanding of distributed systems.

## Module Structure

1. Why OpenTelemetry?
2. OpenTelemetry Architecture Overview
3. OpenTelemetry Components
4. Telemetry Flow
5. OpenTelemetry SDK
6. OpenTelemetry Collector
7. OTLP
8. Deployment Models
9. Best Practices
10. Common Mistakes
11. Hands-on Practice
12. Summary

## 2.1 Why OpenTelemetry?

Modern software rarely runs as a single process on a single server. A single user action may involve a browser, an API gateway, multiple backend services, databases, message queues and external systems. Each of these components may generate telemetry in a different format.

Before OpenTelemetry, teams often had to choose between vendor-specific agents, custom instrumentation libraries or different standards for different telemetry signals. This created fragmentation. A team could instrument tracing using one library, metrics using another, and logs using a third. Moving to another backend often required rewriting instrumentation or changing application code.

OpenTelemetry was created to solve this problem by providing a vendor-neutral standard for telemetry collection. Applications can be instrumented once and send telemetry to different observability backends without being tightly coupled to a single vendor.

> **Architect Note**
>
> OpenTelemetry is not just a library. It is an architectural standard. Its most important value is that it separates telemetry generation from telemetry storage and visualization. That separation gives teams the freedom to change backends, routing policies and processing rules without rewriting every service.

## 2.2 Architecture Overview

At a high level, an OpenTelemetry architecture contains the following stages:

```text
Application
    ->
OpenTelemetry SDK or Agent
    ->
OTLP
    ->
OpenTelemetry Collector
    ->
Backend Storage
    ->
Visualization and Alerting
```

The application generates telemetry. The SDK or agent captures that telemetry. OTLP transports it. The Collector receives, processes and exports it. The backend stores it. Grafana or another visualization layer allows engineers to query and analyze it.

This separation is one of the most important architectural characteristics of OpenTelemetry. Each stage has a clear responsibility and can evolve independently.

![Telemetry workflow](images/workflow.svg)

> **Production Example**
>
> A checkout request enters an API service. The OpenTelemetry SDK creates a trace span for the request, records latency metrics and attaches resource attributes such as `service.name=checkout-api` and `deployment.environment=production`. The SDK sends telemetry over OTLP to a local or gateway Collector. The Collector batches the data, adds environment metadata, filters unsafe attributes and exports it to ClickHouse. Grafana then queries ClickHouse to show request latency, error rates and trace-linked logs for the checkout service.

## 2.3 OpenTelemetry Components

An OpenTelemetry-based platform is built from several components.

### Instrumented Applications

Instrumented applications are the source of telemetry. They may be instrumented manually by developers or automatically using language agents and instrumentation libraries.

### OpenTelemetry SDK

The SDK runs inside the application process. It creates spans, records metrics, enriches telemetry with attributes and exports data to a configured destination.

The SDK is close to application code, so it is the right place for application-specific signal creation. It is not the best place for organization-wide routing rules, backend-specific exporter policy or expensive processing logic.

### OTLP

OTLP is the OpenTelemetry Protocol. It defines how telemetry is transported between components. It supports gRPC and HTTP and is commonly used between applications, collectors and other telemetry systems.

OTLP matters because it gives teams one standard transport path for logs, metrics and traces instead of forcing every signal to use a different vendor protocol.

### OpenTelemetry Collector

The Collector is a standalone component that receives telemetry, processes it and exports it to one or more destinations. It is optional in simple architectures, but strongly recommended in production environments.

The Collector is where teams usually centralize batching, retries, enrichment, filtering, sampling, routing and export configuration. This keeps application configuration smaller and makes platform changes safer.

### Observability Backend

The backend stores telemetry data. Examples include ClickHouse, Prometheus, Tempo, Loki, Jaeger or commercial observability platforms.

### Visualization Layer

Grafana is commonly used to query, visualize and alert on telemetry data stored in backends.

## 2.4 Telemetry Flow

A typical flow looks like this:

```text
Application -> SDK -> OTLP -> Collector -> ClickHouse -> Grafana
```

In more advanced architectures, the Collector may export telemetry to multiple destinations at the same time:

```text
Collector -> ClickHouse
Collector -> Prometheus
Collector -> Tempo
Collector -> Another Collector
```

This allows organizations to support local analysis, central aggregation, long-term storage and external integrations simultaneously.

A useful way to reason about telemetry flow is to ask what each stage owns:

| Stage | Main responsibility | Typical failure mode |
|---|---|---|
| Application | Emit useful telemetry with correct context. | Missing spans, weak attributes or inconsistent service names. |
| SDK or agent | Capture and export telemetry from the process. | Disabled exporter, sampling surprise or wrong endpoint. |
| OTLP transport | Move telemetry between components. | Network, TLS, protocol or endpoint mismatch. |
| Collector | Receive, process, batch and route telemetry. | Bad pipeline config, dropped data or exporter backpressure. |
| Backend | Store telemetry for query and retention. | Schema, ingestion, cost or retention mismatch. |
| Grafana | Visualize, investigate and alert. | Queries that hide missing data or dashboards with unclear ownership. |

## 2.5 Deployment Models

OpenTelemetry does not require a single deployment pattern. The right design depends on the platform, team ownership model, data volume and operational constraints.

### Direct Export

Applications send telemetry directly to a backend or managed ingestion endpoint.

Direct export is simple for demos and small environments, but it tightly couples application configuration to backend choices. It also makes future routing, filtering and policy changes harder because every service may need to be changed.

### Agent Collector

A Collector runs close to each workload, commonly as a host agent or Kubernetes DaemonSet. Applications send telemetry to the local agent, and the agent forwards it to a central destination.

This pattern reduces application network complexity and gives platform teams a local place for batching, retries and enrichment.

### Gateway Collector

Applications or agent Collectors send telemetry to a central Collector tier. The gateway applies shared processing rules and exports to one or more backends.

This pattern is common in production because it centralizes policy, authentication, routing and fan-out. It must be sized carefully because it becomes part of the telemetry ingestion path.

### Sidecar Collector

A Collector runs beside a specific application instance or service.

Sidecars are useful when a workload needs isolated processing or local protocol translation. They can also increase operational overhead because every workload carries another runtime component.

> **Best Practice**
>
> Prefer a Collector in production even when applications can technically export directly. The Collector gives the platform a stable control point for batching, retries, filtering, enrichment and multi-destination routing. Keep application instrumentation focused on generating meaningful telemetry; keep platform policy in the Collector.

## 2.6 Best Practices

- Always define `service.name`.
- Keep Resource Attributes consistent across services.
- Prefer OTLP for interoperability.
- Use the Collector to centralize processing logic.
- Avoid putting business-sensitive data in attributes.
- Design for multiple destinations from the beginning.
- Document ownership for SDK configuration, Collector pipelines, backend retention and Grafana dashboards.

## 2.7 Common Mistakes

- Sending telemetry directly to a backend without considering future routing needs.
- Treating the Collector as a database.
- Using inconsistent service names.
- Creating high-cardinality metric attributes.
- Forgetting context propagation between services.
- Hiding architecture decisions inside application defaults instead of making them visible in platform configuration.

> **Common Mistake**
>
> A team instruments every service with a different `service.name` convention, such as `checkout`, `checkout-api`, `checkout_service` and `prod-checkout`. Dashboards then split one service into multiple identities, alerts miss part of the traffic and trace correlation becomes unreliable. The fix is not a Grafana trick; the fix is a shared resource attribute standard enforced in SDK configuration or Collector enrichment.

## Operational Investigation View

When troubleshooting production issues, this architecture becomes a map. If telemetry is missing, the problem may be in instrumentation, SDK export, OTLP transport, Collector processing or backend ingestion. Engineers should be able to follow the path one stage at a time instead of treating observability as a black box.

![Architecture operations view](images/operations-view.svg)

A disciplined investigation usually follows the telemetry path from source to query:

1. Confirm the application emits the expected telemetry.
2. Check SDK or agent configuration and export errors.
3. Verify OTLP endpoint, protocol and network path.
4. Inspect Collector receiver, processor and exporter metrics.
5. Confirm backend ingestion and retention.
6. Validate Grafana query logic and dashboard filters.

## Hands-on Practice

The learner-facing practice material for this module is kept in dedicated files so it can be reused in workshops, self-study and slide delivery:

- [Lab - Architecture mapping](lab.md)
- [Quiz - Review questions and answers](quiz.md)
- [Official references](references.md)

## Common Interview Questions

1. Why does OpenTelemetry separate instrumentation from storage and visualization?
2. When would you choose a gateway Collector instead of direct application export?
3. Which telemetry decisions belong in the SDK, and which belong in the Collector?
4. What operational risks appear when `service.name` and resource attributes are inconsistent?
5. How would you troubleshoot telemetry that appears in application logs but not in Grafana?
6. Why can high-cardinality attributes become a production problem for metrics?

## Summary

OpenTelemetry provides the architecture and standards required to collect telemetry in a vendor-neutral way. Its main strength is the separation between instrumentation, transport, processing, storage and visualization.

In this module we introduced the SDK, OTLP, the Collector, backends and Grafana. We also compared deployment models and looked at the operational consequences of architecture choices. The next module will focus entirely on the OpenTelemetry Collector, which is one of the most important components in production observability architectures.

## Key Takeaways

- OpenTelemetry is an architectural standard, not just an instrumentation library.
- OTLP provides a common transport path for telemetry signals.
- The Collector is the main production control point for processing, batching, enrichment and routing.
- Deployment models should be chosen based on ownership, reliability, policy and scale.
- Consistent resource attributes are essential for dashboards, alerts and correlation.

## Next Module

Module 3 explores the OpenTelemetry Collector in depth, including receivers, processors, exporters, extensions, pipelines and production deployment patterns.
