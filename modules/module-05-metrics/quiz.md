# Quiz - Review questions and answers

## Questions

1. What is the difference between a counter and a gauge?
2. Why are percentiles often better than averages for latency?
3. What is high cardinality?
4. Why should request ids not be metric labels?
5. What should you inspect after a metric shows a latency spike?
6. What role do histograms play?
7. Why are metrics efficient for dashboards?

## Answers

1. A counter only increases and is commonly queried as a rate. A gauge can go up or down and represents current state.
2. Percentiles reveal tail behavior, while averages can hide slow requests that affect users.
3. High cardinality means a label creates many unique time series.
4. Request ids are almost always unique, which creates excessive series and cost.
5. Inspect representative traces and related logs to understand cause.
6. Histograms record distributions such as request duration and support percentile analysis.
7. Metrics are compact, aggregated and fast to query over time ranges.
