# Module 03 - OpenTelemetry Collector

## Course context

The OpenTelemetry Collector is the telemetry pipeline between applications and observability backends. It receives logs, metrics and traces, processes them and exports them to one or more destinations. In production, the Collector is often where teams enforce consistency, reduce noise, control cost and decouple applications from backend-specific details.

Without a Collector, every application may need to know where to send telemetry, how to retry, how to batch, how to filter and how to authenticate. That approach does not scale well. The Collector gives platform teams a central place to operate telemetry flow.

![Collector concept map](images/concept-map.svg)

## Core building blocks

A Collector configuration is built around receivers, processors, exporters and pipelines.

Receivers accept telemetry. An OTLP receiver is common because applications and agents can send standard OpenTelemetry data to it. Other receivers may scrape Prometheus metrics or receive data from existing systems.

Processors modify telemetry while it moves through the pipeline. Common processors batch data, add resource attributes, filter unwanted telemetry, redact sensitive fields or control memory usage. Processors are powerful because they can improve telemetry quality without changing application code.

Exporters send telemetry to destinations. A Collector may export traces to one backend, metrics to another and logs to a storage system such as ClickHouse. Exporters are also where retries and queue behavior matter.

Pipelines connect these pieces per signal. A traces pipeline may use one set of processors while a metrics pipeline uses another.

![Collector workflow](images/workflow.svg)

## Deployment patterns

The Collector can run as an agent near workloads or as a gateway service. An agent Collector is useful for local collection and node-level enrichment. A gateway Collector centralizes routing, filtering and export policies. Many production environments use both.

Choosing the pattern depends on scale, network topology, ownership and reliability requirements. A gateway is easier to manage centrally, but it can become a critical dependency. Agents reduce network distance, but they increase the number of Collector instances to operate.

## Production considerations

Collector operations are not only about configuration syntax. Engineers must monitor dropped data, exporter queue size, retry behavior, memory usage and backend availability. A Collector that silently drops spans during an incident can make troubleshooting harder precisely when telemetry is most needed.

![Collector operations view](images/operations-view.svg)

Batching improves efficiency, but large batches may increase latency. Filtering reduces cost, but aggressive filters may remove evidence. Enrichment improves context, but inconsistent resource attributes make queries harder.

## Common mistakes

A common mistake is putting every possible processor into every pipeline. Another is routing all signals to all destinations without asking who will use them. Teams also often forget to monitor the Collector itself. The Collector is part of the observability platform and must be observable too.

## Exercise

Read a Collector pipeline with an OTLP receiver, batch processor and two exporters. Identify which signals flow through the pipeline, where batching happens and what would happen if one exporter became unavailable. Then propose one metric you would monitor for Collector health.

## Quiz

1. What does a receiver do?
2. Why are processors useful?
3. What is the difference between an agent and gateway deployment?
4. Why should the Collector itself be monitored?
5. What is a risk of filtering telemetry too aggressively?

## Key takeaways

- The Collector is the operational pipeline for telemetry.
- Receivers accept data, processors transform it and exporters send it onward.
- Pipelines are configured per signal.
- Production Collector health directly affects observability quality.

## Official references

- OpenTelemetry Collector Documentation: https://opentelemetry.io/docs/collector/
- Collector Configuration: https://opentelemetry.io/docs/collector/configuration/
- OpenTelemetry Collector Contrib: https://github.com/open-telemetry/opentelemetry-collector-contrib
- OpenTelemetry Specification: https://opentelemetry.io/docs/specs/otel/
