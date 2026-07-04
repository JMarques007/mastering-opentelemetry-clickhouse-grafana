# Module 04 - Logs

## Course context

Logs are the most familiar telemetry signal for many engineers. They are also one of the easiest signals to misuse. A log can be excellent evidence during an incident, or it can be a stream of vague messages that creates more noise than clarity.

A log is a timestamped event. It should describe something that happened in the system and include enough context for an engineer to decide what to do next. In production troubleshooting, logs answer questions such as: what failed, which service reported it, which operation was running, which user or tenant was affected and which trace contains the related request.

![Logs concept map](images/concept-map.svg)

## Structured logging

Structured logs store context as fields instead of burying everything in a sentence. This makes logs easier to filter, aggregate and correlate.

A poor log says `Error occurred`. A useful log says that payment authorization failed for a specific operation, with a provider timeout, in a specific service and trace. The second log gives the engineer a path forward.

Useful fields often include `service.name`, `deployment.environment`, `trace_id`, `span_id`, `http.route`, `exception.type`, `exception.message`, `db.system` and a safe business identifier. The exact fields depend on the system, but the principle is stable: logs should carry context that supports investigation.

## Severity and noise

Severity levels should communicate operational importance. If everything is a warning, nothing is a warning. If expected business rejections are logged as errors, alerting and dashboards become noisy. Teams should define what `info`, `warn`, `error` and `critical` mean in their environment.

Good severity design helps operators distinguish normal behavior from degraded behavior. It also supports better routing, alerting and retention decisions.

![Log lifecycle workflow](images/workflow.svg)

## Correlation with traces and metrics

Logs become much more powerful when they are correlated with traces and metrics. Metrics may show that the error rate increased. A trace may show that payment authorization failed. Logs can provide the exact exception, provider response or business rule involved.

The trace id is the bridge. If application logs include trace and span identifiers, engineers can move from a trace to the related logs without guessing time windows or service names.

## Production guidance

Logs should be designed for repeated investigation. Avoid logging secrets, personal data or raw payloads. Avoid high-volume debug logs in normal production operation. Avoid messages that only make sense to the original developer. Prefer stable event names and structured attributes.

![Logs operations view](images/operations-view.svg)

Retention also matters. Not every log needs the same lifetime. Security, audit, operational and debug logs may have different retention requirements and access controls.

## Common mistakes

Common mistakes include logging too much, logging too little, using inconsistent field names and treating logs as the only observability signal. Logs are detailed, but they are not always efficient for trends or request timelines. Use them together with metrics and traces.

## Exercise

Rewrite three vague log messages into structured, actionable logs. Include service name, operation, severity, safe identifiers, trace id and failure reason. Then explain which fields you would use to find related traces.

## Quiz

1. What makes a log entry actionable?
2. Why is structured logging better than free text only?
3. Why can excessive warning logs be harmful?
4. Which fields help correlate logs with traces?
5. What types of data should not be logged?

## Key takeaways

- Logs are event evidence, not a dumping ground for strings.
- Structured fields make logs searchable and correlatable.
- Severity must reflect operational meaning.
- Logs are strongest when connected to traces and metrics.

## Official references

- OpenTelemetry Logs: https://opentelemetry.io/docs/specs/otel/logs/
- OpenTelemetry Semantic Conventions: https://opentelemetry.io/docs/specs/semconv/
- Grafana Loki Documentation: https://grafana.com/docs/loki/latest/
- OWASP Logging Cheat Sheet: https://cheatsheetseries.owasp.org/cheatsheets/Logging_Cheat_Sheet.html
