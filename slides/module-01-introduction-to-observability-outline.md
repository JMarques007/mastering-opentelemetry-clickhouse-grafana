# Module 01 slide outline - Introduction to Observability

## Purpose

This outline supports a 45 to 60 minute delivery of Module 01. It is designed for instructor-led training and can later be converted into a slide deck while keeping Markdown as the source of truth.

## Slide plan

| # | Title | Purpose | Visual or asset | Speaker focus |
|---|---|---|---|---|
| 1 | Introduction to observability | Frame the module and explain why the topic matters. | `modules/module-01-introduction-to-observability/images/observability-overview.svg` | Modern systems fail across boundaries, so teams need evidence rather than guesses. |
| 2 | Why monitoring is not enough | Contrast known-condition monitoring with exploratory observability. | Simple symptom-to-evidence flow | Monitoring detects symptoms; observability helps explain behavior. |
| 3 | The production question | Show the kind of question observability must answer. | Incident prompt: checkout latency after deployment | Ask learners what evidence they would want before taking action. |
| 4 | Logs | Explain logs as detailed event evidence. | `modules/module-01-introduction-to-observability/images/logs-metrics-traces.svg` | Good logs are structured, contextual and actionable. |
| 5 | Metrics | Explain metrics as measurements over time. | Small time-series sketch or same signal diagram | Metrics are excellent for trends, alerting and confirming symptoms. |
| 6 | Traces | Explain traces as request journeys across services. | `modules/module-01-introduction-to-observability/images/distributed-tracing.svg` | Traces show where time was spent and where failure propagated. |
| 7 | Correlation | Show why separate signals are not enough. | `modules/module-01-introduction-to-observability/images/telemetry-correlation.svg` | Trace ids, service names and attributes turn telemetry into an investigation story. |
| 8 | Investigation workflow | Walk through symptom, metric, trace, logs, hypothesis and action. | Numbered workflow | Emphasize sequence and evidence quality. |
| 9 | Common mistakes | Make the risks concrete. | Short checklist | Too much data, unclear dashboards and unhelpful logs slow response. |
| 10 | Exercise | Run the investigation summary exercise. | `modules/module-01-introduction-to-observability/exercise.md` | Have learners write a concise incident summary from correlated evidence. |
| 11 | Review questions | Reinforce the core concepts. | `modules/module-01-introduction-to-observability/quiz.md` | Use questions as discussion prompts, not just assessment. |
| 12 | Key takeaways and transition | Close the module and introduce OpenTelemetry architecture. | Observability overview or transition slide | OpenTelemetry provides the standard path for producing and transporting telemetry. |

## Timing guide

| Section | Suggested time |
|---|---:|
| Opening and motivation | 5 min |
| Monitoring vs observability | 8 min |
| Logs, metrics and traces | 15 min |
| Correlation and workflow | 12 min |
| Exercise and discussion | 12 min |
| Review and transition | 5 min |

## Instructor notes

- Keep the opening practical. Start from a production question rather than a definition.
- Avoid presenting logs, metrics and traces as competing tools. Their value increases when they are correlated.
- Use the exercise to test whether learners can explain their reasoning, not only name the correct signal.
- If learners jump directly to rollback or scaling, ask which telemetry evidence justifies that action.
- Close by connecting the need for correlation to OpenTelemetry's role in standardizing telemetry generation and transport.

## Related module assets

- [Module narrative](../modules/module-01-introduction-to-observability/module.md)
- [Exercise](../modules/module-01-introduction-to-observability/exercise.md)
- [Quiz](../modules/module-01-introduction-to-observability/quiz.md)
- [Official references](../modules/module-01-introduction-to-observability/references.md)
