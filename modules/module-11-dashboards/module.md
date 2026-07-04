# Module 11 - Dashboards

## Course context

Dashboards are decision surfaces. They help people understand whether a service is healthy, whether an incident is spreading, whether a fix worked or whether a system is approaching capacity limits. A dashboard is not useful because it has many panels. It is useful because it helps the right audience answer the right questions quickly.

In observability training, dashboard design is where telemetry becomes operational communication.

![Dashboards concept map](images/concept-map.svg)

## Start with the audience

A dashboard should have a primary audience. On-call engineers need fast symptom recognition and drilldowns. Developers may need detailed service internals. Managers may need reliability trends and customer impact. Mixing all of these needs into one dashboard often produces a crowded screen that serves nobody well.

Start by writing the questions the dashboard must answer. For example: Is checkout healthy? Which dependency is slow? Did the latest deployment increase errors? Are we within the SLO budget?

## Layout and hierarchy

The most important information should be visible first. Health, traffic, errors and latency often belong near the top. Detailed panels and drilldowns can follow. Related panels should be grouped so the viewer can scan patterns.

![Dashboard workflow](images/workflow.svg)

Use consistent time ranges, units, colors and labels. If red means error in one panel, it should not mean success in another. Consistency reduces cognitive load during incidents.

## From dashboards to investigation

A good dashboard should offer an investigation path. If latency is high, the dashboard should guide the user toward traces, logs or dependency panels. If error rate increases, it should help identify service, route, status code or deployment version.

Dashboards should not be the end of investigation. They should be the map that points to deeper evidence.

## Common dashboard problems

Many dashboards fail because they are built from available data rather than operational questions. Others become slow because every team adds panels without removing old ones. Some dashboards show totals that hide the affected service or user group.

![Dashboards operations view](images/operations-view.svg)

A dashboard should be reviewed periodically. If nobody uses a panel, remove it. If a panel is used during every incident, make it easier to find.

## Exercise

Design a dashboard for a service used by operators. Define the audience, the top five questions, the panels required to answer them and the drilldown links needed for deeper investigation. Explain which panels should be visible without scrolling.

## Quiz

1. Why should dashboards be designed around audience?
2. What is an operational question?
3. Why are consistent units important?
4. What makes a dashboard useful during an incident?
5. When should a panel be removed?

## Key takeaways

- Dashboards are decision tools.
- Audience and questions come before panels.
- Good layout supports fast scanning.
- Dashboards should link to deeper evidence.

## Official references

- Grafana Dashboards: https://grafana.com/docs/grafana/latest/dashboards/
- Grafana Panels and Visualizations: https://grafana.com/docs/grafana/latest/panels-visualizations/
- Grafana Dashboard Best Practices: https://grafana.com/docs/grafana/latest/dashboards/build-dashboards/best-practices/
- Prometheus Alerting and Recording Rules: https://prometheus.io/docs/prometheus/latest/configuration/recording_rules/
