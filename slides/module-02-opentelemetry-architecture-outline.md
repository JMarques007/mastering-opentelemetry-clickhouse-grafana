# Module 02 slide outline - OpenTelemetry Architecture

## Purpose

This outline supports a 45 to 60 minute delivery of Module 02. It introduces the architecture of OpenTelemetry before learners go deep into Collector configuration in Module 03.

## Slide plan

| # | Title | Purpose | Visual or asset | Speaker focus |
|---|---|---|---|---|
| 1 | OpenTelemetry Architecture | Frame the module as the map between applications and observability platforms. | `modules/module-02-opentelemetry-architecture/images/concept-map.svg` | The key value is decoupling telemetry generation from storage and visualization. |
| 2 | Why OpenTelemetry exists | Explain fragmentation before OpenTelemetry. | Simple before/after diagram | Instrument once, route to many backends, avoid vendor lock-in in application code. |
| 3 | Architecture at a glance | Introduce application, SDK, OTLP, Collector, backend and Grafana. | `modules/module-02-opentelemetry-architecture/images/workflow.svg` | Walk left to right and name each responsibility. |
| 4 | Instrumented applications | Show where telemetry starts. | Application boundary sketch | Applications emit telemetry through automatic and manual instrumentation. |
| 5 | SDK responsibility | Explain what happens inside the process. | SDK callout | The SDK records spans, metrics and attributes, then exports telemetry. |
| 6 | OTLP transport | Explain the protocol layer. | Protocol arrow | OTLP is the standard transport between instrumented components and Collectors. |
| 7 | Collector responsibility | Preview the Collector without going too deep. | Collector pipeline sketch | Receivers, processors and exporters make routing and processing operationally manageable. |
| 8 | Backend and visualization | Connect storage to Grafana. | Backend-to-Grafana flow | Backends store telemetry; Grafana turns stored data into exploration, dashboards and alerts. |
| 9 | Deployment models | Compare agent, gateway and sidecar. | Three-column comparison | Discuss trade-offs in ownership, scale, latency and reliability. |
| 10 | Architecture mistakes | Make common risks visible. | Checklist | Inconsistent service names, direct backend coupling and missing context propagation create pain later. |
| 11 | Lab walkthrough | Use the architecture mapping lab. | `modules/module-02-opentelemetry-architecture/lab.md` | Learners should label generate, transport, process, store and visualize. |
| 12 | Key takeaways and transition | Prepare for Module 03. | Concept map reprise | The next module turns this architecture into Collector pipeline configuration. |

## Timing guide

| Section | Suggested time |
|---|---:|
| Motivation and architecture overview | 10 min |
| SDK, OTLP and Collector responsibilities | 18 min |
| Backends, visualization and deployment models | 12 min |
| Common mistakes | 7 min |
| Lab and discussion | 15 min |
| Review and transition | 5 min |

## Instructor notes

- Keep this module architectural. Avoid turning it into a Collector configuration lesson too early.
- Repeatedly ask which component owns each responsibility: generation, transport, processing, storage or visualization.
- Use the deployment model comparison to surface trade-offs, not to declare a universal best pattern.
- When learners draw direct application-to-backend exports, ask how they would change routing without redeploying services.
- Close by making the Collector feel necessary, so Module 03 has a natural entry point.

## Related module assets

- [Module narrative](../modules/module-02-opentelemetry-architecture/module.md)
- [Lab](../modules/module-02-opentelemetry-architecture/lab.md)
- [Quiz](../modules/module-02-opentelemetry-architecture/quiz.md)
- [Official references](../modules/module-02-opentelemetry-architecture/references.md)
