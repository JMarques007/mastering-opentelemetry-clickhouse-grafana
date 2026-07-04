# Lab - Checkout alert rule examples

## Goal

Review alert rule examples for checkout error rate, latency symptoms, payment timeout logs and queue depth.

The examples live at:

```text
examples/alerting/checkout-alert-rules.yaml
```

They are intentionally platform-neutral so learners can adapt the same alert design to Grafana Alerting, Prometheus-style rules or an internal alerting system.

## Review workflow

1. Open the alert rule examples.
2. Identify the signal used by each rule: traces, logs or metrics.
3. Identify the owner, severity and intended response.
4. Decide whether the threshold is page-worthy or only notification-worthy.
5. Check whether the annotations give enough context for a responder.
6. Propose one dashboard link and one runbook improvement for each rule.

## Rule design questions

- Does the alert describe user impact or only a low-level symptom?
- Is the owner clear?
- Is the first investigation query obvious?
- Does the rule include enough context to route correctly?
- Could this alert create noise during normal traffic spikes?
- How would you test this rule safely?

## Expected outcome

Learners should understand that an alert is not complete when a query returns a number. A production-ready alert needs ownership, severity, routing, annotations, a first query and a runbook action.

## Adaptation notes

When adapting these examples to Grafana Alerting:

- create one alert rule per YAML entry;
- map `query` to the ClickHouse datasource query;
- map `condition.expression` to Grafana's reduce and threshold expressions;
- preserve labels and annotations;
- test rules against a short time window before enabling notifications.

## Official references

- [Grafana Alerting](https://grafana.com/docs/grafana/latest/alerting/)
- [Prometheus Alerting rules](https://prometheus.io/docs/prometheus/latest/configuration/alerting_rules/)
- [OpenTelemetry Metrics specification](https://opentelemetry.io/docs/specs/otel/metrics/)
