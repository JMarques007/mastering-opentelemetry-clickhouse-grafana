# Lab - Instrumentation Design and Review

## Module

Module 08 - Instrumentation

## Duration

45-60 minutes.

## Goal

Design practical OpenTelemetry instrumentation for a critical business operation and review it as if it had just been deployed to production.

The purpose of this lab is not to write a large amount of code. The purpose is to practice the decisions that make instrumentation useful: where to create spans, which attributes are safe, which metrics are worth alerting on, and which details should be left out.

## Scenario

You own a service that exposes the following operation:

```text
POST /api/checkout/{checkoutId}/authorize
```

The operation performs these steps:

1. Load checkout context.
2. Validate customer eligibility.
3. Reserve inventory.
4. Request payment authorization from an external provider.
5. Persist the final authorization result.
6. Publish an event to a message broker.

Production users report that authorization is sometimes slow and occasionally fails. The current automatic instrumentation only shows one inbound HTTP span and several database spans. The team cannot easily tell whether the slow part is inventory, payment, database persistence or event publishing.

## Part 1 - Define the production questions

Write five questions an on-call engineer would ask during an incident.

Use this format:

| Question | Why it matters |
|---|---|
| Which step contributes most to latency? | Helps decide whether to investigate application logic, database, inventory or payment dependency |

Include at least one question about latency, one about failures, one about dependency behavior and one about business outcome.

## Part 2 - Design custom spans

Define a span plan for the operation.

Recommended span names:

```text
checkout.authorize
checkout.load_context
checkout.validate_customer
checkout.reserve_inventory
checkout.request_payment_authorization
checkout.persist_authorization_result
checkout.publish_authorization_event
```

For each span, define:

| Span name | Boundary represented | Important attributes | Error handling expectation |
|---|---|---|---|
| `checkout.request_payment_authorization` | External payment dependency call | `dependency.system`, `payment.provider.type`, `authorization.result` | Mark span status as error for timeout or rejected dependency response |

## Part 3 - Choose safe attributes

Classify the following candidate attributes as `keep`, `generalize`, or `reject`.

| Candidate attribute | Decision | Reason |
|---|---|---|
| `service.name = checkout-api` | keep | Stable service identity |
| `deployment.environment = production` | keep | Required for filtering |
| `checkout.id = CHK-982736123` | reject or trace-only with strict policy | Unique business identifier; unsafe for metrics |
| `customer.email = user@example.com` | reject | Personal data |
| `customer.tier = enterprise` | keep | Low-cardinality classification |
| `payment.provider.type = card_gateway` | keep | Useful dependency classification |
| `payment.card.number = 4111111111111111` | reject | Sensitive payment data |
| `failure.category = dependency_timeout` | keep | Controlled failure classification |
| `http.route = /api/checkout/{checkoutId}/authorize` | keep | Normalized route |
| `http.url = /api/checkout/CHK-982736123/authorize?token=abc` | reject | Contains identifier and token-like query data |

Add at least five more attributes of your own.

## Part 4 - Define metrics

Create a small metric design that supports dashboards and alerts.

Minimum required metrics:

| Metric | Type | Labels | Why it exists |
|---|---|---|---|
| `checkout_authorization_requests_total` | Counter | `operation`, `result`, `failure_category` | Supports rate and error-rate calculations |
| `checkout_authorization_duration_ms` | Histogram | `operation`, `result` | Supports latency percentiles and SLO review |
| `checkout_payment_dependency_duration_ms` | Histogram | `dependency.system`, `result` | Separates payment dependency latency from total operation latency |

Rules:

- Do not use checkout id, user id, session id or request id as metric labels.
- Keep label values controlled and documented.
- Define what each metric would be used for in Grafana.

## Part 5 - Define correlated logs

Create three structured log events.

Each log event should include:

- `trace_id`;
- `span_id`;
- `service.name`;
- `business.operation`;
- safe failure classification where relevant;
- no secrets, raw payloads or personal data.

Example:

```json
{
  "level": "warning",
  "message": "Payment authorization dependency timed out",
  "service.name": "checkout-api",
  "business.operation": "checkout.authorize_payment",
  "dependency.system": "payment_gateway",
  "failure.category": "dependency_timeout",
  "trace_id": "<trace-id>",
  "span_id": "<span-id>"
}
```

## Part 6 - Review the deployed telemetry

Assume the instrumentation has been deployed. Review the following observations:

```text
Observation A: The dashboard shows 18,000 unique values for the `route` label.
Observation B: Payment timeouts are visible in logs, but the logs do not include trace ids.
Observation C: The trace waterfall clearly shows payment authorization taking 80% of request duration.
Observation D: The metric `checkout_authorization_duration_ms` includes `checkout_id` as a label.
Observation E: The span `CheckoutService.HandleAsync` appears in traces instead of a business operation name.
```

For each observation, classify it as:

- good;
- needs improvement;
- unacceptable for production.

Then explain the corrective action.

## Expected outcome

A strong solution should show that the learner can:

- design spans around business and dependency boundaries;
- explain why each signal exists;
- use safe, stable attributes;
- avoid high-cardinality metric labels;
- correlate logs with traces;
- review telemetry quality after deployment.

## Instructor notes

Use the review section to drive discussion. Learners often focus on adding more telemetry, but the goal is better telemetry. Push them to explain what they would remove, normalize or rename.

Suggested prompts:

- Which signal would trigger the first alert?
- Which signal would help during the first five minutes of an incident?
- Which field creates cost or privacy risk?
- Which span changes the investigation path?
- What would you show in Grafana for an operations audience?

## Completion checklist

- [ ] Production questions are defined.
- [ ] Custom spans are named using stable business terminology.
- [ ] Attributes are classified as safe, generalized or rejected.
- [ ] Metrics avoid high-cardinality labels.
- [ ] Logs include trace correlation fields.
- [ ] Review findings include corrective actions.
