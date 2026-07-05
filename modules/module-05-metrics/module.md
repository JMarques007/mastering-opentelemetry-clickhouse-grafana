# Module 05 - Metrics

## Overview

Module 04 explained logs as structured event evidence. Metrics answer a different kind of question: how is the system behaving over time?

Metrics describe system behavior as numbers over time. They are the signal most commonly used for dashboards, alerting, capacity planning and service health. If logs explain individual events and traces explain individual request journeys, metrics explain patterns.

A metric can show that request latency is rising, that error rate increased after a deployment, that memory usage is approaching a limit or that a queue is growing faster than workers can process it. Metrics are powerful because they are compact, fast to query and well suited to trend analysis.

![Metrics concept map](images/concept-map.svg)

## Learning Objectives

After completing this module, participants will be able to:

- Explain metrics as numerical time-series evidence.
- Distinguish counters, gauges and histograms by use case.
- Explain rates, percentiles and aggregation.
- Design labels that answer operational questions without creating unsafe cardinality.
- Connect metrics to dashboards, SLOs and actionable alerts.
- Identify common metric design mistakes in production systems.

## Prerequisites

Participants should be familiar with:

- Logs, metrics and traces from Module 01.
- Collector pipelines from Module 03.
- Structured operational context from Module 04.
- Basic time-series concepts such as values over time.
- Basic dashboard or alerting concepts.

## Module Structure

1. Why metrics matter.
2. Metric instruments.
3. Metric design.
4. Rates, percentiles and aggregation.
5. Labels and cardinality.
6. Metrics in production.
7. Common mistakes.
8. Hands-on practice.
9. Summary.

## 5.1 Why Metrics Matter

Metrics are efficient because they compress behavior into time-series measurements. Instead of reading every request log, an engineer can inspect request rate, error rate, latency percentiles and saturation indicators across a time window.

This makes metrics ideal for dashboards and alerts. A metric can show that a service is unhealthy before anyone reads a log line. Metrics can also show whether a change made the system better or worse.

Metrics are not full explanations. They are signals that detect, quantify and prioritize. When a metric shows a problem, engineers often use traces and logs to understand the cause.

> **Architect Note**
>
> Metrics are strongest when they answer stable operational questions. A metric should exist because someone needs to detect, compare, alert, plan capacity or validate a service-level objective. Metrics created without a question often become cost without insight.

## 5.2 Metric Instruments

Metric instruments describe how measurements are recorded. Choosing the wrong instrument makes queries and alerts harder later.

### Counters

A counter represents a value that only increases. Request count, error count and processed message count are common examples. Counters are usually queried as rates because the raw value is less useful than the change over time.

For example, `checkout.requests` as a monotonic count can become requests per second. `checkout.errors` can become error rate when divided by request count over the same time window.

### Gauges

A gauge represents a value that can go up or down. Memory usage, active sessions, current queue depth and open connections are examples. Gauges describe current state.

Gauges are useful for saturation and capacity questions: how full is the queue, how much memory is used, how many workers are active or how many connections are open right now?

### Histograms

A histogram records a distribution of measurements. Request duration and database query duration are common examples. Histograms are useful because they support percentile-style analysis such as p50, p95 and p99.

Histograms are often the right choice for latency because user experience is shaped by the tail of the distribution, not only the average.

> **Production Example**
>
> A checkout service records `checkout.requests` as a counter, `checkout.duration` as a histogram and `checkout.queue_depth` as a gauge. The counter supports traffic and error-rate dashboards. The histogram supports p95 latency and SLO analysis. The gauge shows whether checkout work is backing up faster than workers can process it.

## 5.3 Metric Design

A useful metric has more than a name and value. It needs a clear purpose, unit, instrument type, labels and owner.

| Design choice | Question to ask |
|---|---|
| Name | What behavior does this measure? |
| Instrument | Is this a count, current value or distribution? |
| Unit | Are values comparable and unambiguous? |
| Labels | Which dimensions are needed for operations? |
| Resource attributes | Which service, environment and deployment produced it? |
| Owner | Who maintains the metric, dashboard and alert? |

Metric names should be stable. Units should be explicit. Labels should be chosen because they support real queries, not because all available context might be interesting someday.

> **Best Practice**
>
> Design metrics from dashboard and alert questions backward. Start with the decision an operator needs to make, then choose the instrument, labels and aggregation that support that decision. This prevents metrics from becoming a high-volume inventory of unused measurements.

## 5.4 Rates, Percentiles and Aggregation

Metrics become useful when they are aggregated correctly. A request counter can become requests per second. A duration histogram can become p95 latency. An error counter can become error rate. These derived views are what operators usually need.

Average latency is often misleading because it hides tail behavior. A system may have a reasonable average while a significant number of users experience slow requests. Percentiles show how the slower part of the distribution behaves.

![Metrics workflow](images/workflow.svg)

Aggregation should match the question. A platform owner may need service-level latency across all instances. A team debugging a rollout may need latency by route, version or environment. Both views can be useful, but they require intentional label and aggregation design.

Alerting should also use meaningful aggregation windows. A one-second spike may not require action. A sustained error-rate increase or p95 latency breach might. The goal is to alert on symptoms that require response, not on every fluctuation.

## 5.5 Labels and Cardinality

Labels add dimensions to metrics. They allow queries such as latency by service, route, environment or status code. Labels are essential, but they can also create high cardinality.

High cardinality happens when a label has too many distinct values. User id, request id, session id or raw URL paths can create excessive time series. This increases storage cost and query complexity. A good metric label should help answer an operational question without exploding the number of series.

Safe labels often have a controlled set of values:

- `service.name`
- `deployment.environment`
- `http.route`
- `http.status_code`
- `region`
- `operation`

Risky labels often create unbounded values:

- user id
- request id
- session id
- raw URL
- email address
- order id
- exception message

> **Common Mistake**
>
> A team adds `user_id` and raw `url` as metric labels to make debugging easier. The metric backend suddenly receives a new time series for nearly every user and request path. Query latency increases, storage cost rises and dashboards become less reliable. The better design is to use bounded labels such as route templates, status code, service and environment, then use logs or traces for request-specific detail.

## 5.6 Metrics in Production

Metrics are ideal for health indicators: latency, traffic, errors and saturation. These four categories help teams understand whether a service is handling load, whether it is failing, whether users are waiting and whether resources are constrained.

![Metrics operations view](images/operations-view.svg)

Metrics alone usually do not explain root cause. If p95 latency rises, the next step is often to inspect traces and logs for representative requests. Metrics detect and prioritize; traces and logs explain.

Production metric design should answer:

- Which metrics define service health?
- Which metrics support SLOs or error budgets?
- Which labels are required for routing and ownership?
- Which dimensions are too expensive or unsafe?
- Which alerts are actionable and owned by a team?
- Which metrics need long retention for capacity planning?

Metrics should be reviewed as the system evolves. A useful launch metric can become noisy later. An alert that once mattered can become obsolete after architecture changes. Metric ownership prevents dashboards and alerts from drifting into untrusted clutter.

## 5.7 Common Mistakes

Common mistakes include using averages for user experience, adding unsafe labels, creating metrics without clear ownership and alerting on symptoms that do not require action. Another mistake is using metrics as a substitute for logs or traces. Metrics show the shape of behavior, not every detail.

Additional mistakes include:

- Using counters as if raw cumulative values were operationally meaningful.
- Alerting on gauges without understanding normal range and seasonality.
- Using histograms without consistent units or bucket strategy.
- Creating labels from unbounded identifiers.
- Mixing service-level and instance-level views without clear intent.
- Building dashboards that show many metrics but answer no operational question.
- Failing to document who owns each alert.

Good metrics make operations calmer. They show what changed, how much it changed, where it changed and whether action is needed.

## Hands-on Practice

The learner-facing practice material for this module is kept in dedicated files so it can be reused in workshops, self-study and slide delivery:

- [Exercise - Checkout metric design](exercise.md)
- [Lab - OTLP metrics payloads](../../labs/module-05-metrics-otlp-payloads.md)
- [Quiz - Review questions and answers](quiz.md)
- [Official references](references.md)

## Common Interview Questions

1. What is the difference between a counter, a gauge and a histogram?
2. Why are counters usually queried as rates?
3. Why are percentiles often better than averages for user-facing latency?
4. What is high cardinality, and why does it matter?
5. Which labels would you choose for checkout request latency, and which would you reject?
6. How do metrics support SLOs and alerting?
7. Why are metrics usually not enough to explain root cause?
8. What makes an alert actionable?

## Summary

Metrics describe system behavior as numbers over time. They are compact, fast to query and essential for dashboards, alerting, capacity planning and service health. Counters, gauges and histograms answer different questions, and labels determine how useful or expensive those answers become.

In this module we covered instruments, metric design, rates, percentiles, aggregation, labels, cardinality and production health indicators. The next module focuses on traces, which show request journeys through distributed systems.

## Key Takeaways

- Metrics show patterns over time; they do not replace logs or traces.
- Counters, gauges and histograms have different operational meanings.
- Percentiles reveal tail latency that averages often hide.
- Labels are powerful but must be bounded and intentional.
- Good metrics are designed from dashboard, SLO and alert questions backward.
- Actionable alerts require ownership, context and a response path.

## Next Module

Module 06 focuses on traces: how spans form request journeys, how latency breaks down across services and how trace context connects distributed work.
