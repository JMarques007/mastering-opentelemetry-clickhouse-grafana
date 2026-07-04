# Exercise - Pipeline review

## Goal

Practice reading a Collector pipeline and explaining how telemetry moves through it.

## Scenario

A platform team has configured an OpenTelemetry Collector with one OTLP receiver, a memory limiter, a batch processor, a resource processor and two exporters. One exporter sends traces to the primary observability backend. The second exporter forwards selected telemetry to a central platform Collector.

## Instructions

1. Identify which component receives telemetry from applications.
2. Identify which processors improve safety, efficiency or consistency.
3. Explain what happens when the primary exporter is unavailable.
4. Decide which signals should be forwarded to the central Collector.
5. Propose one metric and one log entry that should be monitored for Collector health.

## Expected outcome

Learners should describe the Collector as a pipeline, not a database. A strong answer explains that receivers accept telemetry, processors modify or protect the flow, exporters send data onward and health must be monitored because dropped telemetry reduces incident visibility.

## Instructor notes

Ask learners where they would make a routing change if the backend changed. The desired answer is the Collector configuration, not every application. If learners add every processor to every signal, ask what cost, latency or data-loss risk that creates.
