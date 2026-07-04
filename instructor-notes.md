# Instructor notes

These notes help instructors deliver the course as a coherent workshop rather than a sequence of isolated documents.

## Delivery principles

- Start each module with the production question it helps answer.
- Prefer evidence-based discussion over tool tours.
- Use diagrams to explain responsibility boundaries before showing configuration details.
- Ask learners to justify each operational action with telemetry evidence.
- Keep OpenTelemetry vendor-neutral while showing how ClickHouse and Grafana fit into the platform.

## Timing model

Most modules are designed for 45 to 60 minutes:

| Segment | Typical duration | Purpose |
|---|---:|---|
| Opening scenario | 5 min | Anchor the topic in a production problem. |
| Concept explanation | 15-20 min | Teach the core model and vocabulary. |
| Diagram walkthrough | 8-10 min | Show architecture, flow or signal relationships. |
| Exercise or lab | 15-20 min | Make learners apply the concept. |
| Review and transition | 5 min | Reinforce takeaways and connect to the next module. |

For shorter sessions, keep the scenario, one diagram and the exercise. For longer workshops, expand discussion prompts and compare learner designs.

## Demo guidance

- Use Module 01 to establish the investigation story: symptom, metric, trace, logs and action.
- Use Module 02 to label architecture responsibilities before touching Collector configuration.
- Use Module 03 demos to show one Collector pipeline at a time. Avoid changing receivers, processors and exporters all at once.
- Use Modules 04-08 to review telemetry quality: structured fields, safe labels, meaningful spans and propagation boundaries.
- Use Modules 09-12 to connect storage, dashboards and alerts to operational decisions.
- Use Module 14 as the capstone. Assign roles and require a written incident timeline.

## Discussion prompts

- What question does this telemetry answer?
- What would be missing during an incident if this signal were removed?
- Which fields are useful, and which fields are risky?
- How would this design behave at ten times the current traffic?
- Who owns this dashboard, alert, Collector rule or instrumentation?
- What evidence would justify mitigation?

## Facilitation notes

- When learners jump to fixes, slow the group down and ask for evidence.
- When learners add more telemetry, ask about cost, privacy and ownership.
- When learners design dashboards, ask who the dashboard is for and what decision it supports.
- When learners design alerts, ask who receives the alert and what the first action is.
- When learners propose sampling or filtering, ask which incident evidence might be lost.

## Review checklist

Before teaching a module, confirm that:

- the module README links to the narrative and practice assets;
- diagrams render and do not overlap text;
- exercises include expected outcomes;
- quizzes include answers;
- references are official and relevant;
- examples avoid secrets and local-machine assumptions;
- timing fits the available session length.
