# Exercise - Trace span table design

## Goal

Design a simple ClickHouse table for trace spans and write investigation queries.

## Instructions

Create a table design that includes:

- timestamp;
- service name;
- environment;
- trace id;
- span id;
- operation name;
- duration;
- status;
- selected attributes.

Then write two SQL queries:

1. Find the slowest spans in the last hour.
2. Count errors by service in the last hour.

## Expected outcome

A strong answer uses time-oriented filtering, columns that match investigation patterns and an order key that supports common queries. Learners should explain why tiny inserts and unlimited retention are operational risks.

## Instructor notes

Ask learners which columns they expect dashboards to filter by most often. If they choose raw payloads or unbounded attributes, discuss storage, privacy and query cost.
