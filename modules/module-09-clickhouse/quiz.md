# Quiz - Review questions and answers

## Questions

1. Why is columnar storage useful for telemetry?
2. Why are small inserts a problem?
3. What does an order key influence?
4. Why should retention differ by signal or use case?
5. How does SQL help investigation workflows?
6. Why should schema design follow query patterns?
7. What ClickHouse feature can help enforce retention?

## Answers

1. Telemetry queries often scan a few columns across many rows, which fits columnar storage and compression.
2. Many tiny inserts can create too many parts and reduce MergeTree performance.
3. The order key influences how efficiently ClickHouse can read and skip data for common filters.
4. Different signals have different cost, value and compliance requirements.
5. SQL lets engineers filter, group and aggregate telemetry using a familiar language.
6. A schema that matches investigation patterns keeps dashboards and ad hoc queries fast.
7. TTL policies can automatically move or remove data according to retention rules.
